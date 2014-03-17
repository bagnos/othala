package it.othala.service.factory;

import it.othala.service.interfaces.IAccountService;
import it.othala.service.interfaces.IArticleService;
import it.othala.service.interfaces.IMailService;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class OthalaFactory {

	private static ApplicationContext appContext = null;
	private static final String appContextCompletePath = "it/othala/service/factory/applicationcontext_othala.xml";
	private static Object mutex = new Object();
	private static IAccountService accountService;
	private static IArticleService articleService;
	private static IMailService mailService;

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

	public static IAccountService getAccountServiceInstance() {
		if (accountService == null) {
			accountService = (IAccountService) getApplicationContext().getBean("accountService");
		}
		return accountService;
	}
	
	public static IArticleService getArticleServiceInstance() {
		if (articleService == null) {
			articleService = (IArticleService) getApplicationContext().getBean("articleService");
		}
		return articleService;
	}
	
	public static IMailService getMailServiceInstance() {
		if (mailService == null) {
			mailService = (IMailService) getApplicationContext().getBean("mailService");
		}
		return mailService;
	}

}
