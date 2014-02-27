package it.othala.account.model;



import it.othala.model.BaseBean;

import javax.faces.bean.ManagedBean;

@ManagedBean(name="accessBean")
public class AccessBean extends BaseBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String email;
	private String psw;
	private boolean staySignIn;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public boolean isStaySignIn() {
		return staySignIn;
	}
	public void setStaySignIn(boolean staySignIn) {
		this.staySignIn = staySignIn;
	}
	
}
