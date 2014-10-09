package it.othala.dto;

import java.io.Serializable;

public class ArticleDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idProduct;
	private Integer pgArticle;
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
	


}
