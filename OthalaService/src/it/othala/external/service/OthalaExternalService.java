package it.othala.external.service;

import java.util.List;

import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.external.service.interfaces.IOthalaExternalServices;

class OthalaExternalService implements IOthalaExternalServices {

	private IOrderDAO orderDAO;
	private IProductDAO productDAO;
	
	public void setOrderDAO(IOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	public void setProductDAO(IProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public List<FidelityCardDTO> checkFidelityCard(String idFidelity, String eMail, String celNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getQtStockLock(String barcode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateStock(OrderFullDTO orderFull, boolean fgVendita) {
		// TODO Auto-generated method stub

	}

}
