package it.othala.external.service.interfaces;

import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;

import java.util.List;

public interface IOthalaExternalServices {

	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail, String celNum) throws FidelityCardNotPresentException, FidelityCardNotValidException;;	
	public int getQtStockLock(Integer idProduct, Integer pgArticle, String barcode);
	public void updateStock(OrderFullDTO orderFull, boolean fgVendita);
	
}
