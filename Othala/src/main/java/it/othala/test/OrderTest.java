package it.othala.test;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import it.othala.account.execption.MailNotSendException;
import it.othala.cartflow.converter.BigDecimalConverter;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;
import it.othala.service.factory.OthalaFactory;

import org.junit.Test;

public class OrderTest {
	@Test
	public void test1() {
		
		try {
			
			//ArticleFullDTO artFull = productDao.getArticleFull(article.getPrdFullDTO().getIdProduct(), 
			//		article.getPgArticle(), "it");
			
			List<OrderFullDTO> lsOf =  OthalaFactory.getOrderServiceInstance().getOrders(null, "1", null);
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	}
	//@Test
	public void Test2(){
		OrderFullDTO orderFull = new OrderFullDTO();
		DeliveryAddressDTO deliveryAddress =  new DeliveryAddressDTO();
		DeliveryAddressDTO billingAddress = new DeliveryAddressDTO();
		DeliveryCostDTO cost =  new DeliveryCostDTO();
		ArticleFullDTO art =  new ArticleFullDTO();
		ProductFullDTO prod =  new ProductFullDTO();
		List<ArticleFullDTO> cart =  new ArrayList<ArticleFullDTO>();
		deliveryAddress.setIdAddress(1);
		billingAddress.setIdAddress(1);
		cost.setIdDeliveryCost(1);
		art.setPgArticle(1);
		art.setQtBooked(1);
		prod.setIdProduct(1);
		art.setPrdFullDTO(prod);
		cart.add(art);
		
		orderFull.setBillingAddress(billingAddress);
		orderFull.setShippingAddress(deliveryAddress);
		orderFull.setCart(cart);
		orderFull.setSpeseSpedizione(cost);
		orderFull.setIdUser("1");
		
		BigDecimal bd = new BigDecimal(100);
		orderFull.setImOrdine(bd);
		
		try{
			OthalaFactory.getOrderServiceInstance().insertOrder(orderFull);
		}
		catch(OthalaException oex){
			
			oex.printStackTrace();
		}

		
	}
	//@Test
/*	public void Test3(){
		try{
		OthalaFactory.getOrderServiceInstance().confirmOrderPayment("ABC1234", 2, TypeStateOrder.COMPLETED);
		}
		catch(StockNotPresentException ex){
			ex.printStackTrace();
		}

		
	}*/
	//@Test
	public void Test4(){
		
		OthalaFactory.getOrderServiceInstance().confirmOrderDelivery("PPPPP1234",2);
		
		
	}
}