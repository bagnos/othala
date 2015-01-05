package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class RendicontoRefound implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private BigDecimal impTotRefound;
	private int numTotRefound;
	private int numTotArticles;
	
	public BigDecimal getImpTotRefound() {
		return impTotRefound;
	}
	public void setImpTotRefound(BigDecimal impTotRefound) {
		this.impTotRefound = impTotRefound;
	}
	public int getNumTotRefound() {
		return numTotRefound;
	}
	public void setNumTotRefound(int numTotRefound) {
		this.numTotRefound = numTotRefound;
	}
	public int getNumTotArticles() {
		return numTotArticles;
	}
	public void setNumTotArticles(int numTotArticles) {
		this.numTotArticles = numTotArticles;
	}

	

}

