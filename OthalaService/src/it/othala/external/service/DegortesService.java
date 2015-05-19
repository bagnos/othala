package it.othala.external.service;

import java.util.List;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
import it.othala.external.dao.interfaces.IExternalDAO;
import it.othala.external.dto.FidelityCardDegortesDTO;
import it.othala.external.dto.ShopDegortesDTO;
import it.othala.external.service.interfaces.IOthalaExternalServices;

 class DegortesService implements IOthalaExternalServices {
	 
	 private IExternalDAO externalDAO;
	 private IProductDAO productDAO;
	 
	public void setExternalDAO(IExternalDAO externalDAO) {
		this.externalDAO = externalDAO;
	}
	
	public void setProductDAO(IProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public void updateStock(OrderFullDTO orderFull, boolean fgVendita) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getQtStockLock(Integer idProduct, Integer pgArticle, String barcode) {
		
		int qtStock = externalDAO.getQtStock(barcode);
		
		productDAO.setNewQtStock(idProduct, pgArticle, qtStock);
		
		return qtStock;
	}

	@Override
	public FidelityCardDTO checkFidelityCard(String idFidelity, String eMail,
			String celNum, String nome, String cognome) throws FidelityCardNotPresentException,
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
		else{
			if (!fCard.getTxNome().trim().toUpperCase().equals(nome.trim().toUpperCase()) || !fCard.getTxCognome().trim().toUpperCase().equals(cognome.trim().toUpperCase()))
				throw new FidelityCardNotValidException(idFidelity);
		}

		return fCard;
	}

	@Override
	public ShopDTO getShopStock(Integer idProduct, Integer pgArticle,
			String codBarre) {
		List<ShopDegortesDTO> shopDeg = externalDAO.getShopStock(codBarre);
		
		ShopDTO shop = new ShopDTO();
		Integer appo = 0;
		
		for (ShopDegortesDTO lsShop: shopDeg){
			if (lsShop.getQtaGiacUmMag() > appo){
				appo = lsShop.getQtaGiacUmMag();
				shop.setIdShop(lsShop.getCodMag());
				shop.setTxShop(lsShop.getDesNegozio());
			}
			
			if (lsShop.getCodMag()==500){
				shop.setIdShop(lsShop.getCodMag());
				shop.setTxShop(lsShop.getDesNegozio());			
				break;
			}
		
		}
		
		return shop;
		
	}

	@Override
	public void aggiornaQtArticle(Integer idProduct) {
		List<ArticleFullDTO> arts = productDAO.listArticleFull(idProduct, "it", false);
		
		for(ArticleFullDTO art: arts){
			
			getQtStockLock(idProduct,art.getPgArticle(),art.getTxBarCode());
			
		}
		
	}

	@Override
	public List<FidelityCardDegortesDTO> getMailingList() {
		return externalDAO.getMailingList();
	}

	@Override
	public ShopDTO getShopReso() {
		List<ShopDTO> lsShop = productDAO.listShop();
		
		ShopDTO shop = new ShopDTO();
		for (ShopDTO s: lsShop){
			if (s.getIdShop()==500) shop = s;
			
		}
		
		return shop;
	}

}
