package it.othala.service;

import it.othala.account.execption.MailNotSendException;
import it.othala.dao.interfaces.IMessagelIpnDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.MessageIpnDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;
import it.othala.payment.paypal.dto.DoExpressCheckoutPaymentDTO;
import it.othala.payment.paypal.dto.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.dto.OrderPayPalDTO;
import it.othala.payment.paypal.dto.SetExpressCheckoutDTO;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalIpnErrorException;
import it.othala.payment.paypal.exception.PayPalIpnInvalidException;
import it.othala.service.interfaces.IMailService;
import it.othala.service.interfaces.IOrderService;
import it.othala.service.interfaces.IPaymentService;
import it.othala.service.template.Template;
import it.othala.service.template.Template.TipoTemplate;
import it.othala.util.OthalaCommonUtils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import paypalnvp.core.PayPal.Environment;
import paypalnvp.profile.BaseProfile;
import paypalnvp.profile.Profile;

public class PaymentService implements IPaymentService {

	private IOrderService orderService;
	private IMailService mailService;
	private IMessagelIpnDAO messageIpnDAO;
	private PayPalWrapper wrapper;
	private ProfilePayPalDTO profilePayPal;

	public void setMessageIpnDAO(IMessagelIpnDAO messageIpnDAO) {
		this.messageIpnDAO = messageIpnDAO;
	}

