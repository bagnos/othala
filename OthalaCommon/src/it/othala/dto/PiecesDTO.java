package it.othala.dto;

import java.io.Serializable;

public class PiecesDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private String size;
	private String color;
	private Integer stock;
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
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}

	

}
