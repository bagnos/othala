package it.othala.service;

import it.othala.account.execption.MailNotSendException;
import it.othala.dao.interfaces.IMessagelIpnDAO;
import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.ArticleRefounded;
import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.MessageIpnDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;
import it.othala.external.service.interfaces.IOthalaExternalServices;
import it.othala.payment.paypal.dto.DoExpressCheckoutPaymentDTO;
import it.othala.payment.paypal.dto.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.dto.IpnDTO;
import it.othala.payment.paypal.dto.OrderPayPalDTO;
import it.othala.payment.paypal.dto.RefundTransactionDTO;
import it.othala.payment.paypal.dto.SetExpressCheckoutDTO;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalIpnErrorException;
import it.othala.payment.paypal.exception.PayPalIpnInvalidException;
import it.othala.payment.paypal.exception.PayPalPostPaymentException;
import it.othala.payment.paypal.exception.PayPalPostRefundPaymentException;
import it.othala.service.factory.OthalaFactory;
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
import java.math.BigDecimal;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	private IProductDAO productDAO;
	private IOthalaExternalServices externalService;

	public void setMessageIpnDAO(IMessagelIpnDAO messageIpnDAO) {
		this.messageIpnDAO = messageIpnDAO;
	}

	public void setProductDAO(IProductDAO productDAO) {
		this.productDAO = productDAO;
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

	private boolean exitsIdTransaction(String idTransaction,String txStato) {
		// TODO Auto-generated method stub
		return messageIpnDAO.getIdTransaction(idTransaction,txStato) > 0;

	}

	@Override
	public void processIpnMessage(String originalRequest, ProfilePayPalDTO profile, MailPropertiesDTO mailProps)
			throws PayPalException, PayPalIpnErrorException {

		log.info("IPN Original Request:" + originalRequest);
		String responseRequest = originalRequest + "&cmd=_notify-validate";
		StringBuilder sb = new StringBuilder();
		boolean errorFormalMessage = false;
		OrderFullDTO order = null;

		try {
			// resend message to PayPal for securiry protocol
			HashMap<String, String> responseMap = getWrapper(profile).getNotificationIPN(responseRequest);
			IpnDTO ipnDTO = valueOf(responseMap);
			log.info(String.format("prosessIpnMessage, ipnDTO: %s", ipnDTO.toString()));

			// check that txn_id has not been previously processed
			String txn_id = ipnDTO.getTxn_id();
			Integer idOrder = Integer.valueOf(ipnDTO.getCustom());
			TypeStateOrder state = TypeStateOrder.fromString(ipnDTO.getPayment_status());
			if (!exitsIdTransaction(txn_id,ipnDTO.getPayment_status())) {

				// check that receiver_email is your Primary PayPal email
				String recEmailMerchant = profile.getReceiverEmail();
				String receiver_email = ipnDTO.getReceiver_email();
				if (!recEmailMerchant.trim().equalsIgnoreCase(receiver_email)) {
					sb.append(String.format(
							"messagio non elaborato: emailMerchant %s diversa dalla mail %s presente nel messaggio %s",
							recEmailMerchant, receiver_email, ipnDTO.toString()));
					errorFormalMessage = true;
				}

				if (!ipnDTO.getMc_currency().trim().equalsIgnoreCase("EUR")) {
					sb.append(String
							.format("messagio non elaborato:divisa accettata %s diversa dalla divisa %s presente nel messaggio %s",
									"EUR", ipnDTO.getMc_currency(), ipnDTO.toString()));
					errorFormalMessage = true;
				}

				if (errorFormalMessage) {
					log.error(String.format("Messagio %s non elaborato, ci sono errori formali: %s",
							ipnDTO.getTxn_id(), sb.toString()));
					return;
				}

				// inserisco il messaggio
				MessageIpnDTO ipnMessage = new MessageIpnDTO();
				ipnMessage.setIdOrder(idOrder);
				ipnMessage.setFgElaborato(!errorFormalMessage);
				ipnMessage.setIdTransaction(txn_id);
				ipnMessage.setTxMessage(ipnDTO.toString());
				ipnMessage.setTxStato(ipnDTO.getPayment_status());
				ipnMessage.setTxNote(sb.toString());
				insertMessage(ipnMessage);

				// verifica se richiesta di rimborso
				if (ipnDTO.getParent_txn_id() != null && ipnDTO.getReason_code().equalsIgnoreCase("refund")) {
					log.info("refund trovato txtId = " + ipnDTO.getParent_txn_id());
					try {
						updateStateRefund(ipnDTO.getPayment_status(), null, ipnDTO.getParent_txn_id(), null, null,
								mailProps);
					} catch (MailNotSendException e) {
						// TODO Auto-generated catch block
						log.error("errore nell'invio della mail per il conferma rimborso", e);
					}
					return;
				}

				// è presente un ordine, recupero i dettagli
				if (idOrder != null) {
					order = orderService.getOrders(idOrder, null, null, null).get(0);
					// check that payment_amount/payment_currency are correct
					BigDecimal mc_grossBD = new BigDecimal(ipnDTO.getMc_gross());
					if (order.getImOrdine().compareTo(mc_grossBD.abs()) != 0) {
						sb.append(String
								.format("messagio non elaborato: importo db %s diverso dalla importo %s presente nel messaggio %s",
										order.getImOrdine(), ipnDTO.getMc_gross(), ipnDTO.toString()));
						errorFormalMessage = true;
					}
				}

				// message is correct, process message
				

				if (isPaymentKO(ipnDTO.getPayment_status())) {
					// inviare una mail in cui si comunica che PayPal non ha
					// accettato il pagamento
					if (idOrder != null) {
						// siamo nel caso di express checkout
						orderService.increaseQtaArticle(order, state);
						try {

							sendMailRefusedPayment(order, mailProps);
						} catch (MailNotSendException e) {
							// TODO Auto-generated catch block
							log.error(String.format("errore nell'invio della mail di rifuto", order.getIdOrder()), e);
						}
					}
				} else if (isPaymentCompleted(ipnDTO.getPayment_status())) {
					// inviare una mail in cui si comunica che PayPal ha
					// accettato il pagamento
					if (idOrder != null) {
						int oldState = order.getIdStato();
						log.info(String.format("Old state %d ", oldState));
						orderService.updateStateOrder(idOrder, order, state);
						try {
							if (oldState != TypeStateOrder.COMPLETEDFUNDSHELD.getState()) {
								// questo stato è gia considerato completed, non
								// ha senso reinviare la mail;
								sendMailAcceptedPyamentAfterPending(order, mailProps, state);
							}
						} catch (MailNotSendException e) {
							// TODO Auto-generated catch block
							log.error(
									String.format("errore nell'invio della mail di accettazione pagamento",
											order.getIdOrder()), e);
						}

					}
				}

				else {
					// nessuna elaborazione da fare
					log.error(String
							.format("stato del messaggio %s, per il transactionId %s, non ammesso. Nessuna elaborazione da fare, messaggio %s",
									ipnDTO.getPayment_status(), ipnDTO.getTxn_id(), ipnDTO.toString()));

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

	private IpnDTO valueOf(HashMap<String, String> req) {
		IpnDTO ipnDTO = new IpnDTO();
		ipnDTO.setCustom(req.get("custom"));
		ipnDTO.setMc_currency(req.get("mc_currency"));
		ipnDTO.setMc_gross(req.get("mc_gross"));
		ipnDTO.setPayment_status(req.get("payment_status"));
		ipnDTO.setReceiver_email(req.get("receiver_email"));
		ipnDTO.setTxn_id(req.get("txn_id"));
		ipnDTO.setParent_txn_id(req.get("parent_txn_id"));
		ipnDTO.setReason_code(req.get("reason_code"));
		return ipnDTO;
	}

	public boolean isPaymentKO(String paypalStatus) {
		// TODO Auto-generated method stub

		if (paypalStatus.equalsIgnoreCase("DENIED")) {
			return true;
		}

		if (paypalStatus.equalsIgnoreCase("FAILED")) {
			return true;
		}

		if (paypalStatus.equalsIgnoreCase("EXPIRED")) {
			return true;
		}

		if (paypalStatus.equalsIgnoreCase("REVERSED")) {
			return true;
		}

		return false;

	}

	public boolean isPaymentPending(String paypalStatus) {
		// TODO Auto-generated method stub

		if (paypalStatus.equalsIgnoreCase("PENDING")) {
			return true;
		}

		if (paypalStatus.equalsIgnoreCase("PROCESSED")) {
			return true;
		}

		if (paypalStatus.equalsIgnoreCase("DELAYED")) {
			return true;
		}

		return false;

	}

	public boolean isPaymentCompleted(String paypalStatus) {
		// TODO Auto-generated method stub
		if (paypalStatus.equalsIgnoreCase("COMPLETED") || paypalStatus.equalsIgnoreCase("COMPLETED_FUNDS_HELD")) {
			return true;
		}

		return false;

	}

	public boolean isPaymenRefunded(String paypalStatus) {
		// TODO Auto-generated method stub
		if (paypalStatus.equalsIgnoreCase("REFUNDED")) {
			return true;
		}

		return false;

	}
	
	public boolean isPaymenInstant(String paypalStatus) {
		// TODO Auto-generated method stub
		if (paypalStatus.equalsIgnoreCase("instant")) {
			return true;
		}

		return false;

	}
	
	

	@Override
	public void sendMailRefusedPayment(OrderFullDTO order, MailPropertiesDTO mailProps) throws MailNotSendException {
		// TODO Auto-generated method stub
		String content = null;
		String mail = order.getIdUser();
		try {
			content = Template.getContenFile(TipoTemplate.MailIPNRefusePayment);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}

		content = content.replaceAll("<COMPANY_NAME>", mailProps.getCompanyName());
		content = content.replaceAll("<NAME>", order.getNameUser() + " " + order.getSurnameUser());
		content = content.replaceAll("<idTransazione>", order.getIdTransaction());
		content = content.replaceAll("<idOrder>", String.valueOf(order.getIdOrder()));
		content = content.replaceAll("<importo>", OthalaCommonUtils.getImporto(order.getImOrdine()));

		String subject = "Pagamento Rifiutato ";
		subject += mailProps.getCompanyName();

		mailService.inviaMail(new String[] { mail }, subject, content, mailProps);
	}

	@Override
	public void sendMailAcceptedPyamentAfterPending(OrderFullDTO order, MailPropertiesDTO mailProps,
			TypeStateOrder state) throws MailNotSendException {
		// TODO Auto-generated method stub
		String content = null;
		String mail = order.getIdUser();
		try {
			content = Template.getContenFile(TipoTemplate.MailIPNAcceptedPaymemtAfetPending);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}

		content = content.replaceAll("<COMPANY_NAME>", mailProps.getCompanyName()==null?"":mailProps.getCompanyName());
		content = content.replaceAll("<NAME>", order.getNameUser() + " " + order.getSurnameUser());
		content = content.replaceAll("<idTransazione>", order.getIdTransaction());
		content = content.replaceAll("<idOrder>", String.valueOf(order.getIdOrder()));
		content = content.replaceAll("<importo>", OthalaCommonUtils.getImporto(order.getImOrdine()));

		String subject = "Pagamento Accettato ";
		subject += mailProps.getCompanyName();

		mailService.inviaMail(new String[] { mail }, subject, content, mailProps);
		// invia le mail al cliente e ai negozi sUll'avvenuta ricezione
		// delpagamento
		sendMailAcceptedPyament(order, mailProps, TypeStateOrder.getDescrState(state.getState()));
	}

	// TODO Auto-generated method stub

	@Override
	public void sendMailRefundedPayment(OrderFullDTO order, MailPropertiesDTO mailProps) {
		// TODO Auto-generated method stub

	}

	@Override
	public void sendMailAcceptedPyament(OrderFullDTO order, MailPropertiesDTO mailDTO, String status)
			throws MailNotSendException {
		TypeStateOrder state = TypeStateOrder.fromString(status);
		URL res = Thread.currentThread().getContextClassLoader().getResource("");
		Map<String, String> inlineImages = new HashMap<String, String>();
		String basePath = res.getPath().replace("/WEB-INF/classes", "");
		basePath = basePath.replace("/", "");
		String template=Template.getNomeFile("mailConfermaOrdine", order.getShippingAddress().getNazione());
		String html = generateHtmlOrder(order, mailDTO, inlineImages, state, template, null);

		String oggetto = null;
		if (state == TypeStateOrder.SPEDITO) {
			oggetto = "Spedizione ordine";
		} else {
			oggetto = "Conferma ordine";
		}

		mailService.inviaHTMLMail(new String[] { order.getIdUser() }, oggetto, html, inlineImages, mailDTO,true);

		List<ShopDTO> lsShop = productDAO.listShop();
		if (state == TypeStateOrder.SPEDITO) {

		} else {
/*			for (ArticleFullDTO art : order.getCart()) {
		
				ShopDTO shopStock = externalService.getShopStock(art.getPrdFullDTO().getIdProduct(), art.getPgArticle(), art.getTxBarCode());
				
				art.getShop().setIdShop(shopStock.getIdShop());
				art.getShop().setTxShop(shopStock.getTxShop());
					
			}*/
			
			html = generateHtmlOrder(order, mailDTO, inlineImages, state, "mailInserimentoOrdine", lsShop.get(0).getIdShop());
			
			mailService.inviaHTMLMail(new String[] { lsShop.get(0).getTxMail() }, "Nuovo Ordine WEB",
					html, inlineImages, mailDTO,true);
			
			//Cambiare
			//Creare un metodo doppio in externalservice che tira fuori nel caso del deg il magazzino con maggior capienza
			//nel caso normale il negozio
			//Poi
			//Per ogni articolo va preso il magazzino con maggior capienza e mandata la mail per deg
			//Per ogni articolo mandare la mail al negozio
			// invia la mai di notifica ordine ai negozi
			/*List<ShopDTO> lstShop = new ArrayList<ShopDTO>();
			lstShop = productDAO.listShop();
			for (int i = 0; i < lstShop.size(); i++) {
				for (ArticleFullDTO art : order.getCart()) {
					if (art.getShop().getIdShop() == lstShop.get(i).getIdShop()) {
						html = generateHtmlOrder(order, mailDTO, inlineImages, state, "mailInserimentoOrdine", lstShop
								.get(i).getIdShop());
						mailService.inviaHTMLMail(new String[] { lstShop.get(i).getTxMail() }, "Nuovo Ordine WEB",
								html, inlineImages, mailDTO, true);
						break;
					}
				}
			}*/
		}

	}

	private String generateHtmlOrder(OrderFullDTO order, MailPropertiesDTO mailDTO, Map<String, String> inlineImages,
			TypeStateOrder state, String xslTemplate, Integer idShop) {
		BufferedWriter out = null;
		FileWriter fstream = null;

		try {

			File xslFile = Template.getFile("it/othala/service/template/" + xslTemplate + ".xsl");
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
				if (state.getState() == TypeStateOrder.SPEDITO.getState()) {
					out.write("<pending>spedito</pending>");
				} else {
					out.write("<pending>false</pending>");
				}
			}

			out.write("<imgPayment>");
			out.write("cid:imgPayment");
			out.write("</imgPayment>");
			inlineImages.put("imgPayment", mailDTO.getPathImgPayment());
			String spese = order.getSpeseSpedizione().getImportoSpese().compareTo(BigDecimal.ZERO) == 0 ? "0" : order
					.getSpeseSpedizione().getImportoSpese().toString();
			out.write("<deliveryCost>" + spese + "</deliveryCost>");
			out.write("<totalCost>" + order.getImOrdine() + "</totalCost>");

			out.write("<billingAddress>");
			out.write("<name><![CDATA[" + order.getBillingAddress().getNome() + "]]></name>");
			out.write("<surname><![CDATA[" + order.getBillingAddress().getCognome() + "]]></surname>");
			out.write("<telefono>" + order.getBillingAddress().getTel() + "</telefono>");
			out.write("<street>" + order.getBillingAddress().getVia() + "</street>");
			out.write("<zipCode>" + order.getBillingAddress().getCap() + "</zipCode>");
			out.write("<city>" + order.getBillingAddress().getComune() + "</city>");
			out.write("<prov>" + order.getBillingAddress().getProvincia() + "</prov>");
			out.write("<country>" + order.getBillingAddress().getNazione() + "</country>");
			out.write("</billingAddress>");
			out.write("<shippingAddress>");
			out.write("<name><![CDATA[" + order.getShippingAddress().getNome() + "]]></name>");
			out.write("<surname><![CDATA[" + order.getShippingAddress().getCognome() + "]]></surname>");
			out.write("<tel>" + order.getShippingAddress().getTel() + "</tel>");
			out.write("<street>" + order.getShippingAddress().getVia() + "</street>");
			out.write("<zipCode>" + order.getShippingAddress().getCap() + "</zipCode>");
			out.write("<city>" + order.getShippingAddress().getComune() + "</city>");
			out.write("<prov>" + order.getShippingAddress().getProvincia() + "</prov>");
			out.write("<country>" + order.getShippingAddress().getNazione() + "</country>");
			out.write("</shippingAddress>");

			out.write("<cart>");
			int i = 0;
			for (ArticleFullDTO art : order.getCart()) {
				if (art != null && idShop == null || art != null && idShop == art.getShop().getIdShop()) {

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
					out.write("<price>" + art.getPriceDiscounted().multiply(new BigDecimal(art.getQtBooked())) + "</price>");
					
					ShopDTO shopStock = externalService.getShopStock(art.getPrdFullDTO().getIdProduct(), art.getPgArticle(), art.getTxBarCode());
					
					out.write("<idshop>" + shopStock.getIdShop().toString() + "</idshop>");
					out.write("<desshop>" + shopStock.getTxShop() + "</desshop>");
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
			throws PayPalException, PayPalFailureException, OthalaException {
		// TODO Auto-generated method stub

		// inserisco l'ordine
		order = orderService.insertOrder(order);

		// costruisco la busta per PayPal
		OrderPayPalDTO ordPayPal = valueOf(profile, order);

		SetExpressCheckoutDTO chechDTO = getWrapper(profile).setExpressCheckout(ordPayPal);
		return chechDTO;

	}

	@Override
	public DoExpressCheckoutPaymentDTO doExpressCheckoutPayment(GetExpressCheckoutDetailsDTO details,
			ProfilePayPalDTO profile, OrderFullDTO order) throws PayPalFundingFailureException, PayPalException,
			PayPalFailureException, StockNotPresentException, PayPalPostPaymentException {
		// TODO Auto-generated method stub

		// VERIFICO LA GIACENZA
		orderService.checkQtaInStock(order.getIdOrder(), order);

		// effettuo il doCheckOut, si paga...
		DoExpressCheckoutPaymentDTO checkDTO = getWrapper(profile).doExpressCheckoutPayment(details,
				profilePayPal.getNotifyUrl(), profilePayPal.getRedirectUrl());
		order.setIdTransaction(checkDTO.getPAYMENTINFO_0_TRANSACTIONID());
		order.setIdStato(TypeStateOrder.fromString(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS()).getState());
		order.setPendingReason(checkDTO.getPAYMENTINFO_0_PENDINGREASON());

		try {
			// aggiorno l'ordine con lo stato, se completed o pending facciamo
			// anche
			// il decremento della qta
			TypeStateOrder state = TypeStateOrder.fromString(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS());
			log.info(String.format("stato PayPal %s- stato Othala %s", checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS(),
					Integer.toString(state.getState())));
			if (isPaymentCompleted(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS())
					|| isPaymentPending(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS())) {
				orderService.confirmOrderPayment(order);
			} else {
				orderService.updateStateOrder(order.getIdOrder(), order, state);
			}

			// salvo il messaggio			
			MessageIpnDTO ipn = new MessageIpnDTO();
			ipn.setFgElaborato(false);
			ipn.setIdOrder(order.getIdOrder());
			ipn.setIdTransaction(order.getIdTransaction());
			ipn.setTxMessage(checkDTO.getOkMessage());
			if (state.getState() == TypeStateOrder.PENDING.getState()) {
				ipn.setTxNote(checkDTO.getPAYMENTINFO_0_PENDINGREASON());
			}

			ipn.setTxStato(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS());
			messageIpnDAO.insertMessageIpn(ipn);

		} catch (Throwable e) {
			log.error("errore PaymentService dopo il pagamento", e);
			throw new PayPalPostPaymentException(e, order.getIdOrder(), "errore nel docheckout dopo il pagamento");
		}
		return checkDTO;
	}

	@Override
	public GetExpressCheckoutDetailsDTO getExpressCheckoutDetails(String token, ProfilePayPalDTO profile)
			throws PayPalException, PayPalFailureException {
		// TODO Auto-generated method stub
		return getWrapper(profile).getExpressCheckoutDetails(token);
	}

	private PayPalWrapper getWrapper(ProfilePayPalDTO profile) {
		if (wrapper == null) {
			this.profilePayPal = profile;
			Profile prof = new BaseProfile.Builder(profile.getUserName(), profile.getPassword()).signature(
					profile.getSignature()).build();
			Environment env = PayPalWrapper.getEnvironment(profile.getEnvironment());
			wrapper = new PayPalWrapper(env, prof);

		}
		return wrapper;

	}

	private OrderPayPalDTO valueOf(ProfilePayPalDTO profile, OrderFullDTO order) {
		OrderPayPalDTO ordPp = new OrderPayPalDTO();
		ordPp.setAricles(order.getCart());
		ordPp.setIdOrder(order.getIdOrder().toString());

		// importi
		ordPp.setDeliveryCost(order.getSpeseSpedizione());
		ordPp.setTotalItemOrder(order.getImItemOrdine());
		ordPp.setTotalDiscountOrder(order.getImOrdineDiscount());
		ordPp.setTotalPriceOrder(order.getImOrdine());

		ordPp.setCancelUrl(profile.getCancelUrl());
		ordPp.setImageUrl(profile.getImageUrl());
		ordPp.setLocale(profile.getLang());
		ordPp.setRedirectUrl(profile.getRedirectUrl());
		ordPp.setReturnUrl(profile.getReturnUrl());

		// sconti
		if (order.getImOrdineDiscount() != null && order.getImOrdineDiscount().compareTo(BigDecimal.ZERO) > 0) {
			ordPp.setTxDiscounted(null);
			if (order.getIdCoupon() != null) {
				ordPp.setTxDiscounted(order.getIdCoupon());
			}
			if (order.getIdFidelity() != null) {
				if (ordPp.getTxDiscounted() == null) {
					ordPp.setTxDiscounted(order.getIdFidelity());
				} else {
					ordPp.setTxDiscounted(ordPp.getTxDiscounted() + "-" + order.getIdFidelity());
				}
			}
		}
		return ordPp;
	}

	@Override
	public RefundTransactionDTO requestRefund(RefoundFullDTO ref, ProfilePayPalDTO profile, MailPropertiesDTO mail)
			throws PayPalException, PayPalFailureException, PayPalPostRefundPaymentException {
		// TODO Auto-generated method stub
		List<String> articles = new ArrayList<>();
		String art = null;
		for (ArticleRefounded artRef : ref.getCart()) {
			art = String.format("%d %s %s %s", artRef.getPrdFullDTO().getIdProduct(), artRef.getPrdFullDTO()
					.getDescription(), artRef.getTxSize(), artRef.getTxColor());
			articles.add(art);
		}
		RefundTransactionDTO refTrans = getWrapper(profile).refundTransaction(ref.getIdTransaction(),
				ref.getImRefound(), true, articles, ref.getIdRefound().toString());

		try {
			updateStateRefund(refTrans.getREFUNDSTATUS(), refTrans.getPENDINGREASON(), null, ref, refTrans, mail);
		} catch (MailNotSendException e) {
			// TODO Auto-generated catch block
			log.error("Errore nell'invio della mail per la conferma del rimborso", e);
		} catch (PayPalException e) {
			throw new PayPalPostRefundPaymentException(e, ref.getIdRefound() != null ? ref.getIdRefound().toString()
					: "", "errore nella'aggiornamento dello stato dopo il rimborso");
		}

		return refTrans;
	}

	private RefundTransactionDTO updateStateRefund(String paypalStatus, String pendingReason,
			String parentTransactionID, RefoundFullDTO ref, RefundTransactionDTO refTrans, MailPropertiesDTO mailProps)
			throws PayPalException, MailNotSendException {
		if (ref == null) {
			ref = orderService.getRefounds(null, null, null, null, parentTransactionID, null).get(0);
		}
		if (refTrans == null) {
			refTrans = new RefundTransactionDTO();
		}

		if (isPaymenRefunded(paypalStatus)) {
			orderService.updateStateRefound(ref.getIdRefound(), TypeStateOrder.REFOUND_COMPLETED, pendingReason);
			try {
				OthalaFactory.getOrderServiceInstance().sendMailConfirmReso(ref.getIdRefound(), mailProps);
			} catch (Exception e) {
				throw new MailNotSendException(e);
			}

		} else if (isPaymentPending(paypalStatus)) {
			orderService.updateStateRefound(ref.getIdRefound(), TypeStateOrder.PENDING, pendingReason);
			refTrans.setPending(true);
		} else if (isPaymentKO(paypalStatus)) {
			orderService.updateStateRefound(ref.getIdRefound(), TypeStateOrder.REFOUND_REFUSED, pendingReason);
			refTrans.setFailed(true);
			
		} 
		else if(isPaymenInstant(paypalStatus))
		{
			orderService.updateStateRefound(ref.getIdRefound(), TypeStateOrder.INSTANT, pendingReason);
			refTrans.setInstant(true);
		}
		else {
			//throw new PayPalException(String.format("Stati %s non ammesso nella fase di rimborso", paypalStatus));
			log.info(String.format("nessuna operazione da fare per lo stato  %s di rimborso", paypalStatus));
		}
		return refTrans;
	}

	public void setExternalService(IOthalaExternalServices externalService) {
		this.externalService = externalService;
	}

}
