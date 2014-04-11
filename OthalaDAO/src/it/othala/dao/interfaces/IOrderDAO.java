package it.othala.dao.interfaces;

import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.StateOrderDTO;

import java.util.List;
import java.sql.Date;

public interface IOrderDAO {

	public List<OrderFullDTO> getOrders(Integer idOrder,Integer idUser,Integer idStato, Date dtDatada, Date dtDataA);
	
	public Integer insertOrder(OrderFullDTO orderFull);
	
	public void insertOrdersArticles(OrderFullDTO orderFull);
	
	public void insertStatesOrders(OrderFullDTO orderFull);
	
	public void updateStatesOrders(StateOrderDTO stateOrder);
	
	public void newAddress(DeliveryAddressDTO newAddress);
	
	public void newDeliveryCost(DeliveryCostDTO newDeliveryCost);
	
	public List<DeliveryAddressDTO> getDeliveryAddress(String userId);
	
	public List<DeliveryCostDTO> getDeliveryCost(); 
}