	public void setMailService(IMailService mailService) {
		this.mailService = mailService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

	private Log log = LogFactory.getLog(PaymentService.class);

	private void insertMessage(MessageIpnDTO ipnDTO) {
		// TODO Auto-generated method stub
		messageIpnDAO.insertMessageIpn(ipnDTO);
	}

	private boolean exitsIdTransaction(long idOrder, String idTransaction) {
		// TODO Auto-generated method stub
		return messageIpnDAO.getIdTransaction(idOrder, idTransaction) > 0;

	}

	@Override
	public void processIpnMessage(String originalRequest, String mc_gross, String mc_currency, String payment_status,
			ProfilePayPalDTO profile,MailPropertiesDTO mailProps) throws PayPalException, PayPalIpnErrorException {

		String responseRequest = originalRequest + "&cmd=_notify-validate";
		StringBuilder sb = new StringBuilder();
		boolean errorFormalMessage = false;

		try {
			// resend message to PayPal for securiry protocol
			HashMap<String, String> respMap = getWrapper(profile).getNotificationIPN(responseRequest);

			// check that txn_id has not been previously processed
			String txn_id = respMap.get("txn_id");
			int idOrder = Integer.valueOf(respMap.get("custom"));
			if (!exitsIdTransaction(idOrder, txn_id)) {

				// recupero i dettagli dell'ordine
				OrderFullDTO order = orderService.getOrders(idOrder, null, null).get(0);

				// check that receiver_email is your Primary PayPal email
				String emailMerchant = profile.getUserName();
				String receiver_email = respMap.get("receiver_email");
				if (!emailMerchant.equalsIgnoreCase(receiver_email)) {
					sb.append(String.format(
							"messagio non elaborato: emailMerchant %s diversa dalla mail %s presente nel messaggio %s",
							emailMerchant, receiver_email, originalRequest));
					errorFormalMessage = true;
				}

				// check that payment_amount/payment_currency are correct
				BigDecimal mc_grossBD = new BigDecimal(mc_gross);
				if (order.getImOrdine().compareTo(mc_grossBD) != 0) {
					sb.append(String.format(
							"messagio non elaborato: importo db %s diverso dalla importo %s presente nel messaggio %s",
							order.getImOrdine(), mc_gross, order.getImOrdine(), originalRequest));
					errorFormalMessage = true;
				}
				if (mc_currency != "EUR") {
					sb.append(String
							.format("messagio non elaborato:divisa accetta %s diversa dalla divisa %s presente nel messaggio %s",
									"EUR", mc_currency, originalRequest));
					errorFormalMessage = true;
				}

				// inserisco il messaggio
				MessageIpnDTO ipnMessage = new MessageIpnDTO();
				ipnMessage.setIdOrder(order.getIdOrder());
				ipnMessage.setFgElaborato(!errorFormalMessage);
				ipnMessage.setIdTransaction(txn_id);
				ipnMessage.setTxMessage(originalRequest);
				ipnMessage.setTxStato(payment_status);
				ipnMessage.setTxNote(sb.toString());
				insertMessage(ipnMessage);

				if (errorFormalMessage) {
					log.error(String.format("Messagio %s non elaborato, ci sono errori formali", "txn_id"));
					return;
				}

				// message is correct, process message
				TypeStateOrder state = TypeStateOrder.valueOf(payment_status);
				orderService.updateStateOrder(idOrder, order, state);
				if (isPaymentKO(payment_status)) {
					// inviare una mail in cui si comunica che PayPal non ha
					// accettato il pagamento
					try {
						sendMailRefusedPayment(order,mailProps);
					} catch (MailNotSendException e) {
						// TODO Auto-generated catch block
						log.error(String.format("errore nell'invio della mail di rifuto", order.getIdOrder()), e);
					}
				} else if (isPaymentCompleted(payment_status)) {
					// inviare una mail in cui si comunica che PayPal ha
					// accettato il pagamento
					try {
						sendMailAcceptedPyamentAfterPending(order,mailProps);
					} catch (MailNotSendException e) {
						// TODO Auto-generated catch block
						log.error(
								String.format("errore nell'invio della mail di accettazione pagamento",
										order.getIdOrder()), e);
					}
				} else {
					// nessuna elaborazione da fare
					log.error(String
							.format("stato del messaggio %s, per il transactionId %s, non ammesso. Nessuna elaborazione da fare, messaggio %s",
									payment_status, txn_id, originalRequest));
				}

				return;

			} else {
				// messaggio già elaborato
				log.error(String.format("transactionId %s del messaggio %s già elaborato ", txn_id, originalRequest));
				return;
			}

		} catch (PayPalIpnInvalidException e) {
			// TODO Auto-generated catch block
			log.error("invalid nella ricezione IPN da paypal, messaggion non corretto", e);
		} catch (PayPalIpnErrorException e) {
			// TODO Auto-generated catch block
			log.error("stringa non prevista nella ricezione IPN da paypal", e);
			throw e;
		} catch (PayPalException e) {
			// TODO Auto-generated catch block
			log.error("errore imprevisto sull'invio del messaggio IPN verso paypal", e);
			throw e;
		}
	}

	@Override
	public boolean isPaymentKO(TypeStateOrder state) {
		// TODO Auto-generated method stub

		switch (state) {
		case DENIED:
		case FAILED:
		case EXPIRED:
			return true;

		default:
			return false;
		}
	}

	public boolean isPaymentKO(String paypalStatus) {
		// TODO Auto-generated method stub
		TypeStateOrder state = TypeStateOrder.valueOf(paypalStatus);

		return isPaymentKO(state);
	}

	@Override
	public boolean isPaymentPending(String paypalStatus) {
		// TODO Auto-generated method stub
		TypeStateOrder state = TypeStateOrder.valueOf(paypalStatus);

		switch (state) {
		case PENDING:
		case PROCESSED:
			return true;

		default:
			return false;
		}
	}

	@Override
	public boolean isPaymentCompleted(String paypalStatus) {
		// TODO Auto-generated method stub
		TypeStateOrder state = TypeStateOrder.valueOf(paypalStatus);

		switch (state) {
		case COMPLETED:
		case REFUNDED:
			return true;

		default:
			return false;
		}
	}

	@Override
	public void sendMailRefusedPayment(OrderFullDTO order,MailPropertiesDTO mailProps) throws MailNotSendException {
		// TODO Auto-generated method stub
		String content = null;
		String mail = order.getIdUser();
		try {
			content = Template.getContenFile(TipoTemplate.MailIPNRefusePayment);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}

		content = content.replaceAll("<COMPANY_NAME>",
				mailProps.getCompanyName());
		content = content.replaceAll("<NAME>", order.getNameUser() + " " + order.getSurnameUser());
		content = content.replaceAll("<idTransazione>", order.getIdTransaction());
		content = content.replaceAll("<idOrder>", String.valueOf(order.getIdOrder()));
		content = content.replaceAll("<importo>", OthalaCommonUtils.getImporto(order.getImOrdine()));
		
		String subject = "Pagamento Rifiutato ";
		subject += mailProps.getCompanyName();

		mailService.inviaMail(new String[] { mail }, subject, content,mailProps);
	}

	@Override
	public void sendMailAcceptedPyamentAfterPending(OrderFullDTO order,MailPropertiesDTO mailProps) throws MailNotSendException {
		// TODO Auto-generated method stub
		String content = null;
		String mail = order.getIdUser();
		try {
			content = Template.getContenFile(TipoTemplate.MailIPNAcceptedPaymemtAfetPending);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}

		content = content.replaceAll("<COMPANY_NAME>",
				mailProps.getCompanyName());
		content = content.replaceAll("<NAME>", order.getNameUser() + " " + order.getSurnameUser());
		content = content.replaceAll("<idTransazione>", order.getIdTransaction());
		content = content.replaceAll("<idOrder>", String.valueOf(order.getIdOrder()));
		content = content.replaceAll("<importo>", OthalaCommonUtils.getImporto(order.getImOrdine()));
		

		String subject = "Pagamento Rifiutato ";
		subject += mailProps.getCompanyName();

		mailService.inviaMail(new String[] { mail }, subject, content,mailProps);
	}

	// TODO Auto-generated method stub

	@Override
	public void sendMailRefundedPayment(OrderFullDTO order,MailPropertiesDTO mailProps) {
		// TODO Auto-generated method stub

	}

	@Override
	public void sendMailAcceptedPyament(OrderFullDTO order, MailPropertiesDTO mailDTO, String status)
			throws MailNotSendException {
		TypeStateOrder state = TypeStateOrder.valueOf(status);
		URL res = Thread.currentThread().getContextClassLoader().getResource("");
		Map<String, String> inlineImages = new HashMap<String, String>();
		String basePath = res.getPath().replace("/WEB-INF/classes", "");
		basePath = basePath.replace("/", "");
		String html = generateHtmlOrder(order, mailDTO, inlineImages, state);

		mailService.inviaHTMLMail(new String[] { order.getIdUser() }, "Conferma Ordine", html, inlineImages,mailDTO);
	}

	private String generateHtmlOrder(OrderFullDTO order, MailPropertiesDTO mailDTO, Map<String, String> inlineImages,
			TypeStateOrder state) {
		BufferedWriter out = null;
		FileWriter fstream = null;

		try {

			File xslFile = Template.getFile("it/othala/service/template/mailConfermaOrdine.xsl");
			File xmlTemp = File.createTempFile("xmlTemp", ".xml");
			fstream = new FileWriter(xmlTemp);

			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(xmlTemp), "UTF8"));

			out.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
			out.write("<order>");
			out.write("<imgLogo>");
			out.write("cid:imageLogo");
			inlineImages.put("imageLogo", mailDTO.getPathImgLogo());
			out.write("</imgLogo>");

			out.write("<customer>");
			out.write("<name>" + order.getNameUser() + "</name>");
			out.write("<mail>" + order.getIdUser() + "</mail>");
			out.write("<surname>" + order.getSurnameUser() + "</surname>");
			out.write("</customer>");

			out.write("<number>" + order.getIdOrder() + "</number>");
			out.write("<transaction>" + order.getIdTransaction() + "</transaction>");
			if (state.getState() == TypeStateOrder.PENDING.getState()) {
				out.write("<pending>true</pending>");
			} else {
				out.write("<pending>false</pending>");
			}

			out.write("<imgPayment>");
			out.write("cid:imgPayment");
			out.write("</imgPayment>");
			inlineImages.put("imgPayment", mailDTO.getPathImgPayment());
			out.write("<deliveryCost>" + order.getSpeseSpedizione().getImportoSpese() + "</deliveryCost>");
			out.write("<totalCost>" + order.getImOrdine() + "</totalCost>");

			out.write("<billingAddress>");
			out.write("<name>" + order.getBillingAddress().getNome() + "</name>");
			out.write("<surname>" + order.getBillingAddress().getCognome() + "</surname>");
			out.write("<telefono>" + order.getBillingAddress().getTel() + "</telefono>");
			out.write("<street>" + order.getBillingAddress().getVia() + "</street>");
			out.write("<zipCode>" + order.getBillingAddress().getCap() + "</zipCode>");
			out.write("<city>" + order.getBillingAddress().getComune() + "</city>");
			out.write("<prov>" + order.getBillingAddress().getProvincia() + "</prov>");
			out.write("</billingAddress>");
			out.write("<shippingAddress>");
			out.write("<name>" + order.getShippingAddress().getNome() + "</name>");
			out.write("<surname>" + order.getShippingAddress().getCognome() + "</surname>");
			out.write("<tel>" + order.getShippingAddress().getTel() + "</tel>");
			out.write("<street>" + order.getShippingAddress().getVia() + "</street>");
			out.write("<zipCode>" + order.getShippingAddress().getCap() + "</zipCode>");
			out.write("<city>" + order.getShippingAddress().getComune() + "</city>");
			out.write("<prov>" + order.getShippingAddress().getProvincia() + "</prov>");
			out.write("</shippingAddress>");

			out.write("<cart>");
			int i = 0;
			for (ArticleFullDTO art : order.getCart()) {
				if (art != null) {
					out.write("<item>");
					out.write("<number>" + art.getPrdFullDTO().getIdProduct() + "</number>");
					out.write("<img>cid:imgArt" + i + "</img>");
					inlineImages.put("imgArt" + i, mailDTO.getBasePathThumbinalsArticle() + art.getThumbnailsUrl());
					out.write("<brand>" + art.getPrdFullDTO().getTxBrand() + "</brand>");
					out.write("<description>" + art.getPrdFullDTO().getDescription() + "</description>");
					out.write("<color>" + art.getTxColor() + "</color>");
					out.write("<size>" + art.getTxSize() + "</size>");
					out.write("<unitPrice>" + art.getPrdFullDTO().getRealPrice() + "</unitPrice>");
					out.write("<quantity>" + art.getQtBooked() + "</quantity>");
					out.write("<price>" + art.getTotalPriced() + "</price>");
					out.write("</item>");
					i++;
				}
			}
			out.write("</cart>");
			out.write("</order>");
			out.close();
			fstream.close();

			// scrivo il file xml temporaneo

			File htmlTemp = File.createTempFile("htmlTemp", ".html");

			// effetto la conversione xml,xsl to html scrivo il file html
			// temporaneo
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Source xslSource = new javax.xml.transform.stream.StreamSource(xslFile);
			Source xmlSource = new javax.xml.transform.stream.StreamSource(xmlTemp);
			javax.xml.transform.stream.StreamResult result = new StreamResult(htmlTemp);
			Transformer transformer;
			transformer = tFactory.newTransformer(xslSource);
			transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
			transformer.transform(xmlSource, result);

			String html = IOUtils.toString(new FileInputStream(htmlTemp), "UTF-8");

			return html;

		} catch (Exception e) {
			log.error("errore formattazione html per invio mail", e);
			return null;
		} finally {
			if (out != null)
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					log.error("errore chiusura outstream", e);
				}
			if (fstream != null)
				try {
					fstream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					log.error("errore chiusura fstream", e);
				}

		}

	}

	@Override
	public SetExpressCheckoutDTO setExpressCheckout(OrderFullDTO order, ProfilePayPalDTO profile)
			throws MalformedURLException, UnsupportedEncodingException, OthalaException {
		// TODO Auto-generated method stub
		
		//inserisco l'ordine
		order=orderService.insertOrder(order);
		
		//costruisco la busta per PayPal
		OrderPayPalDTO ordPayPal=valueOf(profile, order);
		
		SetExpressCheckoutDTO chechDTO=getWrapper(profile).setExpressCheckout(ordPayPal);
		return chechDTO;
		
	}

	@Override
	public DoExpressCheckoutPaymentDTO doExpressCheckoutPayment(GetExpressCheckoutDetailsDTO details,
			ProfilePayPalDTO profile) throws PayPalFundingFailureException, PayPalException, PayPalFailureException {
		// TODO Auto-generated method stub
		return getWrapper(profile).doExpressCheckoutPayment(details);
	}
 
	@Override
	public GetExpressCheckoutDetailsDTO getExpressCheckoutDetails(String token, ProfilePayPalDTO profile)
			throws MalformedURLException, UnsupportedEncodingException, PayPalException {
		// TODO Auto-generated method stub
		return getWrapper(profile).getExpressCheckoutDetails(token);
	}

	private PayPalWrapper getWrapper(ProfilePayPalDTO profile) {
		if (wrapper == null) {
			this.profilePayPal=profile;
			Profile prof = new BaseProfile.Builder(profile.getUserName(), profile.getPassword()).signature(
					profile.getSignature()).build();
			Environment env = PayPalWrapper.getEnvironment(profile.getEnvironment());
			wrapper = new PayPalWrapper(env, prof);
		}
		return wrapper;

	}
	
	private OrderPayPalDTO valueOf(ProfilePayPalDTO profile,OrderFullDTO order)
	{	
		OrderPayPalDTO ordPp = new OrderPayPalDTO();
		ordPp.setAricles(order.getCart());		
		ordPp.setDeliveryCost(order.getSpeseSpedizione());
		ordPp.setIdOrder(order.getIdOrder().toString());
		BigDecimal totItem = BigDecimal.ZERO;
		for (ArticleFullDTO art : order.getCart()) {
			totItem = totItem.add(art.getTotalPriced());
		}
		ordPp.setTotalItemOrder(totItem);
		ordPp.setTotalPriceOrder(order.getImOrdine());
		
		ordPp.setCancelUrl(profile.getCancelUrl());
		ordPp.setImageUrl(profile.getImageUrl());
		ordPp.setLocale(profile.getLang());
		ordPp.setRedirectUrl(profile.getRedirectUrl());
		ordPp.setReturnUrl(profile.getReturnUrl());
		return ordPp;
	}
	
	
	
}
