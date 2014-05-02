package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
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
	private Date dtStato;
	private String txNote;
	private BigDecimal imOrdine;
	private BigDecimal imSpeseSpedizione;
	private DeliveryAddressDTO billingAddress;
	private DeliveryAddressDTO shippingAddress;
	private List<ArticleFullDTO> cart;
	private String nameUser;
	private String surnameUser;
	private String idTransaction;
	
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
	public Date getDtStato() {
		return dtStato;
	}
	public void setDtStato(Date dtStato) {
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
	public BigDecimal getImSpeseSpedizione() {
		return imSpeseSpedizione;
	}
	public void setImSpeseSpedizione(BigDecimal imSpeseSpedizione) {
		this.imSpeseSpedizione = imSpeseSpedizione;
	}
	
}
