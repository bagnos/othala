package it.othala.test;

import it.othala.dto.DeliveryAddressDTO;
import it.othala.service.factory.OthalaFactory;

import org.junit.Test;

public class FreddyTest {
	@Test
	public void test() {

		try {
			DeliveryAddressDTO a = new DeliveryAddressDTO();
			a.setUserId("1");
			a.setCognome("Maiala");
			a.setNome("Madonna");
			a.setCap("53100");
			a.setComune("Siena");
			a.setEtichetta("Lavoro");
			a.setIdAddress(2);
			a.setNazione("Italia");
			a.setProvincia("Siena");
			a.setTel("057737888");
			a.setVia("ricasoli, 60");
			
			
			DeliveryAddressDTO b =  OthalaFactory.getOrderServiceInstance().newAddress(a);
		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}
}
