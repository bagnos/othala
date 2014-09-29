package it.othala.dao;

import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class OrderDAO extends SqlSessionDaoSupport implements IOrderDAO  {

	@Override
	public List<OrderFullDTO> getOrders(Integer idOrder, String idUser,
			Integer idStato) {
		
		return getOrders(idOrder,idUser,idStato,null);
	}
	
	@Override
	public List<OrderFullDTO> getOrders(Integer idOrder, String idUser,
			Integer idStato, String idTransaction) {
		
		HashMap<String, Object> mapOrder = new HashMap<>();
		if (idOrder != null && idOrder > 0)
			mapOrder.put("idOrder", idOrder);
		if (idUser != null && !idUser.isEmpty())
			mapOrder.put("idUser", idUser);
		if (idStato != null && idStato > 0)
			mapOrder.put("idStato", idStato);
		if (idTransaction != null && !idTransaction.isEmpty())
			mapOrder.put("idTransaction", idTransaction);

		// recupero prodotti
		List<OrderFullDTO> listOrder = getSqlSession().selectList(
				"it.othala.order.queries.listOrder", mapOrder);
		
		return listOrder;

	}
	

	@Override
	public OrderFullDTO insertOrder(OrderFullDTO orderFull) {
		
		getSqlSession().insert("it.othala.order.queries.insertOrder",
				orderFull);
		
		return orderFull;
	}

	@Override
	public void insertStatesOrders(OrderFullDTO orderFull) {
		
		getSqlSession().insert("it.othala.order.queries.insertStatesOrders",
				orderFull);
		
		}

	@Override
	public void updateStateOrder(StateOrderDTO stateOrder) {
		
		getSqlSession().insert("it.othala.order.queries.updateStatesOrders",
				stateOrder);
		
	}

	@Override
	public DeliveryAddressDTO newAddress(DeliveryAddressDTO newAddress) {
		getSqlSession().insert("it.othala.order.queries.insertAddress",
				newAddress);
		
		return newAddress;
	}

	@Override
	public void newDeliveryCost(DeliveryCostDTO newDeliveryCost) {
		getSqlSession().insert("it.othala.order.queries.insertDeliveryCost",
				newDeliveryCost);
		
	}


	@Override
	public List<DeliveryCostDTO> getDeliveryCost(String idNazione) {
		
		HashMap<String, Object> mapUpdate =  new HashMap<String, Object>();
		
		mapUpdate.put("idNazione", idNazione);		
		
		List<DeliveryCostDTO> listCost = getSqlSession().selectList(
				"it.othala.order.queries.deliveryCosts",mapUpdate);
		
		return listCost;
	}

	@Override
	public List<DeliveryAddressDTO> getDeliveryAddress(String userId) {
		List<DeliveryAddressDTO> listAddress = getSqlSession().selectList(
				"it.othala.order.queries.deliveryAddresses",userId);
		
		return listAddress;
	}

	@Override
	public void insertOrdersArticles(HashMap<String, Object> mapProduct) {
		getSqlSession().insert("it.othala.order.queries.insertOrdersArticles",
				mapProduct);
		
	}
	
	@Override public void updateOrder(Integer idOrder, String idTransaction, String idTrackingNumber){
		
		HashMap<String, Object> mapUpdate =  new HashMap<String, Object>();
		
		mapUpdate.put("idOrder", idOrder);		
		if (idTransaction != null)
			mapUpdate.put("idTransaction", idTransaction);
		if (idTrackingNumber != null)
			mapUpdate.put("idTrackingNumber", idTrackingNumber);
		
		getSqlSession().update("it.othala.order.queries.updateOrder",
				mapUpdate);
		
	}

	@Override
	public void deleteAddress(Integer idAddress) {
		
			
		getSqlSession().delete("it.othala.order.queries.deleteAddress",
				idAddress);
		
	}
	
	@Override
	public void deleteDeliveryCost(Integer idDeliveryCost) {
			
		getSqlSession().delete("it.othala.order.queries.deleteDeliveryCost",
				idDeliveryCost);
		
	}
	
	@Override
	public List<CouponDTO> getCoupons(String idCoupon, String idUser) {
		
		HashMap<String, Object> mapOrder = new HashMap<>();
		if (idCoupon != null)
			mapOrder.put("idStato", idCoupon);
		if (idUser != null)
			mapOrder.put("idUser", idUser);


		// recupero prodotti
		List<CouponDTO> listCoupons = getSqlSession().selectList(
				"it.othala.order.queries.listCoupons", mapOrder);
		
		return listCoupons;
	}

	@Override
	public void burnCoupon(String idCoupon) {
		
		getSqlSession().update(
				"it.othala.order.queries.updateCoupon", idCoupon);
		
	}

	@Override
	public List<RefoundFullDTO> getRefounds(Integer idRefound, Integer idOrder,
			String idUser, Integer idStato, String idTransaction) {
		
		HashMap<String, Object> mapRefound = new HashMap<>();
		if (idRefound != null && idRefound > 0)
			mapRefound.put("idRefound", idRefound);
		if (idOrder != null && idOrder > 0)
			mapRefound.put("idOrder", idOrder);
		if (idUser != null && !idUser.isEmpty())
			mapRefound.put("idUser", idUser);
		if (idStato != null && idStato > 0)
			mapRefound.put("idStato", idStato);
		if (idTransaction != null && !idTransaction.isEmpty())
			mapRefound.put("idTransaction", idTransaction);

		// recupero resi
		List<RefoundFullDTO> listRefounds = getSqlSession().selectList(
				"it.othala.order.queries.listRefounds", mapRefound);
		
		return listRefounds;
	}

	@Override
	public RefoundFullDTO insertRefound(RefoundFullDTO refoundFull) {
		
		getSqlSession().insert("it.othala.order.queries.insertRefound",
				refoundFull);
		
		return refoundFull;
	}

	@Override
	public void updateRefound(Integer idRefound, String idTransaction) {
		
		HashMap<String, Object> mapUpdate =  new HashMap<String, Object>();
		
		mapUpdate.put("idRefound", idRefound);		
		if (idTransaction != null)
			mapUpdate.put("idTransaction", idTransaction);
		
		getSqlSession().update("it.othala.order.queries.updateRefound",
				mapUpdate);
		
	}

	@Override
	public void insertRefoundArticles(HashMap<String, Object> mapProduct) {
		
		getSqlSession().insert("it.othala.order.queries.insertRefoundArticles",
				mapProduct);
		
	}

	@Override
	public void insertStatesRefound(RefoundFullDTO refoundFull) {
		getSqlSession().insert("it.othala.order.queries.insertStatesRefound",
				refoundFull);
		
	}

	@Override
	public void updateStateRefound(HashMap<String, Object> mapProduct) {
		getSqlSession().insert("it.othala.order.queries.updateStatesRefound",
				mapProduct);
		
	}

	@Override
	public void newFidelityCard(FidelityCardDTO fidelity) {
		getSqlSession().insert("it.othala.order.queries.insertFidelityCard",
				fidelity);
		
	}

	@Override
	public void updateScontoFidelity(String idFidelity, int pcSconto) {
		
		HashMap<String, Object> mapUpdate =  new HashMap<String, Object>();
		
		mapUpdate.put("idFidelity", idFidelity);		
		mapUpdate.put("pcSconto", pcSconto);
		
		getSqlSession().insert("it.othala.order.queries.updateFidelityCard",
				mapUpdate);
		
	}

	@Override
	public FidelityCardDTO getFidelityCard(String idFidelity) {
		// recupero resi
		FidelityCardDTO fidelityCard = getSqlSession().selectOne(
				"it.othala.order.queries.selectFidelityCard", idFidelity);
		
		return fidelityCard;
	}


	

}
