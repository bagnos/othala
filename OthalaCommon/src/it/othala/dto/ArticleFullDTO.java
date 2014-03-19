package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

public class ArticleFullDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer pgArticle;
	private Integer qtStock;
	private Integer idSize;
	private Integer pgSize;
	private String txSize;
	private String txDescSize;
	private Integer idColor;
	private Integer pgColor;
	private String txColor;
	private String txDescColor;
	
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
	public Integer getPgSize() {
		return pgSize;
	}
	public void setPgSize(Integer pgSize) {
		this.pgSize = pgSize;
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
	public Integer getPgColor() {
		return pgColor;
	}
	public void setPgColor(Integer pgColor) {
		this.pgColor = pgColor;
	}
	public String getTxColor() {
		return txColor;
	}
	public void setTxColor(String txColor) {
		this.txColor = txColor;
	}
	public String getTxDescSize() {
		return txDescSize;
	}
	public void setTxDescSize(String txDescSize) {
		this.txDescSize = txDescSize;
	}
	public String getTxDescColor() {
		return txDescColor;
	}
	public void setTxDescColor(String txDescColor) {
		this.txDescColor = txDescColor;
	}
	
	
}
