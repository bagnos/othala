package it.adunada.othala.view;

import it.adunada.othala.bd.SampleServiceBD;
import it.adunada.othala.bean.SampleBean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.event.ActionEvent;

@ManagedBean
public class SampleView extends BaseView {

	@ManagedProperty(value = "#{sampleBean}")
	private SampleBean sampleBean;

	public void setSampleBean(SampleBean sampleBean) {
		this.sampleBean = sampleBean;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		sampleBean.setInitialMessage("Welcome");
		return null;
	}

	public void ajaxCall(ActionEvent e) {
		sampleBean.setInitialMessage("Ajax call");
		Integer id=SampleServiceBD.getId();
		sampleBean.setInitialMessage(String.format("Sample id %d", id));
	}

}
