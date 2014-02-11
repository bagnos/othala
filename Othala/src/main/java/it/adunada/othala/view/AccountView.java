package it.adunada.othala.view;

import it.adunada.othala.bean.AccountBean;



import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

@ManagedBean
public class AccountView extends BaseView{
	
	@ManagedProperty(value = "#{accountBean}")
	private AccountBean accountBean;

	public AccountBean getAccountBean() {
		return accountBean;
	}

	public void setAccountBean(AccountBean accountBean) {
		this.accountBean = accountBean;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		return null;
	}

}
