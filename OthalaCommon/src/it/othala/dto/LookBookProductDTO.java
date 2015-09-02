package it.othala.dto;

import java.io.Serializable;

public class LookBookProductDTO {
	
	private static final long serialVersionUID = 1L;
	private int idProduct;
	private String txBrand;
	private String txThumbnailsUrl;
	public int getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}
	public String getTxBrand() {
		return txBrand;
	}
	public void setTxBrand(String txBrand) {
		this.txBrand = txBrand;
	}
	public String getTxThumbnailsUrl() {
		return txThumbnailsUrl;
	}
	public void setTxThumbnailsUrl(String txThumbnailsUrl) {
		this.txThumbnailsUrl = txThumbnailsUrl;
	}
	

}
