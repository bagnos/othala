package it.othala.dao;

import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.dto.RendicontoOrdini;
import it.othala.dto.SiteImagesDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class OrderDAO extends SqlSessionDaoSupport implements IOrderDAO {

	@Override
	public List<OrderFullDTO> getOrders(Integer idOrder, String idUser,
			Integer idStato, Boolean fgStIns) {

		return getOrders(idOrder, idUser, idStato, fgStIns, null);
	}

	@Override
	public List<OrderFullDTO> getOrders(Integer idOrder, String idUser,
			Integer idStato, Boolean fgStIns,String idTransaction) {

		HashMap<String, Object> mapOrder = new HashMap<>();
		if (idOrder != null && idOrder > 0)
			mapOrder.put("idOrder", idOrder);
		if (idUser != null && !idUser.isEmpty())
			mapOrder.put("idUser", idUser);
		if (idStato != null && idStato > 0)
			mapOrder.put("idStato", idStato);
		if (fgStIns != null)
			mapOrder.put("fgStIns", fgStIns);
		if (idTransaction != null && !idTransaction.isEmpty())
			mapOrder.put("idTransaction", idTransaction);

		// recupero prodotti
		List<OrderFullDTO> listOrder = getSqlSession().selectList(
				"it.othala.order.queries.listOrder", mapOrder);

		return listOrder;

	}

	@Override
	public OrderFullDTO insertOrder(OrderFullDTO orderFull) {

		getSqlSession()
				.insert("it.othala.order.queries.insertOrder", orderFull);

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

		HashMap<String, Object> mapUpdate = new HashMap<String, Object>();

		mapUpdate.put("idNazione", idNazione);

		List<DeliveryCostDTO> listCost = getSqlSession().selectList(
				"it.othala.order.queries.deliveryCosts", mapUpdate);

		return listCost;
	}

	@Override
	public List<DeliveryAddressDTO> getDeliveryAddress(String userId) {
		List<DeliveryAddressDTO> listAddress = getSqlSession().selectList(
				"it.othala.order.queries.deliveryAddresses", userId);

		return listAddress;
	}

	@Override
	public void insertOrdersArticles(HashMap<String, Object> mapProduct) {
		getSqlSession().insert("it.othala.order.queries.insertOrdersArticles",
				mapProduct);

	}

	@Override
	public void updateOrder(Integer idOrder, String idTransaction,
			String idTrackingNumber) {

		HashMap<String, Object> mapUpdate = new HashMap<String, Object>();

		mapUpdate.put("idOrder", idOrder);
		if (idTransaction != null)
			mapUpdate.put("idTransaction", idTransaction);
		if (idTrackingNumber != null)
			mapUpdate.put("idTrackingNumber", idTrackingNumber);

		getSqlSession()
				.update("it.othala.order.queries.updateOrder", mapUpdate);

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
			mapOrder.put("idCoupon", idCoupon);
		if (idUser != null)
			mapOrder.put("idUser", idUser);

		List<CouponDTO> listCoupons = getSqlSession().selectList(
				"it.othala.order.queries.listCoupons", mapOrder);

		return listCoupons;
	}

	@Override
	public void burnCoupon(String idCoupon) {

		HashMap<String, Object> mapOrder = new HashMap<>();
		mapOrder.put("idCoupon", idCoupon);

		List<CouponDTO> listCoupons = getSqlSession().selectList(
				"it.othala.order.queries.listCoupons", mapOrder);
		
		if (listCoupons.get(0) != null) {
			if (listCoupons.get(0).getQtUtilizzo() != null) {

				getSqlSession()
				.update("it.othala.order.queries.burnCoupon", idCoupon);
				
			}
		}
		
	}
	
	@Override
	public void deleteCoupon(String idCoupon) {

		getSqlSession()
				.delete("it.othala.order.queries.deleteCoupon", idCoupon);

	}
	
	

	@Override
	public List<RefoundFullDTO> getRefounds(Integer idRefound, Integer idOrder,
			String idUser, Integer idStato, String idTransaction,
			String fgChangeRefound) {

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
		if (fgChangeRefound != null && !fgChangeRefound.isEmpty())
			mapRefound.put("fgChangeRefound", fgChangeRefound);

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

		HashMap<String, Object> mapUpdate = new HashMap<String, Object>();

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
	public void updateFidelity(String idFidelity, Integer pcSconto, String txNome, String txCognome, String txEmail, String txTel) {

		HashMap<String, Object> mapUpdate = new HashMap<String, Object>();

		mapUpdate.put("idFidelity", idFidelity);
		
		if(txNome != null && !txNome.isEmpty())
			mapUpdate.put("txNome", txNome);
		
		if(txCognome != null && !txCognome.isEmpty())
			mapUpdate.put("txCognome", txCognome);
		
		if(txEmail != null && !txEmail.isEmpty())
			mapUpdate.put("txEmail", txEmail);
		
		if (pcSconto != null && pcSconto > 0)
			mapUpdate.put("pcSconto", pcSconto);
		
		if(txTel != null && !txTel.isEmpty())
			mapUpdate.put("txTel", txTel);
		
		getSqlSession().insert("it.othala.order.queries.updateFidelityCard",
				mapUpdate);

	}

	@Override
	public List<FidelityCardDTO> getFidelityCard(String idFidelity, String txNome, String txCognome, String txEmail) {
		
		HashMap<String, Object> mapSelect = new HashMap<String, Object>();

		if(idFidelity != null && !idFidelity.isEmpty())
			mapSelect.put("idFidelity", idFidelity);
		
		if(txNome != null && !txNome.isEmpty())
			mapSelect.put("txNome", txNome);
		
		if(txCognome != null && !txCognome.isEmpty())
			mapSelect.put("txCognome", txCognome);
		
		if(txEmail != null && !txEmail.isEmpty())
			mapSelect.put("txEmail", txEmail);	
		
			
		List<FidelityCardDTO> fidelityCard = getSqlSession().selectList(
				"it.othala.order.queries.selectFidelityCard", mapSelect);

		return fidelityCard;
	}

	@Override
	public void updateCoupon(CouponDTO couponDTO) {

		HashMap<String, Object> mapOrder = new HashMap<>();
		mapOrder.put("idCoupon", couponDTO.getIdCoupon());
		mapOrder.put("idUser", couponDTO.getIdUser());
		mapOrder.put("pcSconto", couponDTO.getPcSconto());
		mapOrder.put("dtScadenza", couponDTO.getDtScadenza());
		mapOrder.put("qtUtilizzo", couponDTO.getQtUtilizzo());
				

		getSqlSession()
				.update("it.othala.order.queries.updateCoupon", mapOrder);

	}
	
	@Override
	public void insertCoupon(CouponDTO couponDTO) {

		HashMap<String, Object> mapOrder = new HashMap<>();
		mapOrder.put("idCoupon", couponDTO.getIdCoupon());
		mapOrder.put("idUser", couponDTO.getIdUser());
		mapOrder.put("pcSconto", couponDTO.getPcSconto());
		mapOrder.put("dtScadenza", couponDTO.getDtScadenza());
		mapOrder.put("qtUtilizzo", couponDTO.getQtUtilizzo());	
		

		getSqlSession()
				.insert("it.othala.order.queries.insertCoupon", mapOrder);

	}

	@Override
	public void deleteFidelityCard(String idFidelity) {
		getSqlSession()
		.delete("it.othala.order.queries.deleteFidelityCard", idFidelity);
		
	}

	@Override
	public RendicontoOrdini getTotaliOrdini(Timestamp dtDa, Timestamp dtA,
			TypeStateOrder statoOrdine, TypeStateOrder statoRefound) {
		
		HashMap<String, Object> mapOrder = new HashMap<>();
		mapOrder.put("dtDa", dtDa);
		mapOrder.put("dtA", dtA);
		if (statoOrdine != null)
			mapOrder.put("idStatoOrdine", statoOrdine.getState());
		else
			mapOrder.put("idStatoOrdine", statoOrdine.SPEDITO.getState());
		if (statoRefound != null)
			mapOrder.put("idStatoRefound", statoRefound.getState());
		else
			mapOrder.put("idStatoRefound", statoRefound.REFOUND_COMPLETED.getState());
		
		RendicontoOrdini rcoOrd = getSqlSession().selectOne("it.othala.order.queries.selectTotOrders", mapOrder);
		RendicontoOrdini rcoRef = getSqlSession().selectOne("it.othala.order.queries.selectTotRefounds", mapOrder);
		rcoOrd.setImpTotRefounds(rcoRef.getImpTotRefounds());
		rcoOrd.setNumTotRefounds(rcoRef.getNumTotRefounds());
		
		return rcoOrd;
	}



}
