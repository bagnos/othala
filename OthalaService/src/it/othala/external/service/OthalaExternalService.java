package it.othala.external.service;

import java.util.List;

import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
import it.othala.external.dto.FidelityCardDegortesDTO;
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
	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail, String celNum) throws FidelityCardNotPresentException, FidelityCardNotValidException 
	{
		List<FidelityCardDTO> fCard = orderDAO.getFidelityCard(idFidelity, null, null, null);
		if (fCard.get(0) == null)
			throw new FidelityCardNotPresentException(idFidelity);

		if (eMail != null && !eMail.isEmpty()) {
			if (fCard.get(0).getTxEmail() == null || fCard.get(0).getTxEmail().isEmpty())
				throw new FidelityCardNotValidException(idFidelity);
			if (!fCard.get(0).getTxEmail().equals(eMail))
				throw new FidelityCardNotValidException(idFidelity);
		}
		if (celNum != null && !celNum.isEmpty()) {
			if (fCard.get(0).getTxTel() == null || fCard.get(0).getTxTel().isEmpty())
				throw new FidelityCardNotValidException(idFidelity);
			if (!fCard.get(0).getTxTel().equals(celNum))
				throw new FidelityCardNotValidException(idFidelity);
		}

		return fCard.get(0);
	}


	@Override
	public int getQtStockLock(Integer idProduct, Integer pgArticle, String barcode) {
		
		return productDAO.getQtStockLock(idProduct, pgArticle);

	}	
	
	@Override
	public void updateStock(OrderFullDTO orderFull, boolean fgVendita) {
		// TODO Auto-generated method stub

	}

	@Override
	public ShopDTO getShopStock(Integer idProduct, Integer pgArticle, String codBarre) {
		
		return productDAO.getShop(idProduct, pgArticle);
		
	}

	@Override
	public void aggiornaQtArticle(Integer idProduct) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FidelityCardDegortesDTO> getMailingList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ShopDTO getShopReso() {
		List<ShopDTO> shop = productDAO.listShop();
		
		return shop.get(0);
	}



}
