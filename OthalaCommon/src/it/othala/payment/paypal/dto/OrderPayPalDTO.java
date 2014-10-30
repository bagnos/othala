package it.othala.payment.paypal.dto;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.DeliveryCostDTO;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class OrderPayPalDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<ArticleFullDTO> aricles;
	private BigDecimal totalPriceOrder;
	private BigDecimal totalItemOrder;
	private DeliveryCostDTO deliveryCost;	
	private String locale;
	private String idOrder;
	private String returnUrl;
	private String cancelUrl;
	private String imageUrl;
	private String redirectUrl;
	private BigDecimal totalDiscountOrder;
	private String txDiscounted;
	
	
	
	public String getTxDiscounted() {
		return txDiscounted;
	}
	public void setTxDiscounted(String txDiscounted) {
		this.txDiscounted = txDiscounted;
	}
	public BigDecimal getTotalDiscountOrder() {
		return totalDiscountOrder;
	}
	public void setTotalDiscountOrder(BigDecimal totalDiscountOrder) {
		this.totalDiscountOrder = totalDiscountOrder;
	}
	public String getReturnUrl() {
		return returnUrl;
	}
	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}
	public String getCancelUrl() {
		return cancelUrl;
	}
	public void setCancelUrl(String cancelUrl) {
		this.cancelUrl = cancelUrl;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	public List<ArticleFullDTO> getAricles() {
		return aricles;
	}
	public void setAricles(List<ArticleFullDTO> aricles) {
		this.aricles = aricles;
	}
	public BigDecimal getTotalPriceOrder() {
		return totalPriceOrder;
	}
	public void setTotalPriceOrder(BigDecimal totalPriceOrder) {
		this.totalPriceOrder = totalPriceOrder;
	}
	public BigDecimal getTotalItemOrder() {
		return totalItemOrder;
	}
	public void setTotalItemOrder(BigDecimal totalItemOrder) {
		this.totalItemOrder = totalItemOrder;
	}
	public DeliveryCostDTO getDeliveryCost() {
		return deliveryCost;
	}
	public void setDeliveryCost(DeliveryCostDTO deliveryCost) {
		this.deliveryCost = deliveryCost;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public String getIdOrder() {
		return idOrder;
	}
	public void setIdOrder(String idOrder) {
		this.idOrder = idOrder;
	}
	
	
}
