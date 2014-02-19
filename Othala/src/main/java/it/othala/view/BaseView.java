package it.othala.view;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

public abstract class BaseView {
	/**
	 * dentro il content del .xhtml inserire {@code <f:metadata>
	 * <f:viewAction action="sampleView.doInit" /> </f:metadata>} il metodo
	 * doInit verrà inocato alla prima richesta sulla pagina, no postback di
	 * default. Può essere utilizzato per inizializzare la view.
	 * 
	 * @return
	 */
	public abstract String doInit();

	public void addInfo(String summary,String message) {
		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, summary, message));
	}

	public void addWarn(String summary,String message) {
		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_WARN, summary, message));
	}

	public void addError(String summary,String message) {
		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, message));
	}

	public void addFatal(String summary,String message) {
		
		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_FATAL, summary, message));
	}
}
