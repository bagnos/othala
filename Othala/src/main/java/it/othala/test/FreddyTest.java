package it.othala.test;

import it.othala.dto.MessageIpnDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.service.factory.OthalaFactory;

import org.junit.Test;

public class FreddyTest {
	@Test
	public void test() {

		try {
			
			MessageIpnDTO antani = new MessageIpnDTO();
			antani.setIdOrder(1);
			antani.setIdTransaction("1");
			antani.setTxMessage("a");
			antani.setTxNote("b");
			antani.setTxStato("c");
			antani.setFgElaborato(true);
			
			

			OthalaFactory.getMessageIpnServiceInstance().insertMessageIpn(antani);

		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}
}
