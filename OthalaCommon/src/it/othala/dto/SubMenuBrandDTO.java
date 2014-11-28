package it.othala.dto;

import java.io.Serializable;

public class SubMenuBrandDTO implements Serializable {

	public int getIdBrand() {
		return idBrand;
	}
	public void setIdBrand(int idBrand) {
		this.idBrand = idBrand;
	}
	public String getTxBrand() {
		return txBrand;
	}
	public void setTxBrand(String txBrand) {
		this.txBrand = txBrand;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int idBrand;
	private String txBrand;



}
