package it.othala.dto;

import java.io.Serializable;

public class ShopDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idShop;
	private String txShop;
	private String txMail;
	public Integer getIdShop() {
		return idShop;
	}
	public void setIdShop(Integer idShop) {
		this.idShop = idShop;
	}
	public String getTxShop() {
		return txShop;
	}
	public void setTxShop(String txShop) {
		this.txShop = txShop;
	}
	public String getTxMail() {
		return txMail;
	}
	public void setTxMail(String txMail) {
		this.txMail = txMail;
	}



	
	
}
