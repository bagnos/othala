package it.othala.web.utils;

import it.othala.dto.MailPropertiesDTO;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.faces.context.FacesContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ConfigurationUtil {

	private static String NAME_FILE = "Configuration.properties";
	private static Properties properties = null;
	private static Log log = LogFactory.getLog(ConfigurationUtil.class);
	private static MailPropertiesDTO mailProps;
	
	private static String getBaseImagePath()
	{		
		String path= FacesContext.getCurrentInstance().getExternalContext().getRealPath("/");
		path+="resources"+File.separator+"images"+File.separator;
		return path;
	}
	private static String getLogoHomeMail()
	{		
		String path= getBaseImagePath();
		path+="logo2-small.png";
		return path;
	}
	private static String getBaseImageThumbinals()
	{
		String path=getBaseImagePath()+"cartThumbinals"+File.separator;
		return path;
	}
	
	private static String getImagePayment()
	{
		String path= getBaseImagePath();
		path+="payment"+File.separator+"paypal.gif";
		return path;
	}

	public static MailPropertiesDTO getMailProps() {
		if (mailProps==null)
		{
		if (getProperties() != null) {
			mailProps=new MailPropertiesDTO();
			mailProps.setBasePathThumbinalsArticle(getBaseImageThumbinals());
			mailProps.setBoardUrl(getProperty("BOARD_URL"));
			mailProps.setCompanyName(getProperty("COMPANY_NAME"));
			mailProps.setContextRoot(getProperty("CONTEXT_ROOT"));
			mailProps.setDnsSite(getProperty("DNS_SITE"));
			mailProps.setFromMail(getProperty("FROM_MAIL"));
			mailProps.setPathImgLogo(getLogoHomeMail());
			mailProps.setPathImgPayment(getImagePayment());
			mailProps.setMailSmtAuth(getProperty("mail.smtp.auth"));
			mailProps.setMailSmtpAtarttlsAnable(getProperty("ail.smtp.starttls.enable"));
			mailProps.setMailSmtpHost(getProperty("mail.smtp.host"));
			mailProps.setMailSmtpPort(getProperty("mail.smtp.port"));
			mailProps.setPassword(getProperty("password"));
			mailProps.setUsername(getProperty("mail.smtp.user"));
			
		}
		}
		return mailProps;
	}

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