package it.othala.web.utils;

import it.othala.dto.MailPropertiesDTO;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ConfigurationUtil {

	private static String NAME_FILE = "Configuration.properties";
	private static Properties properties = null;
	private static Log log = LogFactory.getLog(ConfigurationUtil.class);
	private static MailPropertiesDTO mailProps;
	private static HttpServletRequest request;
		
	
	private static String getBaseImagePath()
	{		
		String path= request.getServletContext().getRealPath("/");
		 
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

	public static MailPropertiesDTO getMailProps(HttpServletRequest req) {
		
		if (mailProps==null)
		{
			String prefix="";
			prefix=isLocalHost(req)?"test":"";
		if (getProperties() != null) {
			request=req;
			mailProps=new MailPropertiesDTO();
			mailProps.setBasePathThumbinalsArticle(getBaseImageThumbinals());
			mailProps.setBoardUrl(getProperty("BOARD_URL"));
			mailProps.setCompanyName(getProperty("COMPANY_NAME"));
			mailProps.setContextRoot(getContextPath(req));
			mailProps.setDnsSite(getServerName(req));
			mailProps.setFromMail(getProperty("FROM_MAIL"));
			mailProps.setPathImgLogo(getLogoHomeMail());
			mailProps.setPathImgPayment(getImagePayment());
			mailProps.setMailSmtAuth(getProperty(prefix+"mail.smtp.auth"));
			mailProps.setMailSmtpAtarttlsAnable(getProperty(prefix+"mail.smtp.starttls.enable"));
			mailProps.setMailSmtpHost(getProperty(prefix+"mail.smtp.host"));
			mailProps.setMailSmtpPort(getProperty(prefix+"mail.smtp.port"));
			mailProps.setPassword(getProperty(prefix+"password"));
			mailProps.setUsername(getProperty(prefix+"mail.smtp.user"));
			
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
		key=key!=null?key.trim():null;
		if (getProperties() != null) {
			if (getProperties().containsKey(key)) {
				value = getProperties().getProperty(key).trim();
				return value;
			}
		}
		return value;
	}
	
	private static boolean isLocalHost(HttpServletRequest req)
	{
		return req.getRemoteHost().equalsIgnoreCase("127.0.0.1");
	}
	
	public static String getServerName(HttpServletRequest req)
	{
		return req.getServerName();
	}
	
	public static String getContextPath(HttpServletRequest req)
	{
		return req.getContextPath();
	}
	
	public static String getOrderPrintImageUrl(HttpServletRequest req)
	{
		String url=getProperty("OrderPrintImageUrl");
		url=url.replaceAll("request.remoteHost", getServerName(req));
		url=url.replaceAll("request.contextPath",getContextPath(req));
		return url;
	}
	
	
	

}