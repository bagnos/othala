package it.othala.bo.factory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class OthalaFactory {
	
	private static ApplicationContext appContext = null;
	private static final String appContextCompletePath = "it/othala/bo/factory/spring/applicationContext_othala.xml";
	private static Object mutex = new Object();

	private static ApplicationContext getApplicationContext() {

		if (appContext == null) {
			synchronized (mutex) {
				if (appContext == null)

				{
					appContext = new ClassPathXmlApplicationContext(
							appContextCompletePath);
				}

			}
		}
		return appContext;
	}
	
	/*
	  	public static IGestioneAnagrafica getGestioneAnagraficaInstance() {
		IGestioneAnagrafica gestioneAnagrafica = (IGestioneAnagrafica) getApplicationContext()
				.getBean("gestioneAnagrafica");
		return gestioneAnagrafica;

	}
	 */


}
