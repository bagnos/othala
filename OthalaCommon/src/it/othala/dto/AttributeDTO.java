package it.othala.dto;

import java.io.Serializable;

public class AttributeDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer attributo;
	private String valore;
	public Integer getAttributo() {
		return attributo;
	}
	public void setAttributo(Integer attributo) {
		this.attributo = attributo;
	}
	public String getValore() {
		return valore;
	}
	public void setValore(String valore) {
		this.valore = valore;
	}


	
	
}
