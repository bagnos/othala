package it.othala.model;

import javax.faces.bean.ManagedBean;

@ManagedBean(name="sampleBean")
public class SampleBean extends BaseBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String initialMessage;

	public void setInitialMessage(String initialMessage) {
		this.initialMessage = initialMessage;
	}

	public String getInitialMessage() {
		return initialMessage;
	}

}
