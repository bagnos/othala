package it.othala.dto;

import java.io.Serializable;

public class ArticleFullDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer pgArticle;
	private Integer qtStock;
	private Integer idSize;
	private String txSize;
	private Integer idColor;
	private String txColor;
	private String thumbnailsUrl;
	
	public Integer getPgArticle() {
		return pgArticle;
	}
	public void setPgArticle(Integer pgArticle) {
		this.pgArticle = pgArticle;
	}
	public Integer getQtStock() {
		return qtStock;
	}
	public void setQtStock(Integer qtStock) {
		this.qtStock = qtStock;
	}
	public Integer getIdSize() {
		return idSize;
	}
	public void setIdSize(Integer idSize) {
		this.idSize = idSize;
	}
	
	public String getTxSize() {
		return txSize;
	}
	public void setTxSize(String txSize) {
		this.txSize = txSize;
	}
	public Integer getIdColor() {
		return idColor;
	}
	public void setIdColor(Integer idColor) {
		this.idColor = idColor;
	}
	
	public String getTxColor() {
		return txColor;
	}
	public void setTxColor(String txColor) {
		this.txColor = txColor;
	}
	public String getThumbnailsUrl() {
		return thumbnailsUrl;
	}
	public void setThumbnailsUrl(String thumbnailsUrl) {
		this.thumbnailsUrl = thumbnailsUrl;
	}
	
	
	
}
