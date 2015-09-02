package it.othala.dto;

import java.io.Serializable;
 
public class HashtagDTO implements Serializable {

	public HashtagDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HashtagDTO(String hashtag, Integer idGender, Integer idType,
			Integer idBrand, Integer idMaterial, Integer numero) {
		super();
		this.hashtag = hashtag;
		this.idGender = idGender;
		this.idType = idType;
		this.idBrand = idBrand;
		this.idMaterial = idMaterial;
		this.numero = numero;
	}
	
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public Integer getIdGender() {
		return idGender;
	}
	public void setIdGender(Integer idGender) {
		this.idGender = idGender;
	}
	public Integer getIdType() {
		return idType;
	}
	public void setIdType(Integer idType) {
		this.idType = idType;
	}
	public Integer getIdBrand() {
		return idBrand;
	}
	public void setIdBrand(Integer idBrand) {
		this.idBrand = idBrand;
	}
	public Integer getIdMaterial() {
		return idMaterial;
	}
	public void setIdMaterial(Integer idMaterial) {
		this.idMaterial = idMaterial;
	}
	public Integer getNumero() {
		return numero;
	}
	public void setNumero(Integer numero) {
		this.numero = numero;
	}
	private static final long serialVersionUID = 1L;
	private String hashtag;
	private Integer idGender;
	private Integer idType;
	private Integer idBrand;
	private Integer idMaterial;
	private Integer numero;
	


}
