package it.othala.dao.interfaces;

import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.StateOrderDTO;

import java.util.HashMap;
import java.util.List;
import java.sql.Date;

public interface IOrderDAO {

	public List<OrderFullDTO> getOrders(Integer idOrder,String idUser,Integer idStato);
	
	public OrderFullDTO insertOrder(OrderFullDTO orderFull);
	
	//public void insertOrdersArticles(Integer idOrder, OrderProductDTO orderProduct);
	public void insertOrdersArticles(HashMap<String, Object> mapProduct);
	
	public void insertStatesOrders(OrderFullDTO orderFull);
	
	public void updateStatesOrders(StateOrderDTO stateOrder);
	
	public DeliveryAddressDTO newAddress(DeliveryAddressDTO newAddress);
	
	public void newDeliveryCost(DeliveryCostDTO newDeliveryCost);
	
	public List<DeliveryAddressDTO> getDeliveryAddress(String userId);
	
	public void updateOrder(String idTransaction, Integer idOrder);
	
	public void deleteAddress(Integer idAddress);
	
	public List<DeliveryCostDTO> getDeliveryCost(); 
}
