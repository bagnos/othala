package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.portable.IndirectionException;

public class RefoundFullDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idRefound;
	private Integer idOrder;
	private String idUser;
	private String idTransaction;
	private BigDecimal imRefound;
	private Integer idStato;
	private String txStato;
	private Timestamp dtStato;
	private String txNote;
	private List<ArticleFullDTO> cart;

	public Integer getIdRefound() {
		return idRefound;
	}
	public void setIdRefound(Integer idRefound) {
		this.idRefound = idRefound;
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
	public String getIdTransaction() {
		return idTransaction;
	}
	public void setIdTransaction(String idTransaction) {
		this.idTransaction = idTransaction;
	}
	public BigDecimal getImRefound() {
		return imRefound;
	}
	public void setImRefound(BigDecimal imRefound) {
		this.imRefound = imRefound;
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
	public List<ArticleFullDTO> getCart() {
		return cart;
	}
	public void setCart(List<ArticleFullDTO> cart) {
		this.cart = cart;
	}
	
	
}
