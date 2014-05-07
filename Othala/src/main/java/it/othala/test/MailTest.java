package it.othala.test;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.MailConfermaDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.service.factory.OthalaFactory;

import java.math.BigDecimal;
import java.util.List;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.junit.Test;

public class MailTest {
	@Test
	public void test() {
		
		try {
			List<OrderFullDTO> orders=OthalaFactory.getOrderServiceInstance().getOrders(1, "1", 2);
			OrderFullDTO order=orders.get(0);
	
			
			ProductFullDTO prd=new ProductFullDTO();
			prd.setDescription("Prodotto del cazzo");
			prd.setTxBrand("Brand del cazzo");
			prd.setIdProduct(2);
			prd.setPrice(new BigDecimal("30"));
			order.setIdUser("simone.bagnolesi@gmail.com");
			for (ArticleFullDTO art:order.getCart())
			{
				art.setPrdFullDTO(prd);
				art.setQtBooked(1);
			}
			

			
			MailConfermaDTO mail=new MailConfermaDTO();
			mail.setBasePathThumbinalsArticle("C:/progs/Tomcat/apache-tomcat-7.0.53/webapps/Othala/resources/images/cartThumbinals/");
			mail.setPathImgLogo("C:/progs/Tomcat/apache-tomcat-7.0.53/webapps/Othala/resources/images/logo2-small.png");
			mail.setPathImgPayment("C:/progs/Tomcat/apache-tomcat-7.0.53/webapps/Othala/resources/images/payment/paypal.gif");
			OthalaFactory.getOrderServiceInstance().inviaMailDiConferma(order,mail);
		} catch (MailNotSendException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	}
}
