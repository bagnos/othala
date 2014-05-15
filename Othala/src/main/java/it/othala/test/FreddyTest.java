package it.othala.test;

import it.othala.service.factory.OthalaFactory;

import org.junit.Test;

public class FreddyTest {
	@Test
	public void test() {

		try {

			Boolean a = OthalaFactory.getMessageIpnServiceInstance()
					.getIdTransaction(1, "2");
			
			Boolean b = a;

		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}
}
