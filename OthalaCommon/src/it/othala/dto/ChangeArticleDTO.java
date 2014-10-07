package it.othala.dto;

import java.io.Serializable;

public class ChangeArticleDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cdBarcode;
	private String noteMerchant;
	private String shop;
	private String size;
	private String color;
	
	public String getCdBarcode() {
		return cdBarcode;
	}
	public void setCdBarcode(String cdBarcode) {
		this.cdBarcode = cdBarcode;
	}
	public String getNoteMerchant() {
		noteMerchant=String.format("Barcode %s, Taglia %s, Colore %s presso Negozio %s",getCdBarcode(), getSize(), getColor(), getShop());
		return noteMerchant;
	}
	public String getShop() {
		return shop;
	}
	public void setShop(String shop) {
		this.shop = shop;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	
	
}
