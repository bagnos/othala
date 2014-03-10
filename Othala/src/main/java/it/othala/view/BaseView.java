package it.othala.view;

import it.othala.execption.OthalaException;
import it.othala.web.utils.OthalaUtil;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public abstract class BaseView {
	/**
	 * dentro il content del .xhtml inserire {@code <f:metadata>
	 * <f:viewAction action="sampleView.doInit" /> </f:metadata>} il metodo
	 * doInit verrà inocato alla prima richesta sulla pagina, no postback di
	 * default. Può essere utilizzato per inizializzare la view.
	 * 
	 * @return
	 */
	protected static Log log = LogFactory.getLog(BaseView.class);

	public abstract String doInit();

	public void addInfo(String summary, String message) {
		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_INFO, summary, message));
	}

	public void addWarn(String summary, String message) {
		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_WARN, summary, message));
	}

	public void addError(String summary, String message) {
		summary = summary == null ? OthalaUtil.getWordBundle("validator_summary") : summary;
		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, message));
	}

	public void addGenericError(Exception e, String dsErrorLog) {
		log.error(dsErrorLog, e);
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_ERROR, OthalaUtil.getWordBundle("validator_summary"), OthalaUtil
						.getWordBundle("exception_base")));
	}

	public void addOthalaExceptionError(OthalaException e, String dsErrorLog) {
		log.error(dsErrorLog, e);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_ERROR, OthalaUtil.getWordBundle("validator_summary"), OthalaUtil
						.getWordBundle(e)));
	}

	public void addFatal(String summary, String message) {

		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_FATAL, summary, message));
	}

	protected String getQueryStringParm(String key) {
		HttpServletRequest hsr = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext()
				.getRequest();
		if (hsr.getParameter(key) != null) {
			return hsr.getParameter(key).toString();
		} else {
			return null;
		}

	}

}
