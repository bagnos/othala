package it.othala.test;

import it.othala.account.execption.MailNotSendException;
import it.othala.service.factory.OthalaFactory;

import org.junit.Test;

public class MailTest {
	@Test
	public void test() {
		
		try {
			OthalaFactory.getOrderServiceInstance().inviaMailDiConferma(null);
		} catch (MailNotSendException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	}
}
