package it.othala.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import it.othala.account.execption.MailNotSendException;
import it.othala.dao.ProductDAO;
import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.OrderProductDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.service.interfaces.IMailService;
import it.othala.service.interfaces.IOrderService;
import it.othala.service.interfaces.IMailService;

public class OrderService implements IOrderService {
	
	private IOrderDAO orderDAO;
	private IProductDAO productDao;
	private IMailService mailService;

	@Override
	public List<OrderFullDTO> getOrders(Integer Order, Integer User,
			Integer StatoOrdine, Date DataIniPeriodo, Date DataFinPeriodo) {
		
		List<OrderFullDTO> listaOrdini = orderDAO.getOrders(Order, User, 
				StatoOrdine, DataIniPeriodo, DataFinPeriodo);
		
		return listaOrdini;
	}

	@Override
	public Integer insertOrder(OrderFullDTO orderFull) throws MailNotSendException {
		
		 
		
		
		Integer NumeroOrdine = orderDAO.insertOrder(orderFull);
		
		List<OrderProductDTO> lsProd = orderFull.getProdotti();
		Iterator<OrderProductDTO> i = lsProd.iterator();
		while(i.hasNext()){
			orderDAO.insertOrdersArticles(i.next());
		}

		orderDAO.insertStatesOrders(orderFull);
		
		String[] mailTo = new String[1];
		mailTo[0] = "massimiliano_cencioni@tin.it";
		String subject = "Inserito nuovo ordine";
		String content = "Un nuovo ordine è stato inserito con codice: " + 
				NumeroOrdine.toString();
		mailService.inviaMail(mailTo, subject, content);
		
		return NumeroOrdine;
	}

	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(IOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	@Override
	public void updateOrder(StateOrderDTO stateOrder) {
		
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
	public void newAddress(DeliveryAddressDTO newAddress) {
		orderDAO.newAddress(newAddress);
		
	}


}
