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
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;
import it.othala.payment.paypal.DoExpressCheckoutPaymentDTO;
import it.othala.payment.paypal.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalPaymentRefusedException;
import it.othala.service.factory.OthalaFactory;
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

		checkQtaInStock(null,orderFull);
		
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
	public OrderFullDTO confirmOrderPayment(PayPalWrapper wrap, Integer idOrder, GetExpressCheckoutDetailsDTO details) throws StockNotPresentException, PayPalException, PayPalFundingFailureException, PayPalFailureException, PayPalPaymentRefusedException 
	{
		
		OrderFullDTO orderFull = checkQtaInStock(idOrder,null);
			
		orderFull = doPaymentByPayPal(wrap, idOrder, details);
		
		orderDAO.updateOrder(orderFull.getIdOrder(), 
				orderFull.getIdTransaction(), null);
		
		updateStateOrder(null, orderFull, TypeStateOrder.valueOf(orderFull.getIdStato()));
		
		updateStock(orderFull,true);
		
		return orderFull;

	}
	
	private OrderFullDTO checkQtaInStock(Integer idOrder, OrderFullDTO orderFull) throws StockNotPresentException{
		
		if (orderFull == null){
			List<OrderFullDTO> lsOrders = orderDAO.getOrders(idOrder, null, null);
			Iterator<OrderFullDTO> oi = lsOrders.iterator();
			orderFull = oi.next();
		}

		List<ArticleFullDTO> lsProd = orderFull.getCart();
		Iterator<ArticleFullDTO> i = lsProd.iterator();
		while (i.hasNext()) {
			ArticleFullDTO article = i.next();

			Integer qtaProduct = productDAO.getQtStockLock(article.getPrdFullDTO().getIdProduct(), article.getPgArticle());
			
			if (qtaProduct < article.getQtBooked()){
				List<String> prodNoStock = new ArrayList<String>();
				prodNoStock.add(article.getPrdFullDTO().getDescription());
				throw new StockNotPresentException();}
	
		}
		return orderFull;
	}
	
	private void updateStock(OrderFullDTO orderFull, boolean fgVendita)
	{
		List<ArticleFullDTO> lsProd = orderFull.getCart();
		Iterator<ArticleFullDTO> i = lsProd.iterator();
		while (i.hasNext()) {
			ArticleFullDTO article = i.next();

			productDAO.updateQtStock(article.getPrdFullDTO().getIdProduct(), 
					article.getPgArticle(), article.getQtBooked(), fgVendita);

		}
	}

	@Override
	public void confirmOrderDelivery(String idTrackingNumber, Integer idOrder) {

		orderDAO.updateOrder(idOrder, null, idTrackingNumber);

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
	public void updateStateOrder(Integer idOrder, OrderFullDTO orderFull, TypeStateOrder stato) {
		
		if (orderFull == null){
			List<OrderFullDTO> lsOrders = orderDAO.getOrders(idOrder, null, null);
			Iterator<OrderFullDTO> oi = lsOrders.iterator();
			orderFull = oi.next();
		}
		
		StateOrderDTO stateOrder = new StateOrderDTO();
		stateOrder.setIdOrder(orderFull.getIdOrder());
		stateOrder.setIdStato(stato.getState());
		stateOrder.setTxNote(null);

		orderDAO.updateStateOrder(stateOrder);
		
		switch (stato){
			case DENIED:
			case FAILED:
				updateStock(orderFull,false);
			default:
		}
		
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
	public OrderFullDTO doPaymentByPayPal(PayPalWrapper wrap, Integer idOrder, GetExpressCheckoutDetailsDTO details)
			throws StockNotPresentException, PayPalException, PayPalFundingFailureException, PayPalFailureException,
			PayPalPaymentRefusedException {
		// TODO Auto-generated method stub
		List<OrderFullDTO> orders = orderDAO.getOrders(idOrder, null, null);
		OrderFullDTO order = orders.get(0);

		return doCheckOutPayPal(wrap, order, details);
	}

	private OrderFullDTO doCheckOutPayPal(PayPalWrapper wrap, OrderFullDTO order, GetExpressCheckoutDetailsDTO details)
			throws PayPalFundingFailureException, PayPalPaymentRefusedException, PayPalException,
			PayPalFailureException {

		// effettuo il pagamento paypal
		DoExpressCheckoutPaymentDTO checkDTO = wrap.doExpressCheckoutPayment(details);
		
		order.setIdTransaction(checkDTO.getPAYMENTINFO_0_TRANSACTIONID());
		order.setIdStato(TypeStateOrder.getIdFromDescription(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS()));

		return order;
	}

}
