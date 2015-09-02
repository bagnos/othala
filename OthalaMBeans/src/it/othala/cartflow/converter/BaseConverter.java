package it.othala.cartflow.converter;

import it.othala.model.ApplicationBean;
import it.othala.model.LocaleManager;
import it.othala.web.utils.OthalaUtil;

public class BaseConverter {
	private ApplicationBean appBean;
	private LocaleManager locBean;

	public LocaleManager getLocBean() {
		if (locBean == null) {
			locBean = OthalaUtil.getLocalManagerBean();
		}
		return locBean;
	}

	public ApplicationBean getAppBean() {
		if (appBean == null) {
			appBean = OthalaUtil.getApplicationBean();
		}
		return appBean;
	}
	
	
}
