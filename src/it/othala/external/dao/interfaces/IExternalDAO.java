package it.othala.external.dao.interfaces;

import it.othala.dto.FidelityCardDTO;
import it.othala.external.dto.ShopDegortesDTO;

public interface IExternalDAO {
	
	public Integer getQtStock(String barcode);
	public FidelityCardDTO getFidelityCard(String idFidelity);
	public ShopDegortesDTO getShopStock(String barCode);

}
