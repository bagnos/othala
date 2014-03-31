package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

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
	private Integer idProdotto;
	private Integer pgArticle;
	
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
	public Integer getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(Integer idProdotto) {
		this.idProdotto = idProdotto;
	}
	public Integer getPgArticle() {
		return pgArticle;
	}
	public void setPgArticle(Integer pgArticle) {
		this.pgArticle = pgArticle;
	}
	
}
