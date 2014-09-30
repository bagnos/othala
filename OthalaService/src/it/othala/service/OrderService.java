package it.othala.service;

import it.othala.dao.OrderDAO;
import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.AccountDTO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.ArticleRefounded;
import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;
import it.othala.service.interfaces.IOrderService;
import it.othala.service.template.Template;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
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
import org.aspectj.weaver.reflect.InternalUseOnlyPointcutParser;


public class OrderService implements IOrderService {


	private IOrderDAO orderDAO;
	private IProductDAO productDAO;
	private IAccountDAO accountDAO;

	@Override
	public List<OrderFullDTO> getOrders(Integer Order, String User,
			TypeStateOrder StatoOrdine) {

		return getOrders(Order, User, StatoOrdine, null);

	}

	@Override
	public List<OrderFullDTO> getOrders(Integer Order, String User,
			TypeStateOrder StatoOrdine, String idTransaction) {

		List<OrderFullDTO> listaOrdini;
		if (StatoOrdine == null) {
			listaOrdini = orderDAO.getOrders(Order, User, null, idTransaction);
		} else {
			listaOrdini = orderDAO.getOrders(Order, User,
					StatoOrdine.getState(), idTransaction);
		}

		Iterator<OrderFullDTO> i = listaOrdini.iterator();
		while (i.hasNext()) {
			OrderFullDTO order = i.next();

			List<ArticleFullDTO> newlistArticle = new ArrayList<ArticleFullDTO>();

			List<ArticleFullDTO> listArticle = order.getCart();
			Iterator<ArticleFullDTO> it = listArticle.iterator();
			while (it.hasNext()) {
				ArticleFullDTO article = it.next();

				ArticleFullDTO artFull = productDAO.getArticleFull(article
						.getPrdFullDTO().getIdProduct(),
						article.getPgArticle(), "it");
				artFull.setShop(productDAO.getShop(article.getPrdFullDTO()
						.getIdProduct(), article.getPgArticle()));
				artFull.setPrdFullDTO(productDAO.getProductArticleFull("it",
						article.getPrdFullDTO().getIdProduct(),
						article.getPgArticle()));
				artFull.setQtBooked(article.getQtBooked());
				newlistArticle.add(artFull);
			}
			order.setCart(newlistArticle);
		}

		return listaOrdini;

	}

	@Override
	public OrderFullDTO insertOrder(OrderFullDTO orderFull)
			throws OthalaException {

		checkQtaInStock(null, orderFull);

		orderDAO.insertOrder(orderFull);

		HashMap<String, Object> mapProduct = new HashMap<String, Object>();

		List<ArticleFullDTO> lsProd = orderFull.getCart();
		Iterator<ArticleFullDTO> i = lsProd.iterator();
		while (i.hasNext()) {
			ArticleFullDTO article = i.next();

			mapProduct.clear();
			mapProduct.put("idOrder", orderFull.getIdOrder());
			mapProduct
					.put("idProdotto", article.getPrdFullDTO().getIdProduct());
			mapProduct.put("pgArticle", article.getPgArticle());
			mapProduct.put("qtArticle", article.getQtBooked());

			orderDAO.insertOrdersArticles(mapProduct);

		}

		orderDAO.insertStatesOrders(orderFull);

		return orderFull;
	}

	@Override
	public OrderFullDTO confirmOrderPayment(OrderFullDTO order)
			throws StockNotPresentException {

		// OrderFullDTO orderFull = checkQtaInStock(order.getIdOrder(),null);

		// orderFull = doCheckOutPayPal(profile, orderFull, details);

		// orderDAO.updateOrder(order.getIdOrder(),
		// order.getIdTransaction(), null);

		updateStateOrder(null, order,
				TypeStateOrder.valueOf(order.getIdStato()));

		updateStock(order, true);

		return order;

	}

	public OrderFullDTO checkQtaInStock(Integer idOrder, OrderFullDTO orderFull)
			throws StockNotPresentException {

		if (orderFull == null) {
			List<OrderFullDTO> lsOrders = orderDAO.getOrders(idOrder, null,
					null);
			Iterator<OrderFullDTO> oi = lsOrders.iterator();
			orderFull = oi.next();
		}

		List<ArticleFullDTO> lsProd = orderFull.getCart();
		Iterator<ArticleFullDTO> i = lsProd.iterator();
		while (i.hasNext()) {
			ArticleFullDTO article = i.next();

			Integer qtaProduct = productDAO.getQtStockLock(article
					.getPrdFullDTO().getIdProduct(), article.getPgArticle());

			if (qtaProduct < article.getQtBooked()) {
				List<String> prodNoStock = new ArrayList<String>();
				prodNoStock.add(article.getPrdFullDTO().getDescription());
				throw new StockNotPresentException(article.getPrdFullDTO().getIdProduct());
			}

		}
		return orderFull;
	}

