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
	private List<AttributeDTO> type;

	
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

}
