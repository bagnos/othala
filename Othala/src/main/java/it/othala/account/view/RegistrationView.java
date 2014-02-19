package it.othala.account.view;




import it.othala.account.model.RegistrationBean;
import it.othala.view.BaseView;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.event.ActionEvent;

@ManagedBean
public class RegistrationView extends BaseView{
	
	@ManagedProperty(value = "#{registrationBean}")
	private RegistrationBean registrationBean;

	

	public RegistrationBean getRegistrationBean() {
		return registrationBean;
	}

	public void setRegistrationBean(RegistrationBean registrationBean) {
		this.registrationBean = registrationBean;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void creaAccountClick(ActionEvent e)
	{
		addInfo("Crea Account","Operazione eseguita con successo");
	}

}
