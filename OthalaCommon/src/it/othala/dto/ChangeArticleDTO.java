package it.othala.dto;

import java.io.Serializable;

public class ChangeArticleDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer pgArticleNew;
	private String noteMerchant;
	private String shop;
	private String size;
	private String color;
	
	public Integer getPgArticleNew() {
		return pgArticleNew;
	}
	public void setCdBarcode(Integer pgArticleNew) {
		this.pgArticleNew = pgArticleNew;
	}
	public String getNoteMerchant() {
		noteMerchant=String.format("pgArticleNew %s, Taglia %s, Colore %s presso Negozio %s",getPgArticleNew().toString(), getSize(), getColor(), getShop());
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
