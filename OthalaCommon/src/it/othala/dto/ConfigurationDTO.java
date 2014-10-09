package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class ConfigurationDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private String idConfiguration;
	private String txConfiguration;
	private Integer nrConfiguration;
	public String getIdConfiguration() {
		return idConfiguration;
	}
	public void setIdConfiguration(String idConfiguration) {
		this.idConfiguration = idConfiguration;
	}
	public String getTxConfiguration() {
		return txConfiguration;
	}
	public void setTxConfiguration(String txConfiguration) {
		this.txConfiguration = txConfiguration;
	}
	public Integer getNrConfiguration() {
		return nrConfiguration;
	}
	public void setNrConfiguration(Integer nrConfiguration) {
		this.nrConfiguration = nrConfiguration;
	}

	
	
	

}
