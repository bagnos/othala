package it.othala.external.service;

import java.util.List;

import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
import it.othala.external.dao.interfaces.IExternalDAO;
import it.othala.external.service.interfaces.IOthalaExternalServices;

 class DegortesService implements IOthalaExternalServices {
	 
	 private IExternalDAO externalDAO;
	 
	public void setExternalDAO(IExternalDAO externalDAO) {
		this.externalDAO = externalDAO;
	}

	@Override
	public void updateStock(OrderFullDTO orderFull, boolean fgVendita) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getQtStockLock(Integer idProduct, Integer pgArticle, String barcode) {
		
		return externalDAO.getQtStock(barcode);
	}

	@Override
	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail,
			String celNum) throws FidelityCardNotPresentException,
			FidelityCardNotValidException {
		
		char[] sequenza = idFidelity.toCharArray();
		for (int i=0; i< sequenza.length; i++) {
			try {
				Integer.parseInt(Character.toString(sequenza[i]));
			} catch (Exception e) {
				throw new FidelityCardNotValidException(idFidelity);
			}
		}
		
		FidelityCardDTO fCard = externalDAO.getFidelityCard(idFidelity);
		if (fCard == null)
			throw new FidelityCardNotPresentException(idFidelity);

		return fCard;
	}

}
