package it.othala.dto;

import java.io.Serializable;

public class OrderProductDTO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Integer getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(Integer idProdotto) {
		this.idProdotto = idProdotto;
	}
	public Integer getPgArticle() {
		return pgArticle;
	}
	public void setPgArticle(Integer pgArticle) {
		this.pgArticle = pgArticle;
	}
	private Integer idProdotto;
	private Integer pgArticle;
	
}
