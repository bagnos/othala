package it.othala.web.utils;

import it.othala.execption.OthalaException;

import java.text.MessageFormat;
import java.util.ResourceBundle;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

public class OthalaUtil {

	private static ResourceBundle resources = ResourceBundle.getBundle("language");
	
	public static String getWordBundle(String key) {
		return resources.getString(key);
	}
	
	public static String getWordBundle(String key,Object[] parms) {
		String message=MessageFormat.format(getWordBundle(key),parms);	
		return message;
	}
	
	public static String getWordBundle(OthalaException e) {
		String message="";
		if (e.getKeyMessage()!=null && !(e.getKeyMessage().isEmpty()))
		{
			if (e.getParms()!=null && e.getParms().length!=0)
			{
				//decodifica con parametro				
				message=MessageFormat.format(getWordBundle(e.getKeyMessage()), e.getParms());	             
			}
			else
			{
				message=getWordBundle(e.getKeyMessage());
			}
		}
		return message;
	}
	
	public static String getLangFromContextJSF()
	{
		return FacesContext.getCurrentInstance().getExternalContext().getRequestLocale().getLanguage();
	}
	
	public static String getLang(HttpServletRequest req)
	{
		return req.getLocale().getLanguage();
		
	}
	
	
	
	
	
	
}
