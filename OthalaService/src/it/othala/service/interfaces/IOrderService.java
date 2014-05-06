package it.othala.service.interfaces;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.MailConfermaDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.execption.OthalaException;

import java.sql.Date;
import java.util.List;

public interface IOrderService {
	
	public List<OrderFullDTO> getOrders(Integer Order,String User,Integer StatoOrdine);
	
	public OrderFullDTO insertOrder(OrderFullDTO orderFull) throws MailNotSendException, OthalaException;
	
	public void updateStateOrder(StateOrderDTO stateOrder);
	
	public void updateOrder(String idTransaction, Integer idOrder, Integer idStato, String idTrackingNumber);
	
	public void deleteAddress(Integer idAddress);
	
	public DeliveryDTO getDeliveryInfo(String userId);
	
	public DeliveryAddressDTO newAddress(DeliveryAddressDTO newAddress);
	
	public DeliveryAddressDTO updateAddress(DeliveryAddressDTO newAddress, Integer idAddress);
	public void inviaMailDiConferma(OrderFullDTO order,MailConfermaDTO mailDTO) throws MailNotSendException;
	
}
