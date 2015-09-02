package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class RendicontoOrdini implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private BigDecimal impTotOrders;
	private int numTotOrders;
	private int numTotArticles;
	
	public BigDecimal getImpTotOrders() {
		return impTotOrders;
	}
	public void setImpTotOrders(BigDecimal impTotOrders) {
		this.impTotOrders = impTotOrders;
	}
	public int getNumTotOrders() {
		return numTotOrders;
	}
	public void setNumTotOrders(int numTotOrders) {
		this.numTotOrders = numTotOrders;
	}
	public int getNumTotArticles() {
		return numTotArticles;
	}
	public void setNumTotArticles(int numTotArticles) {
		this.numTotArticles = numTotArticles;
	}

}
