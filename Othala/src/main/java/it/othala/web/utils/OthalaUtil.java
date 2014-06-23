package it.othala.web.utils;

import it.othala.execption.OthalaException;
import it.othala.model.ApplicationBean;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.ResourceBundle;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

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
	}

	public static String getLang(HttpServletRequest req) {
		return req.getLocale().getLanguage();

	}

	public static String resizeImageThumb(File fileIn) throws IOException {
		int w = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageThumbW"));
		int h = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageThumbH"));
		String prefix = ConfigurationUtil.getProperty("prefixImageThumb");
		String fileResized = fileIn.getParent() + File.separator + prefix + fileIn.getName();
		Thumbnails.of(fileIn).size(w, h).toFile(fileResized);
		return prefix + fileIn.getName();
	}
	
	public static void deleteImageThumb(String nomeFile,String basePath)
	{
		String prefix = ConfigurationUtil.getProperty("prefixImageThumb");
		String fileToDelete=basePath+File.separator+prefix+nomeFile;
		File file=new File(fileToDelete);
		file.delete();
	}

	public static String resizeAndCopyImage(InputStream fileIS, String basePathToCopy, String nomeFile)
			throws IOException {

		int w, h = 0;

		w = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageW"));
		h = Integer.valueOf(ConfigurationUtil.getProperty("resizeImageH"));

		// fileIn.delete();

		String fileResized = basePathToCopy + File.separator + nomeFile;

		Thumbnails.of(fileIS).size(w, h).toFile(fileResized);

		return nomeFile;
	}

}
