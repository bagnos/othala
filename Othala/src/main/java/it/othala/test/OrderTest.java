package it.othala.test;

import java.util.List;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.service.factory.OthalaFactory;

import org.junit.Test;

public class OrderTest {
	@Test
	public void test() {
		
		try {
			
			//ArticleFullDTO artFull = productDao.getArticleFull(article.getPrdFullDTO().getIdProduct(), 
			//		article.getPgArticle(), "it");
			
			List<OrderFullDTO> lsOf =  OthalaFactory.getOrderServiceInstance().getOrders(1, null, null);
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	}
}