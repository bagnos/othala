package it.othala.service;

import it.othala.account.execption.MailNotSendException;
import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.ArticleRefounded;
import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.dto.RendicontoOrdini;
import it.othala.dto.ShopDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.CouponBurntException;
import it.othala.execption.CouponExpiredException;
import it.othala.execption.CouponNotPresentException;
import it.othala.execption.CouponNotValidException;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;
import it.othala.external.service.interfaces.IOthalaExternalServices;
import it.othala.service.interfaces.IMailService;
import it.othala.service.interfaces.IOrderService;
import it.othala.service.template.Template;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.RandomStringUtils;

public class OrderService implements IOrderService {

	private IOrderDAO orderDAO;
	private IProductDAO productDAO;
	private IAccountDAO accountDAO;
	private IMailService mailService;
	private IOthalaExternalServices externalService;

	public void setExternalService(IOthalaExternalServices externalService) {
		this.externalService = externalService;
	}

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

			/*
			 * Integer qtaProduct =
			 * productDAO.getQtStockLock(article.getPrdFullDTO().getIdProduct(),
			 * article.getPgArticle());
			 */

			Integer qtaProduct = externalService.getQtStockLock(article.getPrdFullDTO().getIdProduct(),
					article.getPgArticle());

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

		if (orderFull.getIdTransaction() != null) {
			orderDAO.updateOrder(orderFull.getIdOrder(), orderFull.getIdTransaction(), null);
		}

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
		/*
		 * List<DeliveryCostDTO> costs =
		 * orderDAO.getDeliveryCost(addresses.get(0).getNazione());
		 */

		DeliveryDTO delivery = new DeliveryDTO();

		delivery.setIndirizzo(addresses);
		/* delivery.setSpeseSpedizione(costs); */

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
	public CouponDTO checkCoupon(String idCoupon, String idUser) throws OthalaException {

		List<CouponDTO> listCoupons = orderDAO.getCoupons(idCoupon, idUser);

		if (listCoupons.get(0) != null) {
			if (listCoupons.get(0).getDtScadenza().compareTo(new Date()) < 0) {
				throw new CouponExpiredException(idCoupon);
			}
			if (listCoupons.get(0).getQtUtilizzo() != null) {
				if (listCoupons.get(0).getQtUtilizzo() == 0) {
					throw new CouponBurntException(idCoupon);
				}
			}

		} else {
			throw new CouponNotPresentException(idCoupon);
		}

		return listCoupons.get(0);
	}

	@Override
	public void sendMailConfirmReso(Integer idReso, MailPropertiesDTO mailProps) throws Exception {

		List<RefoundFullDTO> listRefound = getRefounds(idReso, null, null, null, null, null);
		List<OrderFullDTO> listOrderFullDTO = getOrders(listRefound.get(0).getIdOrder(), null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);

		List<ShopDTO> shop = productDAO.listShop();

		String html = generateHtmlReso(orderFullDTO, listRefound.get(0).getCart(), shop.get(1), "mailConfermaReso",
				mailProps.getPathImgLogo(), idReso.toString());

		String subject = shop.get(0).getTxShop() + " - Conferma Reso Merce";

		Map<String, String> inlineImages = new HashMap<String, String>();

		mailService.inviaHTMLMail(new String[] { orderFullDTO.getIdUser().toString() }, subject, html, inlineImages,
				mailProps);

	}

	@Override
	public void sendMailConfirmCambio(Integer idReso, MailPropertiesDTO mailProps) throws Exception {

		List<RefoundFullDTO> listRefound = getRefounds(idReso, null, null, null, null, null);
		List<OrderFullDTO> listOrderFullDTO = getOrders(listRefound.get(0).getIdOrder(), null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);

		List<ShopDTO> shop = productDAO.listShop();

		String html = generateHtmlReso(orderFullDTO, listRefound.get(0).getCart(), shop.get(1), "mailConfermaCambio",
				mailProps.getPathImgLogo(), idReso.toString());

		String subject = shop.get(0).getTxShop() + " - Conferma Cambio Merce";

		Map<String, String> inlineImages = new HashMap<String, String>();

		mailService.inviaHTMLMail(new String[] { orderFullDTO.getIdUser().toString() }, subject, html, inlineImages,
				mailProps);

	}

