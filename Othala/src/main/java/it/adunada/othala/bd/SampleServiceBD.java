package it.adunada.othala.bd;

import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.ISampleService;

public class SampleServiceBD {

	private static ISampleService service = null;

	static {

		service = OthalaFactory.getSampleServiceInstance();

	}

	public static Integer getId() {
		return service.getId();
	}

}
