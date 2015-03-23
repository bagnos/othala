package it.othala.external.dao.interfaces;

import java.util.List;

import it.othala.dto.FidelityCardDTO;
import it.othala.external.dto.FidelityCardDegortesDTO;
import it.othala.external.dto.ShopDegortesDTO;

public interface IExternalDAO {
	
	public Integer getQtStock(String barcode);
	public FidelityCardDTO getFidelityCard(String idFidelity);
	public List<ShopDegortesDTO> getShopStock(String barCode);
	public List<FidelityCardDegortesDTO> getMailingList();

}
