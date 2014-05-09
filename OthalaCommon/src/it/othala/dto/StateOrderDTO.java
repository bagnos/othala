package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

public class StateOrderDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer idOrder;
	private Integer idStato;
	private String txNote;
	private Date dtStato;
	
	public Integer getIdOrder() {
		return idOrder;
	}
	public void setIdOrder(Integer idOrder) {
		this.idOrder = idOrder;
	}
	public Integer getIdStato() {
		return idStato;
	}
	public void setIdStato(Integer idStato) {
		this.idStato = idStato;
	}
	public String getTxNote() {
		return txNote;
	}
	public void setTxNote(String txNote) {
		this.txNote = txNote;
	}
	public Date getDtStato() {
		return dtStato;
	}
	public void setDtStato(Date dtStato) {
		this.dtStato = dtStato;
	}
	
}
