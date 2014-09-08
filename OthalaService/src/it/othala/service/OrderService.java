package it.othala.service;

import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;
import it.othala.service.interfaces.IOrderService;
import it.othala.service.template.Template;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Date;
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

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class OrderService implements IOrderService {

	private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);

	private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

	private static Font normalFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL);

	private IOrderDAO orderDAO;
	private IProductDAO productDAO;

	@Override
	public List<OrderFullDTO> getOrders(Integer Order, String User, TypeStateOrder StatoOrdine) {

		return getOrders(Order, User, StatoOrdine, null);

	}

	@Override
	public List<OrderFullDTO> getOrders(Integer Order, String User, TypeStateOrder StatoOrdine, String idTransaction) {

		List<OrderFullDTO> listaOrdini;
		if (StatoOrdine == null) {
			listaOrdini = orderDAO.getOrders(Order, User, null, idTransaction);
		} else {
			listaOrdini = orderDAO.getOrders(Order, User, StatoOrdine.getState(), idTransaction);
		}

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
				artFull.setPrdFullDTO(productDAO.getProductArticleFull("it", article.getPrdFullDTO().getIdProduct(),
						article.getPgArticle()));
				artFull.setQtBooked(article.getQtBooked());
				newlistArticle.add(artFull);
			}
			order.setCart(newlistArticle);
		}

		return listaOrdini;

	}

	@Override
	public OrderFullDTO insertOrder(OrderFullDTO orderFull) throws OthalaException {

		checkQtaInStock(null, orderFull);

		orderDAO.insertOrder(orderFull);

		HashMap<String, Object> mapProduct = new HashMap<String, Object>();

		List<ArticleFullDTO> lsProd = orderFull.getCart();
		Iterator<ArticleFullDTO> i = lsProd.iterator();
		while (i.hasNext()) {
			ArticleFullDTO article = i.next();

			mapProduct.clear();
			mapProduct.put("idOrder", orderFull.getIdOrder());
			mapProduct.put("idProdotto", article.getPrdFullDTO().getIdProduct());
			mapProduct.put("pgArticle", article.getPgArticle());
			mapProduct.put("qtArticle", article.getQtBooked());

			orderDAO.insertOrdersArticles(mapProduct);

		}

		orderDAO.insertStatesOrders(orderFull);

		return orderFull;
	}

	@Override
	public OrderFullDTO confirmOrderPayment(OrderFullDTO order) throws StockNotPresentException {

		// OrderFullDTO orderFull = checkQtaInStock(order.getIdOrder(),null);

		// orderFull = doCheckOutPayPal(profile, orderFull, details);

		// orderDAO.updateOrder(order.getIdOrder(),
		// order.getIdTransaction(), null);

		updateStateOrder(null, order, TypeStateOrder.valueOf(order.getIdStato()));

		updateStock(order, true);

		return order;

	}

	public OrderFullDTO checkQtaInStock(Integer idOrder, OrderFullDTO orderFull) throws StockNotPresentException {

		if (orderFull == null) {
			List<OrderFullDTO> lsOrders = orderDAO.getOrders(idOrder, null, null);
			Iterator<OrderFullDTO> oi = lsOrders.iterator();
			orderFull = oi.next();
		}

		List<ArticleFullDTO> lsProd = orderFull.getCart();
		Iterator<ArticleFullDTO> i = lsProd.iterator();
		while (i.hasNext()) {
			ArticleFullDTO article = i.next();

			Integer qtaProduct = productDAO.getQtStockLock(article.getPrdFullDTO().getIdProduct(),
					article.getPgArticle());

			if (qtaProduct < article.getQtBooked()) {
				List<String> prodNoStock = new ArrayList<String>();
				prodNoStock.add(article.getPrdFullDTO().getDescription());
				throw new StockNotPresentException();
			}

		}
		return orderFull;
	}

	private void updateStock(OrderFullDTO orderFull, boolean fgVendita) {
		List<ArticleFullDTO> lsProd = orderFull.getCart();
		for (ArticleFullDTO article : lsProd) {

			productDAO.updateQtStock(article.getPrdFullDTO().getIdProduct(), article.getPgArticle(),
					article.getQtBooked(), fgVendita);

		}
	}

	@Override
	public void confirmOrderDelivery(String idTrackingNumber, Integer idOrder) {

		// orderDAO.updateOrder(idOrder, null, idTrackingNumber);

		updateStateOrder(idOrder, null, TypeStateOrder.SPEDITO);

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
	public OrderFullDTO updateStateOrder(Integer idOrder, OrderFullDTO orderFull, TypeStateOrder stato) {

		if (orderFull == null) {
			List<OrderFullDTO> lsOrders = orderDAO.getOrders(idOrder, null, null);
			Iterator<OrderFullDTO> oi = lsOrders.iterator();
			orderFull = oi.next();
		}

		StateOrderDTO stateOrder = new StateOrderDTO();
		stateOrder.setIdOrder(orderFull.getIdOrder());
		stateOrder.setIdStato(stato.getState());
		stateOrder.setTxNote(null);

		orderDAO.updateStateOrder(stateOrder);

		orderDAO.updateOrder(orderFull.getIdOrder(), orderFull.getIdTransaction(), null);

		/*
		 * IPaymentService payService =
		 * OthalaFactory.getPaymentServiceInstance();
		 * 
		 * if (payService.isPaymentKO(stato)){ updateStock(orderFull,false); }
		 */

		orderFull.setIdStato(stato.getState());
		return orderFull;
	}

	@Override
	public OrderFullDTO increaseQtaArticle(OrderFullDTO orderFull, TypeStateOrder stato) {
		orderFull = updateStateOrder(null, orderFull, stato);

		updateStock(orderFull, false);

		// orderDAO.updateOrder(orderFull.getIdOrder(),
		// orderFull.getIdTransaction(), null);

		return orderFull;

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
	public void deleteAddress(Integer idAddress) {
		orderDAO.deleteAddress(idAddress);

	}

	@Override
	public void deleteDeliveryCost(Integer idDeliveryCost) {
		orderDAO.deleteDeliveryCost(idDeliveryCost);

	}

	@Override
	public CouponDTO checkCoupon(String idCoupon) throws OthalaException {

		List<CouponDTO> listCoupons = orderDAO.getCoupons(idCoupon, null);

		if (listCoupons.get(0) != null) {
			if (listCoupons.get(0).getDtScadenza().compareTo(new Date()) < 0) {
				throw new OthalaException("Il Coupon che stai cercando di utilizzare è scaduto");
			}
			if (listCoupons.get(0).getDtUtilizzo() != null) {
				throw new OthalaException("Il Coupon che stai cercando di utilizzare è stato gia speso");
			}
		} else {
			throw new OthalaException("Codice Coupon errato");
		}

		return listCoupons.get(0);
	}

	@Override
	public File stampaOrdine(Integer idOrder) throws Exception {

		List<OrderFullDTO> listOrderFullDTO = getOrders(idOrder, null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);
		return stampaPDF(orderFullDTO);
		

	}
	
	
	@Override
	public String stampaOrdineHTML(Integer idOrder) throws Exception {

		List<OrderFullDTO> listOrderFullDTO = getOrders(idOrder, null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);
		return stampaHTML(orderFullDTO);
		

	}
	
	public String stampaHTML(OrderFullDTO orderFullDTO) throws Exception {
		
	
	return generateHtmlOrder(orderFullDTO, "stampaOrdine");
	
	}
	
	private String generateHtmlOrder(OrderFullDTO order, String xslTemplate) throws Exception {
		BufferedWriter out = null;
		FileWriter fstream = null;

		try {

			File xslFile = Template.getFile("it/othala/service/template/" + xslTemplate + ".xsl");
			File xmlTemp = File.createTempFile("xmlTemp", ".xml");
			fstream = new FileWriter(xmlTemp);

			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(xmlTemp), "UTF8"));

			out.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
			out.write("<order>");
			
			out.write("<customer>");
			out.write("<name>" + order.getNameUser() + "</name>");
			out.write("<mail>" + order.getIdUser() + "</mail>");
			out.write("<surname>" + order.getSurnameUser() + "</surname>");
			out.write("</customer>");
			
			
			out.write("<number>" + order.getIdOrder() + "</number>");
			out.write("<transaction>" + order.getIdTransaction() + "</transaction>");


			
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
			out.write("<country>" + order.getBillingAddress().getNazione() + "</country>");
			out.write("</billingAddress>");
			out.write("<shippingAddress>");
			out.write("<name>" + order.getShippingAddress().getNome() + "</name>");
			out.write("<surname>" + order.getShippingAddress().getCognome() + "</surname>");
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
					
					out.write("<item>");
					out.write("<number>" + art.getPrdFullDTO().getIdProduct() + "</number>");
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
			throw e;

		} 

	}

	public File stampaPDF(OrderFullDTO orderFullDTO) throws Exception {

		File pdfTemp = File.createTempFile("pdfTemp", ".pdf");

		Document document = new Document();
		PdfWriter.getInstance(document, new FileOutputStream(pdfTemp));
		document.open();
		addTitlePage(document, orderFullDTO);
		addCliente(document, orderFullDTO);
		addCarrello(document, orderFullDTO);

		document.close();
		return pdfTemp;

	}

	private static void addTitlePage(Document document, OrderFullDTO orderFullDTO) throws DocumentException {
		Paragraph preface = new Paragraph();
		// We add one empty line
		addEmptyLine(preface, 1);
		// Lets write a big header
		preface.add(new Paragraph("ORDINE N° " + orderFullDTO.getIdOrder().toString(), catFont));

		addEmptyLine(preface, 1);
		// Will create: Report generated by: _name, _date
		preface.add(new Paragraph("TRANSAZIONE N° " + orderFullDTO.getIdTransaction().toString(), smallBold));
		addEmptyLine(preface, 2);

		document.add(preface);

	}

	private static void addCliente(Document document, OrderFullDTO orderFullDTO) throws DocumentException {

		Paragraph preface = new Paragraph();

		preface.add(new Paragraph("Cliente:", catFont));
		addEmptyLine(preface, 1);

		PdfPTable table = new PdfPTable(2);

		PdfPCell c1 = new PdfPCell();

		c1 = new PdfPCell(new Phrase("Email", smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase(orderFullDTO.getIdUser(), normalFont));
		c1.setBorderWidth(0);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Nome", smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase(orderFullDTO.getNameUser(), normalFont));
		c1.setBorderWidth(0);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Cognome", smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase(orderFullDTO.getSurnameUser(), normalFont));
		c1.setBorderWidth(0);
		table.addCell(c1);

		preface.add(table);

		addEmptyLine(preface, 1);

		PdfPTable table2 = new PdfPTable(2);

		c1 = new PdfPCell(new Phrase("Indirizzo di fatturazione", smallBold));
		c1.setBorderWidth(0);
		table2.addCell(c1);

		c1 = new PdfPCell(new Phrase("Indirizzo di spedizione", smallBold));
		c1.setBorderWidth(0);
		table2.addCell(c1);

		c1 = new PdfPCell(new Phrase(orderFullDTO.getBillingAddress().getNome() + " "
				+ orderFullDTO.getBillingAddress().getCognome(), normalFont));
		c1.setBorderWidth(0);
		table2.addCell(c1);
		c1 = new PdfPCell(new Phrase(orderFullDTO.getShippingAddress().getNome() + " "
				+ orderFullDTO.getBillingAddress().getCognome(), normalFont));
		c1.setBorderWidth(0);
		table2.addCell(c1);

		c1 = new PdfPCell(new Phrase(orderFullDTO.getBillingAddress().getVia(), normalFont));
		c1.setBorderWidth(0);
		table2.addCell(c1);
		c1 = new PdfPCell(new Phrase(orderFullDTO.getShippingAddress().getVia(), normalFont));
		c1.setBorderWidth(0);
		table2.addCell(c1);

		c1 = new PdfPCell(new Phrase(orderFullDTO.getBillingAddress().getCap() + " "
				+ orderFullDTO.getBillingAddress().getComune() + " " + orderFullDTO.getBillingAddress().getProvincia()
				+ " " + orderFullDTO.getBillingAddress().getNazione(), normalFont));
		c1.setBorderWidth(0);
		table2.addCell(c1);
		c1 = new PdfPCell(new Phrase(orderFullDTO.getShippingAddress().getCap() + " "
				+ orderFullDTO.getShippingAddress().getComune() + " "
				+ orderFullDTO.getShippingAddress().getProvincia() + " "
				+ orderFullDTO.getShippingAddress().getNazione(), normalFont));
		c1.setBorderWidth(0);
		table2.addCell(c1);

		c1 = new PdfPCell(new Phrase(orderFullDTO.getBillingAddress().getTel(), normalFont));
		c1.setBorderWidth(0);
		table2.addCell(c1);
		c1 = new PdfPCell(new Phrase(orderFullDTO.getShippingAddress().getTel(), normalFont));
		c1.setBorderWidth(0);
		table2.addCell(c1);

		preface.add(table2);

		document.add(preface);

	}

	private static void addCarrello(Document document, OrderFullDTO orderFullDTO) throws DocumentException {

		Paragraph preface = new Paragraph();

		preface.add(new Paragraph("Carrello:", catFont));
		addEmptyLine(preface, 1);

		PdfPTable table = new PdfPTable(6);
		PdfPCell c1 = new PdfPCell();

		c1 = new PdfPCell(new Phrase("Articolo", smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);
		c1 = new PdfPCell(new Phrase("Colore", smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);
		c1 = new PdfPCell(new Phrase("Taglia", smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);
		c1 = new PdfPCell(new Phrase("Prezzo", smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);
		c1 = new PdfPCell(new Phrase("Quantità", smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);
		c1 = new PdfPCell(new Phrase("Prezzo totale", smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);
		String contenuto = "";

		for (ArticleFullDTO art : orderFullDTO.getCart()) {
			if (art != null) {

				contenuto = art.getPrdFullDTO().getTxBrand() + " - " + art.getPrdFullDTO().getDescription() + " "
						+ "Id. " + art.getPrdFullDTO().getIdProduct().toString();

				c1 = new PdfPCell(new Phrase(contenuto, normalFont));
				c1.setBorderWidth(0);
				table.addCell(c1);

				contenuto = art.getTxColor();

				c1 = new PdfPCell(new Phrase(contenuto, normalFont));
				c1.setBorderWidth(0);
				table.addCell(c1);

				contenuto = art.getTxSize();

				c1 = new PdfPCell(new Phrase(contenuto, normalFont));
				c1.setBorderWidth(0);
				table.addCell(c1);

				contenuto = art.getPrdFullDTO().getRealPrice().toString();

				c1 = new PdfPCell(new Phrase(contenuto, normalFont));
				c1.setBorderWidth(0);
				table.addCell(c1);

				contenuto = art.getQtBooked().toString();

				c1 = new PdfPCell(new Phrase(contenuto, normalFont));
				c1.setBorderWidth(0);
				table.addCell(c1);

				contenuto = art.getTotalPriced().toString();

				c1 = new PdfPCell(new Phrase(contenuto, normalFont));
				c1.setBorderWidth(0);
				table.addCell(c1);

			}

		}

		contenuto = "TOTALE";
		c1 = new PdfPCell(new Phrase(contenuto, smallBold));
		c1.setBorderWidth(0);
		table.addCell(c1);
		contenuto = "";
		c1 = new PdfPCell(new Phrase(contenuto, normalFont));
		c1.setBorderWidth(0);
		table.addCell(c1);
		contenuto = "";
		c1 = new PdfPCell(new Phrase(contenuto, normalFont));
		c1.setBorderWidth(0);
		table.addCell(c1);
		contenuto = "";
		c1 = new PdfPCell(new Phrase(contenuto, normalFont));
		c1.setBorderWidth(0);
		table.addCell(c1);
		contenuto = "";
		c1 = new PdfPCell(new Phrase(contenuto, normalFont));
		c1.setBorderWidth(0);
		table.addCell(c1);
		contenuto = orderFullDTO.getImOrdine().toString();
		c1 = new PdfPCell(new Phrase(contenuto, normalFont));
		c1.setBorderWidth(0);
		table.addCell(c1);

		float[] columnWidths = new float[] { 20f, 10f, 10f, 10f, 10f, 10f };
		table.setWidths(columnWidths);

		preface.add(table);

		addEmptyLine(preface, 1);

		document.add(preface);

	}

	private static void addEmptyLine(Paragraph paragraph, int number) {
		for (int i = 0; i < number; i++) {
			paragraph.add(new Paragraph(" "));
		}
	}

}
