package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ArticleCashedDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idProduct;
	private Integer pgArticle;
	private String txColor;
	private String txSize;
	private Integer qtaCashed;
	private String txType;
	private BigDecimal imCashed;
	private String txBrand;
	private Date dtSpedizione;
	private String txThumbnailsUrl;
	private BigDecimal imPrice;
	private String description;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BigDecimal getImPrice() {
		return imPrice;
	}
	public void setImPrice(BigDecimal imPrice) {
		this.imPrice = imPrice;
	}
	public String getTxThumbnailsUrl() {
		return txThumbnailsUrl;
	}
	public void setTxThumbnailsUrl(String txThumbnailsUrl) {
		this.txThumbnailsUrl = txThumbnailsUrl;
	}
	public Date getDtSpedizione() {
		return dtSpedizione;
	}
	public void setDtSpedizione(Date dtSpedizione) {
		this.dtSpedizione = dtSpedizione;
	}
	public String getTxBrand() {
		return txBrand;
	}
	public void setTxBrand(String txBrand) {
		this.txBrand = txBrand;
	}
	public Integer getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(Integer idProduct) {
		this.idProduct = idProduct;
	}
	public Integer getPgArticle() {
		return pgArticle;
	}
	public void setPgArticle(Integer pgArticle) {
		this.pgArticle = pgArticle;
	}
	public String getTxColor() {
		return txColor;
	}
	public void setTxColor(String txColor) {
		this.txColor = txColor;
	}
	public String getTxSize() {
		return txSize;
	}
	public void setTxSize(String txSize) {
		this.txSize = txSize;
	}
	public Integer getQtaCashed() {
		return qtaCashed;
	}
	public void setQtaCashed(Integer qtaCashed) {
		this.qtaCashed = qtaCashed;
	}
	public String getTxType() {
		return txType;
	}
	public void setTxType(String txType) {
		this.txType = txType;
	}
	public BigDecimal getImCashed() {
		return imCashed;
	}
	public void setImCashed(BigDecimal imCashed) {
		this.imCashed = imCashed;
	}
	
	
}
