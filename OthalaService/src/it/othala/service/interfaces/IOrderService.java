package it.othala.service.interfaces;

import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
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

	public List<RefoundFullDTO> getRefounds(Integer idRefound, Integer Order, String User, TypeStateOrder StatoOrdine, String idTransaction, String fgChangeRefound);
	
	public RefoundFullDTO insertRefound(RefoundFullDTO refoundFull, MailPropertiesDTO mailProps) throws  OthalaException;

	public void updateStateRefound(Integer idRefound, TypeStateOrder stato, String txNote);
	
	public void setRefoundTransaction(Integer idRefound, String idTransaction);

	public List<DeliveryCostDTO> getSpeseSpedizione(String idNazione);
	
	public void addFidelityCard(FidelityCardDTO carta);
	
	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail, String celNum) throws FidelityCardNotPresentException, FidelityCardNotValidException;
	
	public void aggiornaScontoFidelity(String idFidelity, int pcSconto);
	
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
		
	
	
}
