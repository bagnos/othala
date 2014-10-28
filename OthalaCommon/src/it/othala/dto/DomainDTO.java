package it.othala.dto;

import java.io.Serializable;
import java.util.List;

public class DomainDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<AttributeDTO> size;
	private List<AttributeDTO> color;
	private List<AttributeDTO> brand;
	private List<AttributeDTO> gender;
	private List<AttributeDTO> material;
	private List<AttributeDTO> type;
	private List<ShopDTO> shop;
	private List<AttributeDTO> statesOrder;
	private List<AttributeDTO> statesProduct;
	private List<NazioniDTO> nazioni;
	private List<ConfigurationDTO> configuration;
	

	
	public List<AttributeDTO> getStatesProduct() {
		return statesProduct;
	}

	public void setStatesProduct(List<AttributeDTO> statesProduct) {
		this.statesProduct = statesProduct;
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

	public List<AttributeDTO> getGender() {
		return gender;
	}

	public void setGender(List<AttributeDTO> gender) {
		this.gender = gender;
	}

	public List<AttributeDTO> getType() {
		return type;
	}

	public void setType(List<AttributeDTO> type) {
		this.type = type;
	}

	public List<ShopDTO> getShop() {
		return shop;
	}

	public void setShop(List<ShopDTO> shop) {
		this.shop = shop;
	}

	public List<AttributeDTO> getStatesOrder() {
		return statesOrder;
	}

	public void setStatesOrder(List<AttributeDTO> statesOrder) {
		this.statesOrder = statesOrder;
	}

	public List<AttributeDTO> getMaterial() {
		return material;
	}

	public void setMaterial(List<AttributeDTO> material) {
		this.material = material;
	}

	public List<NazioniDTO> getNazioni() {
		return nazioni;
	}

	public void setNazioni(List<NazioniDTO> nazioni) {
		this.nazioni = nazioni;
	}

	public List<ConfigurationDTO> getConfiguration() {
		return configuration;
	}

	public void setConfiguration(List<ConfigurationDTO> configuration) {
		this.configuration = configuration;
	}

}
