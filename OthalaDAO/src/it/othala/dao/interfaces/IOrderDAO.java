package it.othala.dao.interfaces;

import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.dto.StateOrderDTO;

import java.util.HashMap;
import java.util.List;

public interface IOrderDAO {

	public List<OrderFullDTO> getOrders(Integer idOrder,String idUser,Integer idStato);
	
	public List<OrderFullDTO> getOrders(Integer idOrder,String idUser,Integer idStato, String idTransaction);
	
	public OrderFullDTO insertOrder(OrderFullDTO orderFull);
	
	public void insertOrdersArticles(HashMap<String, Object> mapProduct);
	
	public void insertStatesOrders(OrderFullDTO orderFull);
	
	public void updateStateOrder(StateOrderDTO stateOrder);
	
	public DeliveryAddressDTO newAddress(DeliveryAddressDTO newAddress);
	
	public void newDeliveryCost(DeliveryCostDTO newDeliveryCost);
	
	public List<DeliveryAddressDTO> getDeliveryAddress(String userId);
	
	public void updateOrder(Integer idOrder, String idTransaction, String idTrackingNumber);
	
	public void deleteAddress(Integer idAddress);
	
	public void deleteDeliveryCost(Integer idDeliveryCost);
	
	public List<DeliveryCostDTO> getDeliveryCost(String idNazione);
	
	public List<CouponDTO> getCoupons(String idCoupon, String idUser);
	
	public void burnCoupon(String idCoupon);
	
	public List<RefoundFullDTO> getRefounds(Integer idRefound, Integer idOrder,String idUser,Integer idStato, String idTransaction, String fgChangeRefound);
	
	public RefoundFullDTO insertRefound(RefoundFullDTO refoundFull);
	
	public void updateRefound(Integer idRefound, String idTransaction);
	
	public void insertRefoundArticles(HashMap<String, Object> mapProduct);
	
	public void insertStatesRefound(RefoundFullDTO refoundFull);
	
	public void updateStateRefound(HashMap<String, Object> mapProduct);
	
	public void newFidelityCard(FidelityCardDTO fidelity);
	
	public void updateScontoFidelity(String idFidelity, int pcSconto);
	
	public FidelityCardDTO getFidelityCard(String idFidelity);

	public void updateCoupon(CouponDTO couponDTO);

	public void insertCoupon(CouponDTO couponDTO);

	public void deleteCoupon(String idCoupon);


	

}
