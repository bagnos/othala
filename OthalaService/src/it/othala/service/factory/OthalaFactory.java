package it.othala.service.factory;

import it.othala.service.interfaces.ISampleService;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class OthalaFactory {

	private static ApplicationContext appContext = null;
	private static final String appContextCompletePath = "it/othala/service/factory/applicationcontext_othala.xml";
	private static Object mutex = new Object();

	private static ApplicationContext getApplicationContext() {

		if (appContext == null) {
			synchronized (mutex) {
				if (appContext == null)

				{
					appContext = new ClassPathXmlApplicationContext(appContextCompletePath);
				}

			}
		}
		return appContext;
	}

	public static ISampleService getSampleServiceInstance() {
		ISampleService gestioneAnagrafica = (ISampleService) getApplicationContext().getBean(
				"sampleService");
		return gestioneAnagrafica;

	}

}
