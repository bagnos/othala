package it.othala.test;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.DescriptionDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.service.factory.OthalaFactory;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class FreddyTest {
	@Test
	public void test() {

		try {

			ProductFullDTO a = new ProductFullDTO();

			a.setPrice(new BigDecimal(795));
			a.setDiscount(30);
			a.setThumbnailsUrl("A1.JPG");

			DescriptionDTO b = new DescriptionDTO();
			List<DescriptionDTO> c = new ArrayList<DescriptionDTO>();
			b.setLanguages("it");

			b.setDescription("T-SHIRT IN MISTO VISCOSA E SETA");

			c.add(b);

			a.setLangDescription(c);

			a.setIdGender(1);
			a.setIdBrand(5);
			a.setIdType(21);

			ArticleFullDTO d = new ArticleFullDTO();
			List<ArticleFullDTO> e = new ArrayList<ArticleFullDTO>();

			d.setPgArticle(1);
			d.setQtStock(2);
			d.setIdSize(17);

			d.setIdColor(4);
			
			ShopDTO t = new ShopDTO();
			t.setIdShop(1);
			d.setShop(t);
			
			d.setTxBarCode("aaaa");

			ArticleFullDTO f = new ArticleFullDTO();

			f.setPgArticle(2);
			f.setQtStock(2);
			f.setIdSize(18);
			f.setIdColor(4);
			
			f.setShop(t);
			f.setTxBarCode("bbbbb");

			e.add(d);
			e.add(f);

			a.setArticles(e);

			List<String> g = new ArrayList<String>();
			g.add("A1.JPG");
			g.add("A2.JPG");
			g.add("A3.JPG");
			g.add("A4.JPG");

			a.setImagesUrl(g);

			Integer tttttt = OthalaFactory.getProductServiceInstance()
					.insertProduct(a);

		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}
}
