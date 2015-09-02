package it.othala.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List <DeliveryAddressDTO> indirizzo; 
	public List<DeliveryAddressDTO> getIndirizzo() {
		if (indirizzo==null)
		{
			indirizzo=new ArrayList<>();
		}
		return indirizzo;
	}
	public void setIndirizzo(List<DeliveryAddressDTO> indirizzo) {
		this.indirizzo = indirizzo;
	}
	
	public List<DeliveryCostDTO> getSpeseSpedizione() {
		return speseSpedizione;
	}
	public void setSpeseSpedizione(List<DeliveryCostDTO> speseSpedizione) {
		this.speseSpedizione = speseSpedizione;
	}
	private List <DeliveryCostDTO> speseSpedizione;
	
	
}
