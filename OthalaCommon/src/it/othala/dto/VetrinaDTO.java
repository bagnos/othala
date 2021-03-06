package it.othala.dto;

import java.io.Serializable;
import java.util.List;

public class VetrinaDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<ProductFullNewDTO> prodotti;
	private List<AttributeDTO> size;
	private List<AttributeDTO> color;
	private List<AttributeDTO> brand;
	public List<ProductFullNewDTO> getProdotti() {
		return prodotti;
	}
	public void setProdotti(List<ProductFullNewDTO> prodotti) {
		this.prodotti = prodotti;
	}
	public List<AttributeDTO> getSize() {
		return size;
	}
	public void setSize(List<AttributeDTO> size) {
		this.size = size;
	}
	public List<AttributeDTO> getColor() {
		return color;
	}
	public void setColor(List<AttributeDTO> color) {
		this.color = color;
	}
	public List<AttributeDTO> getBrand() {
		return brand;
	}
	public void setBrand(List<AttributeDTO> brand) {
		this.brand = brand;
	}
	
	
}
