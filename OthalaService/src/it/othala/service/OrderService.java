package it.othala.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import it.othala.account.execption.MailNotSendException;
import it.othala.dao.ProductDAO;
import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.execption.OthalaException;
import it.othala.service.interfaces.IMailService;
import it.othala.service.interfaces.IOrderService;
import it.othala.service.interfaces.IMailService;

public class OrderService implements IOrderService {
	
	private IOrderDAO orderDAO;
	private IProductDAO productDao;
	private IMailService mailService;

	@Override
	public List<OrderFullDTO> getOrders(Integer Order, String User,
			Integer StatoOrdine) {
		
		List<OrderFullDTO> listaOrdini = orderDAO.getOrders(Order, User, 
				StatoOrdine);
		
		Iterator<OrderFullDTO> i = listaOrdini.iterator();
		while(i.hasNext()){
			
			List<ArticleFullDTO> newlistArticle =  new ArrayList<ArticleFullDTO>();
			List<ArticleFullDTO> listArticle =  i.next().getCart();
			Iterator<ArticleFullDTO> y = listArticle.iterator();
			while(y.hasNext()){
				ArticleFullDTO artFull = productDao.getArticleFull(
						y.next().getPrdFullDTO().getIdProduct(), 
						y.next().getPgArticle(), "it");
				newlistArticle.add(artFull);
			}
			i.next().setCart(newlistArticle);
		}
		
		return listaOrdini;
	}

	@Override
	public OrderFullDTO insertOrder(OrderFullDTO orderFull) throws MailNotSendException, OthalaException {
		
		orderDAO.insertOrder(orderFull);
		
		Integer qtaProduct;
		HashMap<String, Object> mapProduct = new HashMap<String, Object>();
		List<ArticleFullDTO> lsProd = orderFull.getCart();
		Iterator<ArticleFullDTO> i = lsProd.iterator();
		while(i.hasNext()){
			
			qtaProduct = productDao.getQtStock(
					i.next().getPrdFullDTO().getIdProduct(), 
					i.next().getPgArticle());
			
			if (qtaProduct < i.next().getQtBooked()){
				String exc;
				if (qtaProduct == 0){
					exc =  "Prodotto " + 
							i.next().getPrdFullDTO().getDescription() +
							" non piu disponibile";
				}
				else{
					exc =  "Prodotto " + 
							i.next().getPrdFullDTO().getDescription() +
							" quantità residua " +
							qtaProduct.toString();
							
				}
				throw new OthalaException(exc);
	
			}
			
			mapProduct.clear();
			mapProduct.put("idOrder", orderFull.getIdOrder());
			mapProduct.put("idProdotto", i.next().getPrdFullDTO().getIdProduct());
			mapProduct.put("pgArticle", i.next().getPgArticle());
			mapProduct.put("qtArticle", i.next().getQtBooked());
			
			orderDAO.insertOrdersArticles(mapProduct);
		}

		orderDAO.insertStatesOrders(orderFull);
		
		String[] mailTo = new String[1];
		mailTo[0] = "massimiliano_cencioni@tin.it";
		String subject = "Inserito nuovo ordine";
		String content = "Un nuovo ordine è stato inserito con codice: " + 
				orderFull.getIdOrder().toString();
		mailService.inviaMail(mailTo, subject, content);
		
		return orderFull;
	}

	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(IOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	@Override
	public void updateStateOrder(StateOrderDTO stateOrder) {
		
		orderDAO.updateStatesOrders(stateOrder);
		
	}

	@Override
	public DeliveryDTO getDeliveryInfo(String userId) {
		List<DeliveryAddressDTO> addresses = orderDAO.getDeliveryAddress(userId);
		List<DeliveryCostDTO> costs = orderDAO.getDeliveryCost();
		
		DeliveryDTO delivery = new DeliveryDTO();
		
		delivery.setIndirizzo(addresses);
		delivery.setSpeseSpedizione(costs);
		
		return delivery;
	}

	@Override
	public DeliveryAddressDTO newAddress(DeliveryAddressDTO newAddress) {
		orderDAO.newAddress(newAddress);
		return newAddress;
		
	}
	
	@Override
	public DeliveryAddressDTO updateAddress(DeliveryAddressDTO newAddress,
			Integer idAddress) {
		orderDAO.deleteAddress(idAddress);
		orderDAO.newAddress(newAddress);
		return newAddress;
	}


	@Override
	public void updateOrder(String idTransaction, Integer idOrder, Integer idStato) {
		orderDAO.updateOrder(idTransaction, idOrder, idStato);
		
	}

	@Override
	public void deleteAddress(Integer idAddress) {
		orderDAO.deleteAddress(idAddress);
		
	}



}
