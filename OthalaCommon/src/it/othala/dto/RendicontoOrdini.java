package it.othala.dto;

import java.io.Serializable;

public class RendicontoOrdini implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int impTotOrders;
	private int numTotOrders;
	private int impTotRefounds;
	private int numTotRefounds;
	
	public int getImpTotOrders() {
		return impTotOrders;
	}
	public void setImpTotOrders(int impTotOrders) {
		this.impTotOrders = impTotOrders;
	}
	public int getNumTotOrders() {
		return numTotOrders;
	}
	public void setNumTotOrders(int numTotOrders) {
		this.numTotOrders = numTotOrders;
	}
	public int getImpTotRefounds() {
		return impTotRefounds;
	}
	public void setImpTotRefounds(int impTotRefounds) {
		this.impTotRefounds = impTotRefounds;
	}
	public int getNumTotRefounds() {
		return numTotRefounds;
	}
	public void setNumTotRefounds(int numTotRefounds) {
		this.numTotRefounds = numTotRefounds;
	}


}
