package it.othala.model;

import it.othala.web.utils.OthalaUtil;

import java.io.IOException;
import java.util.Locale;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class LocaleManager {

    private Locale locale = FacesContext.getCurrentInstance().getViewRoot().getLocale();
    @ManagedProperty(value="#{applicationBean}")
	//@Inject
	private ApplicationBean beanApplication;

    public void setBeanApplication(ApplicationBean beanApplication) {
		this.beanApplication = beanApplication;
	}

	public Locale getLocale() {
        return locale;
    }

    public String getLanguage() {
        return locale.getLanguage();
    }

    public void changeLocale(String language) {
        locale = new Locale(language);
        //OthalaUtil.setResources(getLocale()); 
        FacesContext.getCurrentInstance().getViewRoot().setLocale(locale);
        OthalaUtil.setLangFromContextJSF(locale.getLanguage());
        beanApplication.resetDomain();
        beanApplication.resetMenu();
    }

}
