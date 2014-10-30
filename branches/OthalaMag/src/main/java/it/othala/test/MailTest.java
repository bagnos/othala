package it.othala.test;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.service.factory.OthalaFactory;

import java.util.List;

import org.junit.Test;

public class MailTest {
	@Test
	public void test() {
		
		try {
			List<OrderFullDTO> orders=OthalaFactory.getOrderServiceInstance().getOrders(1, null, null);
			OrderFullDTO order=orders.get(0);
	
			/*
			ProductFullNewDTO prd=new ProductFullNewDTO();
			prd.setDescription("Prodotto del cazzo");
			prd.setTxBrand("Brand del cazzo");
			prd.setIdProduct(2);
			prd.setPrice(new BigDecimal("30"));
			order.setIdUser("simone.bagnolesi@gmail.com");
			for (ArticleFullDTO art:order.getCart())
			{
				art.setPrdFullDTO(prd);
				art.setQtBooked(1);
			}*/
			

			
			MailPropertiesDTO mail=new MailPropertiesDTO();
			mail.setBasePathThumbinalsArticle("C:/progs/Tomcat/apache-tomcat-7.0.53/webapps/Othala/resources/images/cartThumbinals/");
			mail.setPathImgLogo("C:/progs/Tomcat/apache-tomcat-7.0.53/webapps/Othala/resources/images/logo2-small.png");
			mail.setPathImgPayment("C:/progs/Tomcat/apache-tomcat-7.0.53/webapps/Othala/resources/images/payment/paypal.gif");
			mail.setFromMail("Degortes Outlet<noreply@degortes.it>");
			mail.setBoardUrl("http://www.degortes.it/");
			mail.setCompanyName("Degortes Outlet");
			mail.setContextRoot("Othalse");
			mail.setDnsSite("localhost");
			OthalaFactory.getPaymentServiceInstance().sendMailAcceptedPyament(order, mail, "COMPLETED");
		} catch (MailNotSendException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	}
}
