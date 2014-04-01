package it.othala.view;

import it.othala.dto.MenuDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.execption.OthalaException;
import it.othala.model.ApplicationBean;
import it.othala.web.utils.OthalaUtil;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
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

	@Inject
	private ApplicationBean beanApplication;

	private List<String> breadCrumb = new ArrayList<>();

	

	public ApplicationBean getBeanApplication() {
		return beanApplication;
	}

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
	
	public void addError(String id,String summary, String message) {
		summary = summary == null ? OthalaUtil.getWordBundle("validator_summary") : summary;
		FacesContext.getCurrentInstance().addMessage(id,
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

	protected String getLang() {
		return OthalaUtil.getLang();
	}

}
