package it.othala.account.view;




import it.othala.account.model.AccessBean;
import it.othala.account.model.RegistrationBean;
import it.othala.view.BaseView;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.event.ActionEvent;

@ManagedBean
public class AccessView extends BaseView{
	
	@ManagedProperty(value = "#{accessBean}")
	private AccessBean accessBean;

	

	public AccessBean getAccessBean() {
		return accessBean;
	}

	public void setAccessBean(AccessBean accessBean) {
		this.accessBean = accessBean;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
