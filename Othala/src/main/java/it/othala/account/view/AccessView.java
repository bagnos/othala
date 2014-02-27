package it.othala.account.view;




import it.othala.account.model.AccessBean;
import it.othala.view.BaseView;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.event.ActionEvent;
import javax.faces.event.ActionListener;

@ManagedBean
public class AccessView extends BaseView{
	
	@ManagedProperty(value = "#{accessBean}")
	private AccessBean accessBean;
	private boolean renderClient;

	
	public boolean isRenderClient() {
		return renderClient;
	}

	public void setRenderClient(boolean renderClient) {
		this.renderClient = renderClient;
	}

	public AccessBean getAccessBean() {
		return accessBean;
	}

	public void setAccessBean(AccessBean accessBean) {
		this.accessBean = accessBean;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		accessBean.setStaySignIn(true);
		return null;
	}
	
	public String login()
	{
		renderClient=true;
		return null;
	}
	
	public String registration()
	{
		return null;
	}
	
	public String logout()
	{
		renderClient=false;
		return null;
	}
	
	public void logout(ActionEvent e)
	{
		renderClient=false;
		
	}
	

}
