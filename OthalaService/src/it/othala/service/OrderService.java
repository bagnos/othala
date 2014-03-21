package it.othala.service;

import java.sql.Date;
import java.util.List;

import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dto.OrderFullDTO;
import it.othala.service.interfaces.IOrderService;

public class OrderService implements IOrderService {
	
	private IOrderDAO orderDAO;

	@Override
	public List<OrderFullDTO> getOrders(Integer Order, Integer User,
			Integer StatoOrdine, Date DataIniPeriodo, Date DataFinPeriodo) {
		
		List<OrderFullDTO> listaOrdini = orderDAO.getOrders(Order, User, 
				StatoOrdine, DataIniPeriodo, DataFinPeriodo);
		
		return listaOrdini;
	}

	@Override
	public Integer insertOrder(OrderFullDTO orderFull) {
		
		Integer NumeroOrdine = orderDAO.insertOrder(orderFull);
		orderDAO.insertOrdersArticles(orderFull);
		orderDAO.insertStatesOrders(orderFull);
		
		return NumeroOrdine;
	}

	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(IOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}


}
