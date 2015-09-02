package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class NazioniDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private String descrizione;
	private String language;
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
	
	

}
