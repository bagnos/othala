package it.othala.service.interfaces;

import it.othala.dto.OrderFullDTO;

import java.sql.Date;
import java.util.List;

public interface IOrderService {
	
	public List<OrderFullDTO> getOrders(Integer Order,Integer User,Integer StatoOrdine, Date DataIniPeriodo, Date DataFinPeriodo);
	
	public Integer insertOrder(OrderFullDTO orderFull);
	
}