	private void updateStock(OrderFullDTO orderFull, boolean fgVendita) {
		List<ArticleFullDTO> lsProd = orderFull.getCart();
		for (ArticleFullDTO article : lsProd) {

			productDAO.updateQtStock(article.getPrdFullDTO().getIdProduct(),
					article.getPgArticle(), article.getQtBooked(), fgVendita);

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
	public OrderFullDTO updateStateOrder(Integer idOrder,
			OrderFullDTO orderFull, TypeStateOrder stato) {

		if (orderFull == null) {
			List<OrderFullDTO> lsOrders = orderDAO.getOrders(idOrder, null,
					null);
			Iterator<OrderFullDTO> oi = lsOrders.iterator();
			orderFull = oi.next();
		}

		StateOrderDTO stateOrder = new StateOrderDTO();
		stateOrder.setIdOrder(orderFull.getIdOrder());
		stateOrder.setIdStato(stato.getState());
		stateOrder.setTxNote(null);

		orderDAO.updateStateOrder(stateOrder);

		orderDAO.updateOrder(orderFull.getIdOrder(),
				orderFull.getIdTransaction(), null);

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
	public OrderFullDTO increaseQtaArticle(OrderFullDTO orderFull,
			TypeStateOrder stato) {
		orderFull = updateStateOrder(null, orderFull, stato);

		updateStock(orderFull, false);

		// orderDAO.updateOrder(orderFull.getIdOrder(),
		// orderFull.getIdTransaction(), null);

		return orderFull;

	}

	@Override
	public DeliveryDTO getDeliveryInfo(String userId) {
		List<DeliveryAddressDTO> addresses = orderDAO
				.getDeliveryAddress(userId);
		/*List<DeliveryCostDTO> costs = orderDAO.getDeliveryCost(addresses.get(0).getNazione());*/

		DeliveryDTO delivery = new DeliveryDTO();

		delivery.setIndirizzo(addresses);
		/*delivery.setSpeseSpedizione(costs);*/

		return delivery;
	}

	@Override
	public List<DeliveryCostDTO> getSpeseSpedizione(String idNazione) {

		List<DeliveryCostDTO> costs = orderDAO.getDeliveryCost(idNazione);

	return costs;
	}
	
	@Override
	public DeliveryAddressDTO newAddress(DeliveryAddressDTO newAddress) {
		orderDAO.newAddress(newAddress);
		return newAddress;

	}

	@Override
	public DeliveryAddressDTO updateAddress(DeliveryAddressDTO newAddress,
			Integer idAddress) {
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
				throw new OthalaException(
						"Il Coupon che stai cercando di utilizzare è scaduto");
			}
			if (listCoupons.get(0).getDtUtilizzo() != null) {
				throw new OthalaException(
						"Il Coupon che stai cercando di utilizzare è stato gia speso");
			}
		} else {
			throw new OthalaException("Codice Coupon errato");
		}

		return listCoupons.get(0);
	}

	@Override
	public String stampaOrdineHTML(Integer idOrder, String pathLogo)
			throws Exception {

		List<OrderFullDTO> listOrderFullDTO = getOrders(idOrder, null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);
		Map<String, String> inlineImages = new HashMap<String, String>();

		return generateHtmlOrder(orderFullDTO, inlineImages, "stampaOrdine",
				pathLogo);

	}

	private String generateHtmlOrder(OrderFullDTO order,
			Map<String, String> inlineImages, String xslTemplate,
			String pathLogo) throws Exception {
		BufferedWriter out = null;
		FileWriter fstream = null;

		try {

			File xslFile = Template.getFile("it/othala/service/template/"
					+ xslTemplate + ".xsl");
			File xmlTemp = File.createTempFile("xmlTemp", ".xml");
			fstream = new FileWriter(xmlTemp);

			out = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(xmlTemp), "UTF8"));

			out.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
			out.write("<order>");
			out.write("<imgLogo>");
			out.write(pathLogo);
			out.write("</imgLogo>");

			out.write("<customer>");
			out.write("<name>" + order.getNameUser() + "</name>");
			out.write("<mail>" + order.getIdUser() + "</mail>");
			out.write("<surname>" + order.getSurnameUser() + "</surname>");
			out.write("</customer>");

			out.write("<number>" + order.getIdOrder() + "</number>");
			out.write("<transaction>" + order.getIdTransaction()
					+ "</transaction>");

			out.write("<deliveryCost>"
					+ order.getSpeseSpedizione().getImportoSpese()
					+ "</deliveryCost>");
			out.write("<totalCost>" + order.getImOrdine() + "</totalCost>");

			out.write("<billingAddress>");
			out.write("<name>" + order.getBillingAddress().getNome()
					+ "</name>");
			out.write("<surname>" + order.getBillingAddress().getCognome()
					+ "</surname>");
			out.write("<telefono>" + order.getBillingAddress().getTel()
					+ "</telefono>");
			out.write("<street>" + order.getBillingAddress().getVia()
					+ "</street>");
			out.write("<zipCode>" + order.getBillingAddress().getCap()
					+ "</zipCode>");
			out.write("<city>" + order.getBillingAddress().getComune()
					+ "</city>");
			out.write("<prov>" + order.getBillingAddress().getProvincia()
					+ "</prov>");
			out.write("<country>" + order.getBillingAddress().getNazione()
					+ "</country>");
			out.write("</billingAddress>");
			out.write("<shippingAddress>");
			out.write("<name>" + order.getShippingAddress().getNome()
					+ "</name>");
			out.write("<surname>" + order.getShippingAddress().getCognome()
					+ "</surname>");
			out.write("<tel>" + order.getShippingAddress().getTel() + "</tel>");
			out.write("<street>" + order.getShippingAddress().getVia()
					+ "</street>");
			out.write("<zipCode>" + order.getShippingAddress().getCap()
					+ "</zipCode>");
			out.write("<city>" + order.getShippingAddress().getComune()
					+ "</city>");
			out.write("<prov>" + order.getShippingAddress().getProvincia()
					+ "</prov>");
			out.write("<country>" + order.getShippingAddress().getNazione()
					+ "</country>");
			out.write("</shippingAddress>");

			out.write("<cart>");
			int i = 0;
			for (ArticleFullDTO art : order.getCart()) {

				out.write("<item>");
				out.write("<number>" + art.getPrdFullDTO().getIdProduct()
						+ "</number>");
				out.write("<brand>" + art.getPrdFullDTO().getTxBrand()
						+ "</brand>");
				out.write("<description>"
						+ art.getPrdFullDTO().getDescription()
						+ "</description>");
				out.write("<color>" + art.getTxColor() + "</color>");
				out.write("<size>" + art.getTxSize() + "</size>");
				out.write("<unitPrice>" + art.getPrdFullDTO().getRealPrice()
						+ "</unitPrice>");
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
			Source xslSource = new javax.xml.transform.stream.StreamSource(
					xslFile);
			Source xmlSource = new javax.xml.transform.stream.StreamSource(
					xmlTemp);
			javax.xml.transform.stream.StreamResult result = new StreamResult(
					htmlTemp);
			Transformer transformer;
			transformer = tFactory.newTransformer(xslSource);
			transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
			transformer.transform(xmlSource, result);

			String html = IOUtils.toString(new FileInputStream(htmlTemp),
					"UTF-8");

			return html;

		} catch (Exception e) {
			throw e;

		}

	}

