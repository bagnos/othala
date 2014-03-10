package it.othala.account.model;

import it.othala.dto.AccountDTO;
import it.othala.model.BaseBean;

import javax.faces.bean.ManagedBean;

@ManagedBean(name = "accessBean")
public class AccessBean extends BaseBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private boolean staySignIn;
	
	private String email;
	private String confEmail;
	private String psw;
	private String confPsw;
	private String name;
	private String surname;
	private boolean newsletter;
	
	public boolean isNewsletter() {
		return newsletter;
	}


	public void setNewsletter(boolean newsletter) {
		this.newsletter = newsletter;
	}


	public AccountDTO getAccountDTO()
	{
		AccountDTO acc=new AccountDTO();
		acc.setEmail(email);
		acc.setName(name);
		acc.setPsw(confPsw);
		acc.setSurname(surname);;
		acc.setNewsletter(newsletter);
		return acc;
	}
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getConfEmail() {
		return confEmail;
	}

	public void setConfEmail(String confEmail) {
		this.confEmail = confEmail;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getConfPsw() {
		return confPsw;
	}

	public void setConfPsw(String confPsw) {
		this.confPsw = confPsw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public boolean isStaySignIn() {
		return staySignIn;
	}

	public void setStaySignIn(boolean staySignIn) {
		this.staySignIn = staySignIn;
	}

}
