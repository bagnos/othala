package it.othala.service.interfaces;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.StateOrderDTO;

import java.sql.Date;
import java.util.List;

public interface IOrderService {
	
	public List<OrderFullDTO> getOrders(Integer Order,Integer User,Integer StatoOrdine, Date DataIniPeriodo, Date DataFinPeriodo);
	
	public Integer insertOrder(OrderFullDTO orderFull) throws MailNotSendException;
	
	public void updateOrder(StateOrderDTO stateOrder);
	
}