	@Override
	public List<RefoundFullDTO> getRefounds(Integer idRefound, Integer Order,
			String User, TypeStateOrder StatoOrdine, String idTransaction) {

		List<RefoundFullDTO> listaRimborsi;
		if (StatoOrdine == null) {
			listaRimborsi = 
				orderDAO.getRefounds(idRefound, Order, User, null, idTransaction);
		}else{
			listaRimborsi = 
				orderDAO.getRefounds(idRefound, Order, User, StatoOrdine.getState(), idTransaction);
		}

		Iterator<RefoundFullDTO> i = listaRimborsi.iterator();
		while (i.hasNext()) {
			RefoundFullDTO rimborso = i.next();

			List<ArticleRefounded> newlistArticle = new ArrayList<ArticleRefounded>();

			List<ArticleRefounded> listArticle = rimborso.getCart();
			Iterator<ArticleRefounded> it = listArticle.iterator();
			while (it.hasNext()) {
				ArticleRefounded article = it.next();

				ArticleFullDTO artFull = productDAO.getArticleFull(article
						.getPrdFullDTO().getIdProduct(),
						article.getPgArticle(), "it");
				
				ArticleRefounded artRef =  new ArticleRefounded(artFull);
				
				artRef.setShop(productDAO.getShop(article.getPrdFullDTO()
						.getIdProduct(), article.getPgArticle()));
				
				artRef.setPrdFullDTO(productDAO.getProductArticleFull("it",
						article.getPrdFullDTO().getIdProduct(),
						article.getPgArticle()));
				
				artRef.setQtBooked(article.getQtBooked());
				artRef.setFgChangeRefound(article.getFgChangeRefound());
				artRef.setTxChangeRefound(article.getTxChangeRefound());
				
				newlistArticle.add(artRef);
			}
			rimborso.setCart(newlistArticle);
		}

		return listaRimborsi;
	}

