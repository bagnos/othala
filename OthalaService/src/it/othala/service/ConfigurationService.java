package it.othala.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ConfigurationService {

	private static String NAME_FILE = "Configuration.properties";
	private static Properties properties = null;
	private static Log log = LogFactory.getLog(ConfigurationService.class);
	public final static String DNS_SITE="DNS_SITE";
	public final static String BOARD_URL="BOARD_URL";
	public final static String COMPANY_NAME="COMPANY_NAME";
	public final static String FROM_MAIL="FROM_MAIL";
	public final static String ACTIVATE_PAGE="ACTIVATE_PAGE";
	public final static String CONTEXT_ROOT="CONTEXT_ROOT";
	
	

	private static Properties getProperties() {
		if (properties == null) {
			properties = new Properties();
			InputStream is = null;
			try {
				is = Thread.currentThread().getContextClassLoader().getResourceAsStream(NAME_FILE);
				properties.load(is);
			} catch (IOException e) {
				log.error("errore nel recupero del file di properties", e);
			} finally {
				try {
					if (is != null) {
						is.close();
					}

				} catch (IOException e) {
					// TODO Auto-generated catch block

				}
			}
		}
		return properties;

	}

	public static String getProperty(String key) {
		String value = null;

		if (getProperties() != null) {
			if (getProperties().containsKey(key)) {
				value = getProperties().getProperty(key);
				return value;
			}
		}
		return value;
	}

}