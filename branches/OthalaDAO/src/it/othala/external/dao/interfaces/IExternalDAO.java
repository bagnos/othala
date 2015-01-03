package it.othala.external.dao.interfaces;

import it.othala.dto.FidelityCardDTO;

public interface IExternalDAO {
	
	public Integer getQtStock(String barcode);
	public FidelityCardDTO getFidelityCard(String idFidelity);

}
