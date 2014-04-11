package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class DeliveryCostDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public BigDecimal getImportoSpese() {
		return importoSpese;
	}
	public void setImportoSpese(BigDecimal importoSpese) {
		this.importoSpese = importoSpese;
	}
	private String descrizione;
	private BigDecimal importoSpese;
	

}
