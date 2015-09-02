package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class ScontoDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String coupon;
	private String fidelity;
	private int pcScontoCoupon;
	private int pcScontoFidelity;
	private BigDecimal amtFidelity;
	private BigDecimal amtCoupon;
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public String getFidelity() {
		return fidelity;
	}
	public void setFidelity(String fidelity) {
		this.fidelity = fidelity;
	}
	public int getPcScontoCoupon() {
		return pcScontoCoupon;
	}
	public void setPcScontoCoupon(int pcScontoCoupon) {
		this.pcScontoCoupon = pcScontoCoupon;
	}
	public int getPcScontoFidelity() {
		return pcScontoFidelity;
	}
	public void setPcScontoFidelity(int pcScontoFidelity) {
		this.pcScontoFidelity = pcScontoFidelity;
	}
	public BigDecimal getAmtFidelity() {
		return amtFidelity;
	}
	public void setAmtFidelity(BigDecimal amtFidelity) {
		this.amtFidelity = amtFidelity;
	}
	public BigDecimal getAmtCoupon() {
		return amtCoupon;
	}
	public void setAmtCoupon(BigDecimal amtCoupon) {
		this.amtCoupon = amtCoupon;
	}
	
	
}
