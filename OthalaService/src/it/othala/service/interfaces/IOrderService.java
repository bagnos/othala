package it.othala.service.interfaces;

import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.dto.RendicontoOrdini;
import it.othala.dto.RendicontoTotDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
import it.othala.execption.OthalaException;
import it.othala.execption.RefoundPresentException;
import it.othala.execption.StockNotPresentException;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

public interface IOrderService {

	public List<OrderFullDTO> getOrders(Integer Order, String User, TypeStateOrder StatoOrdine, Boolean fgStIns);

	public List<OrderFullDTO> getOrders(Integer Order, String User, TypeStateOrder StatoOrdine, Boolean fgStIns, String idTransaction);
	
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

	public String stampaOrdineHTML(Integer idOrder, String pathLogo) throws Exception;

	public List<RefoundFullDTO> getRefounds(Integer idRefound, Integer Order, String User, TypeStateOrder StatoOrdine, String idTransaction, String fgChangeRefound);
	
	public RefoundFullDTO insertRefound(RefoundFullDTO refoundFull, MailPropertiesDTO mailProps) throws  OthalaException, RefoundPresentException;

	public void updateStateRefound(Integer idRefound, TypeStateOrder stato, String txNote);
	
	public void setRefoundTransaction(Integer idRefound, String idTransaction);

	public List<DeliveryCostDTO> getSpeseSpedizione(String idNazione);
	
	public String addFidelityCard(FidelityCardDTO carta);
	
	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail, String celNum) throws FidelityCardNotPresentException, FidelityCardNotValidException;
	
	public void aggiornaFidelity(String idFidelity, Integer pcSconto, String txNome, String txCognome, String txEmail, String txTel);
	
	public void aggiornaQtaCambio(Integer idProduct, Integer pgArticleIn, Integer pgArticleOut);
	
	public String stampaResoHTML(Integer idReso, String pathLogo)
			throws Exception;
	
	public String stampaCambioHTML(Integer idReso, String pathLogo)
			throws Exception;

	public void sendMailInsertReso(Integer idReso, MailPropertiesDTO mailProps)
			throws Exception;
	
	public void sendMailInsertCambio(Integer idReso, MailPropertiesDTO mailProps)
			throws Exception;
	
	public void sendMailConfirmCambio(Integer idReso, MailPropertiesDTO mailProps)
			throws Exception;
	
	public void sendMailConfirmReso(Integer idReso, MailPropertiesDTO mailProps)
			throws Exception;
		
	public String insertCoupon (CouponDTO couponDTO) throws Exception;
	
	public void updateCoupon (CouponDTO couponDTO) throws Exception;
	
	public List<CouponDTO> getCoupons (String idCoupon, String idUser) throws Exception;

	public void deleteCoupon(String idCoupon) throws Exception;
	
	public void deleteFidelityCard(String idFidelity) throws Exception;
	
	public CouponDTO checkCoupon(String idCoupon, String idUser)
			throws OthalaException;

	public void burnCoupon(String idCoupon) throws Exception;
	
	public List<FidelityCardDTO> getFidelityCards(String idFidelity, String txNome, String txCognome, String txEmail) throws Exception;
	
	public RendicontoTotDTO getTotaliOrdini(Timestamp dtDa, Timestamp dtA, TypeStateOrder statoOrdine, TypeStateOrder statoRefound);

	public void aggiornaNewsletter();
	
	
	
}