	@Override
	public RefoundFullDTO insertRefound(RefoundFullDTO refoundFull)
			throws OthalaException {
		
		orderDAO.insertRefound(refoundFull);

		HashMap<String, Object> mapProduct = new HashMap<String, Object>();

		List<ArticleRefounded> lsProd = refoundFull.getCart();
		Iterator<ArticleRefounded> i = lsProd.iterator();
		while (i.hasNext()) {
			ArticleRefounded article = i.next();

			mapProduct.clear();
			mapProduct.put("idRefound", refoundFull.getIdRefound());
			mapProduct.put("idProdotto", article.getPrdFullDTO().getIdProduct());
			mapProduct.put("pgArticle", article.getPgArticle());
			mapProduct.put("qtArticle", article.getQtBooked());
			mapProduct.put("fgChangeRefound", article.getFgChangeRefound());
			mapProduct.put("txChangeRefound", article.getTxChangeRefound());
			mapProduct.put("txNewBarCode", article.getTxNewBarcode());
			
			orderDAO.insertRefoundArticles(mapProduct);

		}

		orderDAO.insertStatesRefound(refoundFull);
		
		//Stampare il riepilogo 
		

		return refoundFull;
	}

	@Override
	public void updateStateRefound(Integer idRefound,
			TypeStateOrder stato, String txNote) {
		
		HashMap<String, Object> mapState = new HashMap<String, Object>();
		mapState.put("idRefound", idRefound);
		mapState.put("idStato", stato.getState());
		mapState.put("txNote", txNote);
		
		orderDAO.updateStateRefound(mapState);
		
	}

	@Override
	public void setRefoundTransaction(Integer idRefound, String idTransaction) {
		
		orderDAO.updateRefound(idRefound, idTransaction);
		
	}

	@Override
	public void addFidelityCard(FidelityCardDTO carta) {
		orderDAO.newFidelityCard(carta);
		
	}

	@Override
	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail, String celNum )
			throws FidelityCardNotPresentException,
			FidelityCardNotValidException {
		FidelityCardDTO fCard = orderDAO.getFidelityCard(idFidelity);
		if (fCard == null) throw new FidelityCardNotPresentException(idFidelity);
		
		if (eMail != null && !eMail.isEmpty()){
			if (fCard.getTxEmail() == null || fCard.getTxEmail().isEmpty()) 
				throw new FidelityCardNotValidException(idFidelity);
			if (fCard.getTxEmail() != eMail)
				throw new FidelityCardNotValidException(idFidelity);
		}
		if (celNum != null && !celNum.isEmpty()){
			if (fCard.getTxTel() == null || fCard.getTxTel().isEmpty()) 
				throw new FidelityCardNotValidException(idFidelity);
			if (fCard.getTxTel() != celNum)
				throw new FidelityCardNotValidException(idFidelity);
		}		
		
		return fCard;
	}

	@Override
	public void aggiornaScontoFidelity(String idFidelity, int pcSconto) {
		orderDAO.updateScontoFidelity(idFidelity, pcSconto);
		
	}

	@Override
	public void aggiornaQtaCambio(String txBarcodeIn, String txBarcodeOut) {

		productDAO.updateQtStock(txBarcodeIn, 1, false);
		productDAO.updateQtStock(txBarcodeOut, 1, true);
		
	}

}
