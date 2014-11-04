package it.othala.cartflow.converter;

import it.othala.model.ApplicationBean;
import it.othala.web.utils.OthalaUtil;

public class BaseConverter {
	private ApplicationBean appBean;

	public ApplicationBean getAppBean() {
		if (appBean == null) {
			appBean = OthalaUtil.getApplicationBean();
		}
		return appBean;
	}
}
