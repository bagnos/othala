package it.othala.dto;

import java.io.Serializable;
import java.util.List;

public class LookBookDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int idLookBook;
	private String txThumbnailUrl;
	private int idGender;
	private int idStato;
	private List<LookBookProductDTO> products;
	
	public int getIdLookBook() {
		return idLookBook;
	}
	public void setIdLookBook(int idLookBook) {
		this.idLookBook = idLookBook;
	}
	public String getTxThumbnailUrl() {
		return txThumbnailUrl;
	}
	public void setTxThumbnailUrl(String txThumbnailUrl) {
		this.txThumbnailUrl = txThumbnailUrl;
	}
	public int getIdGender() {
		return idGender;
	}
	public void setIdGender(int idGender) {
		this.idGender = idGender;
	}
	public int getIdStato() {
		return idStato;
	}
	public void setIdStato(int idStato) {
		this.idStato = idStato;
	}
	public List<LookBookProductDTO> getProducts() {
		return products;
	}
	public void setProducts(List<LookBookProductDTO> products) {
		this.products = products;
	}

}

