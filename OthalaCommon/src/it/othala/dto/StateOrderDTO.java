package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

public class StateOrderDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer idOrder;
	private Integer idStato;
	private String txStato;
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
	
}
