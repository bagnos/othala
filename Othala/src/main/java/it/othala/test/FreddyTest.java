package it.othala.test;

import it.othala.service.factory.OthalaFactory;

import org.junit.Test;

public class FreddyTest {
	@Test
	public void test() {

		try {
			String antani = "1";
			OthalaFactory.getOrderServiceInstance().getDeliveryInfo(antani);
		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}
}
