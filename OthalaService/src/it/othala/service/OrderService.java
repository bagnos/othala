package it.othala.service;

import it.othala.account.execption.MailNotSendException;
import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.MailConfermaDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.execption.OthalaException;
import it.othala.service.interfaces.IMailService;
import it.othala.service.interfaces.IOrderService;
import it.othala.service.template.Template;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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

public class OrderService implements IOrderService {

	private IOrderDAO orderDAO;
	private IProductDAO productDAO;
	private IMailService mailService;
	public void setMailService(IMailService mailService) {
		this.mailService = mailService;
	}

	private static Log log = LogFactory.getLog(OrderService.class);

	@Override
	public List<OrderFullDTO> getOrders(Integer Order, String User, Integer StatoOrdine) {

		List<OrderFullDTO> listaOrdini = orderDAO.getOrders(Order, User, StatoOrdine);

		Iterator<OrderFullDTO> i = listaOrdini.iterator();
		while (i.hasNext()) {
			OrderFullDTO order = i.next();

			List<ArticleFullDTO> newlistArticle = new ArrayList<ArticleFullDTO>();

			List<ArticleFullDTO> listArticle = order.getCart();
			Iterator<ArticleFullDTO> it = listArticle.iterator();
			while (it.hasNext()) {
				ArticleFullDTO article = it.next();

				ArticleFullDTO artFull = productDAO.getArticleFull(article.getPrdFullDTO().getIdProduct(),
						article.getPgArticle(), "it");
				artFull.setShop(productDAO.getShop(article.getPrdFullDTO().getIdProduct(), article.getPgArticle()));
				
				artFull.setQtBooked(article.getQtBooked());
				newlistArticle.add(artFull);
			}
			order.setCart(newlistArticle);
		}

		return listaOrdini;
	}

	@Override
	public OrderFullDTO insertOrder(OrderFullDTO orderFull) throws MailNotSendException, OthalaException {

		orderDAO.insertOrder(orderFull);

		Integer qtaProduct;
		HashMap<String, Object> mapProduct = new HashMap<String, Object>();
		List<ArticleFullDTO> lsProd = orderFull.getCart();
		Iterator<ArticleFullDTO> i = lsProd.iterator();
		while (i.hasNext()) {
			ArticleFullDTO article = i.next();

			qtaProduct = productDAO.getQtStock(article.getPrdFullDTO().getIdProduct(), article.getPgArticle());

			if (qtaProduct < article.getQtBooked()) {
				String exc;
				if (qtaProduct == 0) {
					exc = "Prodotto " + article.getPrdFullDTO().getDescription() + " non piu disponibile";
				} else {
					exc = "Prodotto " + article.getPrdFullDTO().getDescription() + " quantità residua "
							+ qtaProduct.toString();

				}
				throw new OthalaException(exc);

			}

			mapProduct.clear();
			mapProduct.put("idOrder", orderFull.getIdOrder());
			mapProduct.put("idProdotto", article.getPrdFullDTO().getIdProduct());
			mapProduct.put("pgArticle", article.getPgArticle());
			mapProduct.put("qtArticle", article.getQtBooked());

			orderDAO.insertOrdersArticles(mapProduct);
		}

		orderDAO.insertStatesOrders(orderFull);

		String[] mailTo = new String[1];
		mailTo[0] = "massimiliano_cencioni@tin.it";
		String subject = "Inserito nuovo ordine";
		String content = "Un nuovo ordine è stato inserito con codice: " + orderFull.getIdOrder().toString();
		mailService.inviaMail(mailTo, subject, content);

		return orderFull;
	}

	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(IOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	public IProductDAO getProductDAO() {
		return productDAO;
	}

	public void setProductDAO(IProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public void updateStateOrder(StateOrderDTO stateOrder) {

		orderDAO.updateStatesOrders(stateOrder);

	}

	@Override
	public DeliveryDTO getDeliveryInfo(String userId) {
		List<DeliveryAddressDTO> addresses = orderDAO.getDeliveryAddress(userId);
		List<DeliveryCostDTO> costs = orderDAO.getDeliveryCost();

		DeliveryDTO delivery = new DeliveryDTO();

		delivery.setIndirizzo(addresses);
		delivery.setSpeseSpedizione(costs);

		return delivery;
	}

	@Override
	public DeliveryAddressDTO newAddress(DeliveryAddressDTO newAddress) {
		orderDAO.newAddress(newAddress);
		return newAddress;

	}

	@Override
	public DeliveryAddressDTO updateAddress(DeliveryAddressDTO newAddress, Integer idAddress) {
		orderDAO.deleteAddress(idAddress);
		orderDAO.newAddress(newAddress);
		return newAddress;
	}

	@Override
	public void updateOrder(String idTransaction, Integer idOrder, Integer idStato) {
		orderDAO.updateOrder(idTransaction, idOrder, idStato);

	}

	@Override
	public void deleteAddress(Integer idAddress) {
		orderDAO.deleteAddress(idAddress);

	}

	@Override
	public void inviaMailDiConferma(OrderFullDTO order,MailConfermaDTO mailDTO) throws MailNotSendException {
		// TODO Auto-generated method stub
		/*
		 * InputStream contenutoStream =
		 * Thread.currentThread().getContextClassLoader()
		 * .getResourceAsStream("it/othala/service/template/mailConferma.html");
		 * String contenuto; try { contenuto = IOUtils.toString(contenutoStream,
		 * "UTF-8"); contenutoStream.close(); } catch (IOException e) { // TODO
		 * Auto-generated catch block throw new MailNotSendException(e); }
		 */
		/*
		 * String contenuto =
		 * "<h1>This is a test</h1><img src=\"cid:image1\"/>"; Map<String,
		 * String> inlineImages = new HashMap<String, String>();
		 * 
		 * URL res =
		 * Thread.currentThread().getContextClassLoader().getResource("/");
		 * String basePath = res.getPath().replace("/WEB-INF/classes", ""); //
		 * String path=res.getPath(); inlineImages.put("image1",
		 * "http://localhost/Othala/faces/javax.faces.resource/logo2-small.png?ln=images"
		 * );
		 */
		URL res = Thread.currentThread().getContextClassLoader().getResource("");
		Map<String, String> inlineImages = new HashMap<String, String>();
		String basePath = res.getPath().replace("/WEB-INF/classes", "");
		basePath=basePath.replace("/", "");
		String html = generateHtmlOrder(order, mailDTO, inlineImages);

		mailService.inviaHTMLMail(new String[] { order.getIdUser() }, "Conferma Ordine", html, inlineImages);
	}

	private String generateHtmlOrder(OrderFullDTO order, MailConfermaDTO mailDTO, Map<String, String> inlineImages) {
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
			out.write("<imgPayment>");
			out.write("cid:imgPayment");
			out.write("</imgPayment>");
			inlineImages.put("imgPayment", mailDTO.getPathImgPayment());
			out.write("<deliveryCost>" + order.getImSpeseSpedizione() + "</deliveryCost>");
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
					out.write("<img>cid:imgArt"+i + "</img>");
					inlineImages.put("imgArt" + i, mailDTO.getBasePathArticle() + art.getThumbnailsUrl());
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
}
