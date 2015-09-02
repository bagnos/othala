package it.othala.dto;

import java.io.Serializable;

public class ProvinciaDTO implements Serializable {

	public Integer getIdProvincia() {
		return idProvincia;
	}
	public void setIdProvincia(Integer idProvincia) {
		this.idProvincia = idProvincia;
	}
	public String getTxProvincia() {
		return txProvincia;
	}
	public void setTxProvincia(String txProvincia) {
		this.txProvincia = txProvincia;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idProvincia;
	private String txProvincia;


	
	
}
