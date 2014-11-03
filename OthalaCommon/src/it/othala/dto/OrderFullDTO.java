package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.portable.IndirectionException;

public class OrderFullDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idOrder;
	private String idUser;
	private Integer idStato;
	private String txStato;
	private Timestamp dtStato;
	private String txNote;
	private BigDecimal imOrdine;
	private DeliveryCostDTO speseSpedizione;
	private DeliveryAddressDTO billingAddress;
	private DeliveryAddressDTO shippingAddress;
	private List<ArticleFullDTO> cart;
	private String nameUser;
	private String surnameUser;
	private String idTransaction;
	private String idTrackingNumber;
	private String pendingReason;
	private BigDecimal imItemOrdine;
	private String idFidelity;
	private String idCoupon;
	private int pcSconto;
	private BigDecimal imOrdineDiscount;
	private BigDecimal imOrdineSenzaSpese;
	
	
	public BigDecimal getImOrdineSenzaSpese() {
		return imOrdineSenzaSpese;
	}

	public void setImOrdineSenzaSpese(BigDecimal imOrdineSenzaSpese) {
		this.imOrdineSenzaSpese = imOrdineSenzaSpese;
	}

	public BigDecimal getImOrdineDiscount() {
		return imOrdineDiscount;
	}

	public void setImOrdineDiscount(BigDecimal imOrdineDiscount) {
		this.imOrdineDiscount = imOrdineDiscount;
	}

	
	
	public String getIdFidelity() {
		return idFidelity;
	}

	public void setIdFidelity(String idFidelity) {
		this.idFidelity = idFidelity;
	}

	public String getIdCoupon() {
		return idCoupon;
	}

	public void setIdCoupon(String idCoupon) {
		this.idCoupon = idCoupon;
	}

	public BigDecimal getImItemOrdine() {
		return imItemOrdine;
	}

	public void setImItemOrdine(BigDecimal ImItemOrdine) {
		this.imItemOrdine = ImItemOrdine;
	}

	public String getPendingReason() {
		return pendingReason;
	}

	public void setPendingReason(String pendingReason) {
		this.pendingReason = pendingReason;
	}

	public String getIdTransaction() {
		return idTransaction;
	}

	public void setIdTransaction(String idTransaction) {
		this.idTransaction = idTransaction;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public String getSurnameUser() {
		return surnameUser;
	}

	public void setSurnameUser(String surnameUser) {
		this.surnameUser = surnameUser;
	}

	public List<ArticleFullDTO> getCart() {
		return cart;
	}

	public void setCart(List<ArticleFullDTO> cart) {
		this.cart = cart;
	}

	public DeliveryAddressDTO getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(DeliveryAddressDTO billingAddress) {
		this.billingAddress = billingAddress;
	}

	public DeliveryAddressDTO getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(DeliveryAddressDTO shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public Integer getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(Integer idOrder) {
		this.idOrder = idOrder;
	}

	public String getIdUser() {
		return idUser;
	}

	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}

	public Integer getIdStato() {
		return idStato;
	}

	public void setIdStato(Integer idStato) {
		this.idStato = idStato;
	}

	public String getTxStato() {
		return txStato;
	}

	public void setTxStato(String txStato) {
		this.txStato = txStato;
	}

	public Timestamp getDtStato() {
		return dtStato;
	}

	public void setDtStato(Timestamp dtStato) {
		this.dtStato = dtStato;
	}

	public String getTxNote() {
		return txNote;
	}

	public void setTxNote(String txNote) {
		this.txNote = txNote;
	}

	public BigDecimal getImOrdine() {
		return imOrdine;
	}

	public void setImOrdine(BigDecimal imOrdine) {
		this.imOrdine = imOrdine;
	}

	public DeliveryCostDTO getSpeseSpedizione() {
		return speseSpedizione;
	}

	public void setSpeseSpedizione(DeliveryCostDTO speseSpedizione) {
		this.speseSpedizione = speseSpedizione;
	}

	public String getIdTrackingNumber() {
		return idTrackingNumber;
	}

	public void setIdTrackingNumber(String idTrackingNumber) {
		this.idTrackingNumber = idTrackingNumber;
	}

	public int getPcSconto() {
		return pcSconto;
	}

	public void setPcSconto(int pcSconto) {
		this.pcSconto = pcSconto;
	}

}
