package it.othala.dto;

import java.io.Serializable;

public class DeliveryAddressDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userId;
	private Integer typeAddress;
	private String typeAddressDes;
	private String via;
	private String comune;
	private String cap;
	private String provincia;
	private String nazione;
	private String name;
	private String surname;
	private String tel;
	
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public Integer getTypeAddress() {
		return typeAddress;
	}
	public void setTypeAddress(Integer typeAddress) {
		this.typeAddress = typeAddress;
	}
	public String getTypeAddressDes() {
		return typeAddressDes;
	}
	public void setTypeAddressDes(String typeAddressDes) {
		this.typeAddressDes = typeAddressDes;
	}
	public String getVia() {
		return via;
	}
	public void setVia(String via) {
		this.via = via;
	}
	public String getComune() {
		return comune;
	}
	public void setComune(String comune) {
		this.comune = comune;
	}
	public String getCap() {
		return cap;
	}
	public void setCap(String cap) {
		this.cap = cap;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getNazione() {
		return nazione;
	}
	public void setNazione(String nazione) {
		this.nazione = nazione;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}


}
