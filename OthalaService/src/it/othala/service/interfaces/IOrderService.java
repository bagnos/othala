package it.othala.service.interfaces;

import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;

import java.io.File;
import java.util.List;

public interface IOrderService {

	public List<OrderFullDTO> getOrders(Integer Order, String User, TypeStateOrder StatoOrdine);

	public List<OrderFullDTO> getOrders(Integer Order, String User, TypeStateOrder StatoOrdine, String idTransaction);
	
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

	public CouponDTO checkCoupon(String idCoupon) throws OthalaException;

	public String stampaOrdineHTML(Integer idOrder, String pathLogo) throws Exception;

	public List<RefoundFullDTO> getRefounds(Integer idRefound, Integer Order, String User, TypeStateOrder StatoOrdine, String idTransaction);
	
	public RefoundFullDTO insertRefound(RefoundFullDTO refoundFull) throws  OthalaException;

	public void updateStateRefound(Integer idRefound, TypeStateOrder stato, String txNote);
	
	public void setRefoundTransaction(Integer idRefound, String idTransaction);

}
