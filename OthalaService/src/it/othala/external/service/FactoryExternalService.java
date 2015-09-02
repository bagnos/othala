package it.othala.external.service;

import it.othala.external.service.interfaces.IOthalaExternalServices;
import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.IAccountService;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class FactoryExternalService {

	private static String appContextCompletePath = "it/othala/external/service/applicationcontext_othala#SITO#.xml";
	private static String appContextCompleteInternalPath = "it/othala//service/applicationcontext_othala#SITO#.xml";
	private static IOthalaExternalServices externalService;
	private static ApplicationContext appContext = null;
	private static Object mutex = new Object();
	private static IOthalaExternalServices externalServices;

	private static ApplicationContext getApplicationContext(String sito) {

		if (appContext == null) {
			synchronized (mutex) {
				if (appContext == null)

				{
					appContextCompletePath = appContextCompletePath.replace("#SITO#", sito);
					appContext = new ClassPathXmlApplicationContext(appContextCompletePath);
				}

			}
		}
		return appContext;
	}

	private static IOthalaExternalServices getExternalServiceInstance(String sito) {
		if (externalServices == null) {
			externalServices = (IOthalaExternalServices) getApplicationContext(sito).getBean("externalServices");
		}
		return externalServices;
	}

	public static IOthalaExternalServices getExternalService(String sito, IOthalaExternalServices othalaExternalService) {
		externalService = othalaExternalService;

		if (sito != null && !sito.isEmpty()) {

			externalService = getExternalServiceInstance(sito);

		}

		return externalService;
	}

	public static IOthalaExternalServices getExternalService(String sito) {

		if (sito != null && !sito.isEmpty()) {

			externalService = getExternalServiceInstance(sito);

		} else {
			externalService = OthalaFactory.getExternalServiceInstance();
		}

		return externalService;
	}

}
