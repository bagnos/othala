package it.othala.external.service.interfaces;

import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
import it.othala.external.dto.FidelityCardDegortesDTO;

import java.util.List;

public interface IOthalaExternalServices {

	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail, String celNum, String nome, String cognome) throws FidelityCardNotPresentException, FidelityCardNotValidException;;	
	public int getQtStockLock(Integer idProduct, Integer pgArticle, String barcode);
	public void updateStock(OrderFullDTO orderFull, boolean fgVendita);
	public ShopDTO getShopStock(Integer idProduct, Integer pgArticle, String codBarre);
	public void aggiornaQtArticle(Integer idProduct);
	public List<FidelityCardDegortesDTO> getMailingList();
	public ShopDTO getShopReso();
}
