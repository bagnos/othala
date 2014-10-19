package it.othala.web.utils;

import it.othala.execption.OthalaException;
import it.othala.model.ApplicationBean;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.ResourceBundle;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;

import net.coobird.thumbnailator.Thumbnails;

public class OthalaUtil {

	private static ResourceBundle resources = ResourceBundle.getBundle("language");

	public static String getWordBundle(String key) {
		return resources.getString(key);
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

	public static String getLangFromContextJSF() {
		return FacesContext.getCurrentInstance().getExternalContext().getRequestLocale().getLanguage();
		/* return "en"; */
	}

	public static String getLang(HttpServletRequest req) {
		return req.getLocale().getLanguage();
		/* return "en"; */

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

}
