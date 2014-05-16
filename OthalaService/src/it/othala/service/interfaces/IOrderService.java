package it.othala.service.interfaces;

import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;

import java.util.List;

public interface IOrderService {

	public List<OrderFullDTO> getOrders(Integer Order, String User, Integer StatoOrdine);

	public OrderFullDTO insertOrder(OrderFullDTO orderFull) throws  OthalaException;

	public OrderFullDTO confirmOrderPayment(OrderFullDTO order)
			throws StockNotPresentException;

	public OrderFullDTO increaseQtaArticle(OrderFullDTO orderFull, TypeStateOrder stato);

	public void confirmOrderDelivery(String idTrackingNumber, Integer idOrder);

	public OrderFullDTO updateStateOrder(Integer idOrder, OrderFullDTO orderFull, TypeStateOrder stato);

	public void deleteAddress(Integer idAddress);

	public void deleteDeliveryCost(Integer idDeliveryCost);

	public DeliveryDTO getDeliveryInfo(String userId);

	public DeliveryAddressDTO newAddress(DeliveryAddressDTO newAddress);

	public DeliveryAddressDTO updateAddress(DeliveryAddressDTO newAddress, Integer idAddress);

	public OrderFullDTO checkQtaInStock(Integer idOrder, OrderFullDTO orderFull) throws StockNotPresentException;

}