	@Override
	public void sendMailInsertCambio(Integer idReso, MailPropertiesDTO mailProps) throws Exception {

		List<RefoundFullDTO> listRefound = getRefounds(idReso, null, null, null, null, null);
		List<OrderFullDTO> listOrderFullDTO = getOrders(listRefound.get(0).getIdOrder(), null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);

		List<ShopDTO> shop = productDAO.listShop();

		String html = generateHtmlReso(orderFullDTO, listRefound.get(0).getCart(), shop.get(1),
				"mailInserimentoCambio", mailProps.getPathImgLogo(), idReso.toString());

		String subject = shop.get(0).getTxShop() + " - Notifica di Cambio";

		Map<String, String> inlineImages = new HashMap<String, String>();

		mailService.inviaHTMLMail(new String[] { orderFullDTO.getIdUser().toString() }, subject, html, inlineImages,
				mailProps);

	}

	@Override
	public void sendMailInsertReso(Integer idReso, MailPropertiesDTO mailProps) throws Exception {

		List<RefoundFullDTO> listRefound = getRefounds(idReso, null, null, null, null, null);
		List<OrderFullDTO> listOrderFullDTO = getOrders(listRefound.get(0).getIdOrder(), null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);

		List<ShopDTO> shop = productDAO.listShop();

		String html = generateHtmlReso(orderFullDTO, listRefound.get(0).getCart(), shop.get(1), "mailInserimentoReso",
				mailProps.getPathImgLogo(), idReso.toString());

		String subject = shop.get(0).getTxShop() + " - Notifica di Reso";

		Map<String, String> inlineImages = new HashMap<String, String>();

		mailService.inviaHTMLMail(new String[] { orderFullDTO.getIdUser().toString() }, subject, html, inlineImages,
				mailProps);

	}

	@Override
	public String stampaResoHTML(Integer idReso, String pathLogo) throws Exception {

		List<RefoundFullDTO> listRefound = getRefounds(idReso, null, null, null, null, null);
		List<OrderFullDTO> listOrderFullDTO = getOrders(listRefound.get(0).getIdOrder(), null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);

		List<ShopDTO> shop = productDAO.listShop();

		return generateHtmlReso(orderFullDTO, listRefound.get(0).getCart(), shop.get(1), "reso", pathLogo,
				idReso.toString());

	}

