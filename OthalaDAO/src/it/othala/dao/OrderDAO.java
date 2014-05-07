package it.othala.dao;

import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.execption.OthalaException;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class OrderDAO extends SqlSessionDaoSupport implements IOrderDAO  {

	@Override
	public List<OrderFullDTO> getOrders(Integer idOrder, String idUser,
			Integer idStato) {
		
		HashMap<String, Object> mapOrder = new HashMap<>();
		if (idOrder != null && idOrder > 0)
			mapOrder.put("idOrder", idOrder);
		if (idUser != null && !idUser.isEmpty())
			mapOrder.put("idUser", idUser);
		if (idStato != null && idStato > 0)
			mapOrder.put("idStato", idStato);


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
	public void updateStatesOrders(StateOrderDTO stateOrder) {
		
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
	public List<DeliveryCostDTO> getDeliveryCost() {
		// recupero spese spedizione
		List<DeliveryCostDTO> listCost = getSqlSession().selectList(
				"it.othala.order.queries.deliveryCosts");
		
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

	@Override
	public void updateOrder(String idTransaction, Integer idOrder, Integer idStato, String idTrackingNumber) {

		HashMap<String, Object> mapUpdate =  new HashMap<String, Object>();
		if (idTransaction != null && !idTransaction.isEmpty())
			mapUpdate.put("idTransaction", idTransaction);
		else
			if (idTrackingNumber != null && !idTrackingNumber.isEmpty())
				mapUpdate.put("idTrackingNumber", idTrackingNumber);
		
		mapUpdate.put("idOrder", idOrder);
		
		getSqlSession().update("it.othala.order.queries.updateOrder",
				mapUpdate);
		
		StateOrderDTO stateOrder = new StateOrderDTO();
		stateOrder.setIdOrder(idOrder);
		stateOrder.setIdStato(idStato);
		getSqlSession().insert("it.othala.order.queries.updateStatesOrders",
				stateOrder);
		
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

}
