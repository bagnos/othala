package it.othala.external.service.interfaces;

import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ShopDTO;

import java.util.List;

public interface IOthalaExternalServices {

	public List<FidelityCardDTO> checkFidelityCard(String idFidelity, String eMail, String celNum);	
	public int getQtStockLock(String barcode);
	public void updateStock(OrderFullDTO orderFull, boolean fgVendita);
	
}
