package it.othala.test;

import it.othala.dto.ProductFullDTO;
import it.othala.service.factory.OthalaFactory;

import org.junit.Test;

public class FreddyTest {
	@Test
	public void test() {

		try {

			ProductFullDTO antani = OthalaFactory.getProductServiceInstance()
					.getProductArticleFull("it", 1, 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}
}
