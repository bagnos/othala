package it.othala.dto;

import java.io.Serializable;
import java.util.Date;

public class CouponDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String getIdCoupon() {
		return idCoupon;
	}
	public void setIdCoupon(String idCoupon) {
		this.idCoupon = idCoupon;
	}
	public String getIdUser() {
		return idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
	public Short getPcSconto() {
		return pcSconto;
	}
	public void setPcSconto(Short pcSconto) {
		this.pcSconto = pcSconto;
	}
	public Date getDtScadenza() {
		return dtScadenza;
	}
	public void setDtScadenza(Date dtScadenza) {
		this.dtScadenza = dtScadenza;
	}
	public Date getDtUtilizzo() {
		return dtUtilizzo;
	}
	public void setDtUtilizzo(Date dtUtilizzo) {
		this.dtUtilizzo = dtUtilizzo;
	}
	private String idCoupon;
	private String idUser;
	private Short pcSconto;
	private Date dtScadenza;
	private Date dtUtilizzo;
	
}
