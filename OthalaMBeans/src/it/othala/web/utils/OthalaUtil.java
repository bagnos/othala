package it.othala.web.utils;

import it.othala.execption.OthalaException;
import it.othala.model.ApplicationBean;
import it.othala.model.LocaleManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.faces.bean.ManagedProperty;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;

public class OthalaUtil {

	
	public static String getWordBundle(String key) {
		return getLocalManagerBean().getWordBundle(key);

	}
	
	

	
	

	private static HttpServletRequest getRequest() {
		ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
		HttpServletRequest request = (HttpServletRequest) context.getRequest();
		return request;
	}

	public static String getWordBundle(String key, Object[] parms) {
		String message = MessageFormat.format(getWordBundle(key), parms);
		return message;
	}

	@SuppressWarnings("unchecked")
	public static <T> T findBean(String beanName) {
		FacesContext context = FacesContext.getCurrentInstance();
		return (T) context.getApplication().evaluateExpressionGet(context, "#{" + beanName + "}", Object.class);
	}
	
	

	public static ApplicationBean getApplicationBean() {
		return findBean("applicationBean");
	}
	
	public static LocaleManager getLocalManagerBean() {
		return findBean("localeManager");
	}

	public static String getWordBundle(OthalaException e) {
		String message = "";
		if (e.getKeyMessage() != null && !(e.getKeyMessage().isEmpty())) {
			if (e.getParms() != null && e.getParms().length != 0) {
				// decodifica con parametro
				message = MessageFormat.format(getWordBundle(e.getKeyMessage()), e.getParms());
			} else {
				message = getWordBundle(e.getKeyMessage());
			}
		}
		return message;
	}

	
	
	public static String getHome() {
		String url = String.format("http://%s%s/home", getRequest().getServerName(), getRequest().getContextPath());
		return url;
	}

	public static String getLang(HttpServletRequest req) {
		
		return getLocalManagerBean().getLanguage();
	}

	public static void warning(HttpServletResponse response, String error, Exception e, Log log) {
		log.error(error, e);
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException exc) {
			// egad - we can't tell the user a thing!
			log.error("errore sevlet:" + error != null ? error : "", e);
			return;
		}
		out.println("<H1>Attenzione si è verificato il seguente errore!</h1>");
		out.println("<H3>");
		out.println(error);
		out.println("</H3>");

	}

	public static Map<String, Object> getSessionMap() {
		ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
		Map<String, Object> map = context.getSessionMap();
		return map;
	}

}
