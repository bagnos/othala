package it.othala.dto;

import java.io.Serializable;

public class SubMenuDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int idType;
	private String txType;
	private String txTypeIT;
	private String txTypeEN;
	

	public String getTxTypeIT() {
		return txTypeIT;
	}

	public void setTxTypeIT(String txTypeIT) {
		this.txTypeIT = txTypeIT;
	}

	public String getTxTypeEN() {
		return txTypeEN;
	}

	public void setTxTypeEN(String txTypeEN) {
		this.txTypeEN = txTypeEN;
	}

	public int getIdType() {
		return idType;
	}

	public void setIdType(int idType) {
		this.idType = idType;
	}

	public String getTxType() {
		return txType;
	}

	public void setTxType(String txType) {
		this.txType = txType;
	}

}
