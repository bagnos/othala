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
	public Integer getIdDeliveryCost() {
		return idDeliveryCost;
	}
	public void setIdDeliveryCost(Integer idDeliveryCost) {
		this.idDeliveryCost = idDeliveryCost;
	}
	private Integer idDeliveryCost;
	private String descrizione;
	private BigDecimal importoSpese;
	

}
