package it.othala.external.service;

import java.util.List;

import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
import it.othala.external.service.interfaces.IOthalaExternalServices;

 class DegortesService implements IOthalaExternalServices {



	@Override
	public int getQtStockLock(String barcode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateStock(OrderFullDTO orderFull, boolean fgVendita) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getQtStockLock(Integer idProduct, Integer pgArticle) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail,
			String celNum) throws FidelityCardNotPresentException,
			FidelityCardNotValidException {
		// TODO Auto-generated method stub
		return null;
	}

}
