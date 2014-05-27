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

	public void test() {

		try {

			BigDecimal prezzo = new BigDecimal(395);
			Integer sconto = 30;
			String immagine1 = "991a.jpg";
			String immagine2 = "991b.jpg";
			String immagine3 = "991c.jpg";
			String immagine4 = "991d.jpg";
			String descrizione = "DECOLLETÈ IN BROCCATO FLOREALE 105MM";

			/* 2 donna */
			Integer genere = 2;
			/* 5 d&g */
			Integer brand = 5;
			/* 12 gonne 20 scarpe */
			Integer tipo = 20;

			/* scarpe 24, 25 */
			/* gonne 17 , 18 */

			Integer taglia1 = 24;
			Integer taglia2 = 25;

			/* bianco 4, nero 11, rosa 13 */
			Integer colore1 = 13;
			Integer colore2 = 13;

			ProductFullDTO a = new ProductFullDTO();

			a.setPrice(prezzo);
			a.setDiscount(sconto);
			a.setThumbnailsUrl(immagine1);

			DescriptionDTO b = new DescriptionDTO();
			b.setLanguages("it");
			b.setDescription(descrizione);

			List<DescriptionDTO> c = new ArrayList<DescriptionDTO>();
			c.add(b);

			a.setLangDescription(c);
			a.setIdGender(genere);
			a.setIdBrand(brand);
			a.setIdType(tipo);

			ArticleFullDTO d = new ArticleFullDTO();
			List<ArticleFullDTO> e = new ArrayList<ArticleFullDTO>();

			d.setPgArticle(1);
			d.setQtStock(2);
			d.setIdSize(taglia1);
			d.setIdColor(colore1);

			ShopDTO t = new ShopDTO();
			t.setIdShop(1);
			d.setShop(t);

			d.setTxBarCode("aaaa");

			ArticleFullDTO f = new ArticleFullDTO();

			f.setPgArticle(2);
			f.setQtStock(2);
			f.setIdSize(taglia2);
			f.setIdColor(colore2);

			f.setShop(t);
			f.setTxBarCode("bbbbb");

			e.add(d);
			e.add(f);

			a.setArticles(e);

			List<String> g = new ArrayList<String>();
			g.add(immagine1);
			g.add(immagine2);
			g.add(immagine3);
			g.add(immagine4);

			a.setImagesUrl(g);

			Integer tttttt = OthalaFactory.getProductServiceInstance()
					.insertProduct(a);

		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}

	@Test
	public void test2() {

		try {

			List<Integer> a = new ArrayList<>();
			a.add(881);
			a.add(882);

			OthalaFactory.getProductServiceInstance().publishProduct(a);

		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}

}
