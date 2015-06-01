package it.othala.model;

import it.othala.web.utils.OthalaUtil;

import java.io.IOException;
import java.io.Serializable;
import java.text.MessageFormat;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import org.primefaces.context.PrimeFacesContext;
import org.primefaces.context.RequestContext;

@ManagedBean
@SessionScoped
public class LocaleManager implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Locale locale = FacesContext.getCurrentInstance().getViewRoot().getLocale();
    private transient ResourceBundle resources;
    
   
	public ResourceBundle getResources() {
		if (resources == null) {
			resources = ResourceBundle.getBundle("language", locale);
		}
		return resources;
	}

	

	public Locale getLocale() {
        return locale;
    }

    public String getLanguage() {    	
        return locale.getLanguage();
    }
    
    public void changeLocaleWithRedirect(String language) {
    	changeLocale(language);
    	 try {
 			FacesContext.getCurrentInstance().getExternalContext()
 					.redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath() + "/home");
 		} catch (IOException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
    }

    public void changeLocale(String language) {
        locale = new Locale(language);
        //OthalaUtil.setResources(getLocale()); 
        FacesContext.getCurrentInstance().getViewRoot().setLocale(locale);
        resources = ResourceBundle.getBundle("language", locale);
        /*
        try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath() + "/home");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
        /*
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("$.get(document.URL);");*/
        
        
        
        //beanApplication.resetDomain();
        
       /* 
        try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(OthalaUtil.getHome());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
    }
    
	public String getWordBundle(String key) {
		return getResources().getString(key);

	}
	
	public String getWordBundle(String key, Object[] parms) {
		String message = MessageFormat.format(getWordBundle(key), parms);
		return message;
	}

}