	private String generateHtmlReso(OrderFullDTO order, List<ArticleRefounded> artRef, ShopDTO shop,
			String xslTemplate, String pathLogo, String numReso) throws Exception {
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
			out.write(pathLogo);
			out.write("</imgLogo>");

			out.write("<customer>");
			out.write("<name>" + order.getNameUser() + "</name>");
			out.write("<mail>" + order.getIdUser() + "</mail>");
			out.write("<surname>" + order.getSurnameUser() + "</surname>");
			out.write("</customer>");

			out.write("<numReso>" + numReso + "</numReso>");
			out.write("<number>" + order.getIdOrder() + "</number>");
			out.write("<transaction>" + order.getIdTransaction() + "</transaction>");

			out.write("<deliveryCost>" + order.getSpeseSpedizione().getImportoSpese() + "</deliveryCost>");
			out.write("<totalCost>" + order.getImOrdine() + "</totalCost>");

			out.write("<merchant>");
			out.write("<name>" + shop.getTxShop() + "</name>");
			out.write("<street>" + shop.getTxVia() + "</street>");
			out.write("<zipCode>" + shop.getCdCap().toString() + "</zipCode>");
			out.write("<city>" + shop.getTxComune() + "</city>");
			out.write("<prov>" + shop.getTxProvincia() + "</prov>");
			out.write("<country>" + shop.getTxNazione() + "</country>");
			out.write("</merchant>");

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
			for (ArticleRefounded refArticle : artRef) {

				out.write("<item>");
				out.write("<number>" + refArticle.getPrdFullDTO().getIdProduct() + "</number>");
				out.write("<brand>" + refArticle.getPrdFullDTO().getTxBrand() + "</brand>");
				out.write("<description>" + refArticle.getPrdFullDTO().getDescription() + "</description>");
				out.write("<color>" + refArticle.getTxColor() + "</color>");
				out.write("<size>" + refArticle.getTxSize() + "</size>");
				out.write("<unitPrice>" + refArticle.getPrdFullDTO().getRealPrice() + "</unitPrice>");
				out.write("<quantity>" + refArticle.getQtBooked() + "</quantity>");
				out.write("<price>" + refArticle.getTotalPriced() + "</price>");
				out.write("<cambio>" + refArticle.getTxChangeRefound() + "</cambio>");
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

	@Override
	public String stampaCambioHTML(Integer idReso, String pathLogo) throws Exception {

		List<RefoundFullDTO> listRefound = getRefounds(idReso, null, null, null, null, null);
		List<OrderFullDTO> listOrderFullDTO = getOrders(listRefound.get(0).getIdOrder(), null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);

		List<ShopDTO> shop = productDAO.listShop();

		return generateHtmlReso(orderFullDTO, listRefound.get(0).getCart(), shop.get(1), "cambi", pathLogo,
				idReso.toString());

	}

	@Override
	public List<RefoundFullDTO> getRefounds(Integer idRefound, Integer Order, String User, TypeStateOrder StatoOrdine,
			String idTransaction, String fgChangeRefound) {

		List<RefoundFullDTO> listaRimborsi;
		if (StatoOrdine == null) {
			listaRimborsi = orderDAO.getRefounds(idRefound, Order, User, null, idTransaction, fgChangeRefound);
		} else {
			listaRimborsi = orderDAO.getRefounds(idRefound, Order, User, StatoOrdine.getState(), idTransaction,
					fgChangeRefound);
		}

		Iterator<RefoundFullDTO> i = listaRimborsi.iterator();
		while (i.hasNext()) {
			RefoundFullDTO rimborso = i.next();

			List<ArticleRefounded> newlistArticle = new ArrayList<ArticleRefounded>();

			List<ArticleRefounded> listArticle = rimborso.getCart();
			Iterator<ArticleRefounded> it = listArticle.iterator();
			while (it.hasNext()) {
				ArticleRefounded article = it.next();

				ArticleFullDTO artFull = productDAO.getArticleFull(article.getPrdFullDTO().getIdProduct(),
						article.getPgArticle(), "it");

				ArticleRefounded artRef = new ArticleRefounded(artFull);

				artRef.setShop(productDAO.getShop(article.getPrdFullDTO().getIdProduct(), article.getPgArticle()));

				artRef.setPrdFullDTO(productDAO.getProductArticleFull("it", article.getPrdFullDTO().getIdProduct(),
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
	public RefoundFullDTO insertRefound(RefoundFullDTO refoundFull, MailPropertiesDTO mailProps) throws OthalaException {

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
			mapProduct.put("pgArticleNew", article.getPgArticleChangeSelected());

			orderDAO.insertRefoundArticles(mapProduct);

		}

		orderDAO.insertStatesRefound(refoundFull);

		if (refoundFull.getFgChangeRefound() == "R") {
			try {
				sendMailConfirmReso(refoundFull.getIdRefound(), mailProps);
			} catch (Exception ex) {
				throw new MailNotSendException(ex);
			}

		} else {
			try {
				sendMailConfirmCambio(refoundFull.getIdRefound(), mailProps);
			} catch (Exception ex) {
				throw new MailNotSendException(ex);
			}
		}

		return refoundFull;
	}

	@Override
	public void updateStateRefound(Integer idRefound, TypeStateOrder stato, String txNote) {

		HashMap<String, Object> mapState = new HashMap<String, Object>();
		mapState.put("idRefound", idRefound);
		mapState.put("idStato", stato.getState());
		mapState.put("txNote", txNote);

		orderDAO.updateStateRefound(mapState);

		/*
		 * //Aggionro anche lo stato dell'ordine List<RefoundFullDTO> ref =
		 * orderDAO.getRefounds(idRefound, null, null, null, null, null);
		 * 
		 * StateOrderDTO stateOrder = new StateOrderDTO();
		 * stateOrder.setIdOrder(ref.get(0).getIdOrder());
		 * stateOrder.setIdStato(stato.getState()); stateOrder.setTxNote(null);
		 * 
		 * orderDAO.updateStateOrder(stateOrder);
		 */

	}

	@Override
	public void setRefoundTransaction(Integer idRefound, String idTransaction) {

		orderDAO.updateRefound(idRefound, idTransaction);

	}

	@Override
	public String addFidelityCard(FidelityCardDTO carta) {
		if (carta.getIdFidelity() == null || carta.getIdFidelity().isEmpty()) {
			carta.setIdFidelity(RandomStringUtils.randomAlphanumeric(9).toUpperCase());
		}
		orderDAO.newFidelityCard(carta);

		return carta.getIdFidelity();

	}

	@Override
	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail, String celNum)
			throws FidelityCardNotPresentException, FidelityCardNotValidException {
		/*
		 * List<FidelityCardDTO> fCard = orderDAO.getFidelityCard(idFidelity,
		 * null, null, null); if (fCard.get(0) == null) throw new
		 * FidelityCardNotPresentException(idFidelity);
		 * 
		 * if (eMail != null && !eMail.isEmpty()) { if
		 * (fCard.get(0).getTxEmail() == null ||
		 * fCard.get(0).getTxEmail().isEmpty()) throw new
		 * FidelityCardNotValidException(idFidelity); if
		 * (!fCard.get(0).getTxEmail().equals(eMail)) throw new
		 * FidelityCardNotValidException(idFidelity); } if (celNum != null &&
		 * !celNum.isEmpty()) { if (fCard.get(0).getTxTel() == null ||
		 * fCard.get(0).getTxTel().isEmpty()) throw new
		 * FidelityCardNotValidException(idFidelity); if
		 * (!fCard.get(0).getTxTel().equals(celNum)) throw new
		 * FidelityCardNotValidException(idFidelity); }
		 */

		return externalService.checkFidelityCard(idFidelity, eMail, celNum);

	}

	@Override
	public void aggiornaFidelity(String idFidelity, Integer pcSconto, String txNome, String txCognome, String txEmail,
			String txTel) {
		orderDAO.updateFidelity(idFidelity, pcSconto, txNome, txCognome, txEmail, txTel);

	}

	@Override
	public void aggiornaQtaCambio(Integer idProduct, Integer pgArticleIn, Integer pgArticleOut) {

		productDAO.updateQtStock(idProduct, pgArticleIn, 1, false);
		productDAO.updateQtStock(idProduct, pgArticleOut, 1, true);

	}

	@Override
	public String stampaOrdineHTML(Integer idOrder, String pathLogo) throws Exception {

		List<OrderFullDTO> listOrderFullDTO = getOrders(idOrder, null, null);
		OrderFullDTO orderFullDTO = listOrderFullDTO.get(0);
		Map<String, String> inlineImages = new HashMap<String, String>();

		return generateHtmlOrder(orderFullDTO, inlineImages, "stampaOrdine", pathLogo);

	}

	private String generateHtmlOrder(OrderFullDTO order, Map<String, String> inlineImages, String xslTemplate,
			String pathLogo) throws Exception {
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
			out.write(pathLogo);
			out.write("</imgLogo>");

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

	public IMailService getMailService() {
		return mailService;
	}

	public void setMailService(IMailService mailService) {
		this.mailService = mailService;
	}

	public IAccountDAO getAccountDAO() {
		return accountDAO;
	}

	public void setAccountDAO(IAccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	@Override
	public String insertCoupon(CouponDTO couponDTO) throws Exception {

		couponDTO.setIdCoupon(RandomStringUtils.randomAlphanumeric(9).toUpperCase());
		// SecureRandom random = new SecureRandom();
		// couponDTO.setIdCoupon(new BigInteger(64,
		// random).toString(32).toUpperCase());
		orderDAO.insertCoupon(couponDTO);

		return couponDTO.getIdCoupon();

	}

	@Override
	public void updateCoupon(CouponDTO couponDTO) throws Exception {
		orderDAO.updateCoupon(couponDTO);

	}

	@Override
	public void deleteCoupon(String idCoupon) throws Exception {
		orderDAO.deleteCoupon(idCoupon);

	}

	@Override
	public List<CouponDTO> getCoupons(String idCoupon, String idUser) throws Exception {

		return orderDAO.getCoupons(idCoupon, idUser);

	}

	@Override
	public void burnCoupon(String idCoupon) throws Exception {
		orderDAO.burnCoupon(idCoupon);

	}

	@Override
	public void deleteFidelityCard(String idFidelity) throws Exception {
		orderDAO.deleteFidelityCard(idFidelity);

	}

	@Override
	public List<FidelityCardDTO> getFidelityCards(String idFidelity, String txNome, String txCognome, String txEmail)
			throws Exception {

		return orderDAO.getFidelityCard(idFidelity, txNome, txCognome, txEmail);
	}

	@Override
	public RendicontoOrdini getTotaliOrdini(Timestamp dtDa, Timestamp dtA, TypeStateOrder statoOrdine,
			TypeStateOrder statoRefound) {

		return orderDAO.getTotaliOrdini(dtDa, dtA, statoOrdine, statoRefound);
	}

}
