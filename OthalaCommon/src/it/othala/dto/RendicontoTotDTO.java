package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class RendicontoTotDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private BigDecimal impTotOrders;
	private int numTotOrders;
	private int numTotArticles;
	private BigDecimal impTotRefound;
	private int numTotRefound;
	private int numTotArticlesRefounded;
	private BigDecimal impTotDaAvere;
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
	public int getNumTotArticlesRefounded() {
		return numTotArticlesRefounded;
	}
	public void setNumTotArticlesRefounded(int numTotArticlesRefounded) {
		this.numTotArticlesRefounded = numTotArticlesRefounded;
	}
	public BigDecimal getImpTotDaAvere() {
		return impTotDaAvere;
	}
	public void setImpTotDaAvere(BigDecimal impTotDaAvere) {
		this.impTotDaAvere = impTotDaAvere;
	}
	
}
