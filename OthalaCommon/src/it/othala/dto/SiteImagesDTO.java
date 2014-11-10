package it.othala.dto;

import java.io.Serializable;

public class SiteImagesDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String txGroupImages;
	private Integer pgGroupImages;
	private String txLibrary;
	private String txName;
	private String urlRedirect;
	private String txGender;
	private Integer idGender;

	public Integer getPgGroupImages() {
		return pgGroupImages;
	}

	public void setPgGroupImages(Integer pgGroupImages) {
		this.pgGroupImages = pgGroupImages;
	}

	public String getTxLibrary() {
		return txLibrary;
	}

	public void setTxLibrary(String txLibrary) {
		this.txLibrary = txLibrary;
	}

	public String getTxName() {
		return txName;
	}

	public void setTxName(String txName) {
		this.txName = txName;
	}

	public String getTxGroupImages() {
		return txGroupImages;
	}

	public void setTxGroupImages(String txGroupImages) {
		this.txGroupImages = txGroupImages;
	}

	public String getUrlRedirect() {
		return urlRedirect;
	}

	public void setUrlRedirect(String urlRedirect) {
		this.urlRedirect = urlRedirect;
	}

	public String getTxGender() {
		return txGender;
	}

	public void setTxGender(String txGender) {
		this.txGender = txGender;
	}

	public Integer getIdGender() {
		return idGender;
	}

	public void setIdGender(Integer idGender) {
		this.idGender = idGender;
	}

}
