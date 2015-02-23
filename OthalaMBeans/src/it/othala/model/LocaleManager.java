package it.othala.model;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.MenuDTO;
import it.othala.dto.MenuFullDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.web.utils.OthalaUtil;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import java.util.Locale;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class LocaleManager implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Locale locale = FacesContext.getCurrentInstance().getViewRoot().getLocale();
    @ManagedProperty(value="#{applicationBean}")	
	private ApplicationBean beanApplication;
    
    @ManagedProperty(value="#{cartFlowBean}")   	
   	private CartFlowBean cartFlowBean;
    
   
	public void setCartFlowBean(CartFlowBean cartFlowBean) {
		this.cartFlowBean = cartFlowBean;
	}

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
        OthalaUtil.setResources(locale);
        beanApplication.resetDomain();
        cartFlowBean.setArticleCashed(null);
        cartFlowBean.setArticleNewArrivals(null);
        
        
        try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(OthalaUtil.getHome());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

}
