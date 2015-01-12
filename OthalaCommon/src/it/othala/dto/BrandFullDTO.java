package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

public class BrandFullDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer idBrand;
	private String txBrand;
	
	private Integer idProvincia;
	private String txProvincia;
	
	private Integer idRegione;
	private String txRegione;
	
	private String idUser;
	private String urlFoto;
	
	private String txDescrOnline;
	private String txDescrIT;
	private String txDescrEN;
	
	public Integer getIdBrand() {
		return idBrand;
	}
	public void setIdBrand(Integer idBrand) {
		this.idBrand = idBrand;
	}
	public String getTxBrand() {
		return txBrand;
	}
	public void setTxBrand(String txBrand) {
		this.txBrand = txBrand;
	}
	public Integer getIdProvincia() {
		return idProvincia;
	}
	public void setIdProvincia(Integer idProvincia) {
		this.idProvincia = idProvincia;
	}
	public String getTxProvincia() {
		return txProvincia;
	}
	public void setTxProvincia(String txProvincia) {
		this.txProvincia = txProvincia;
	}
	public Integer getIdRegione() {
		return idRegione;
	}
	public void setIdRegione(Integer idRegione) {
		this.idRegione = idRegione;
	}
	public String getTxRegione() {
		return txRegione;
	}
	public void setTxRegione(String txRegione) {
		this.txRegione = txRegione;
	}
	public String getIdUser() {
		return idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
	public String getUrlFoto() {
		return urlFoto;
	}
	public void setUrlFoto(String urlFoto) {
		this.urlFoto = urlFoto;
	}
	public String getTxDescrOnline() {
		return txDescrOnline;
	}
	public void setTxDescrOnline(String txDescrOnline) {
		this.txDescrOnline = txDescrOnline;
	}
	public String getTxDescrIT() {
		return txDescrIT;
	}
	public void setTxDescrIT(String txDescrIT) {
		this.txDescrIT = txDescrIT;
	}
	public String getTxDescrEN() {
		return txDescrEN;
	}
	public void setTxDescrEN(String txDescrEN) {
		this.txDescrEN = txDescrEN;
	}
	/**
	 * 
	 */

	
	
	
}
