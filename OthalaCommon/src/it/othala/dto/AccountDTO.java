package it.othala.dto;

import java.io.Serializable;
 
public class AccountDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	private String email;
	private String psw;
	private String name;
	private String surname;
	private int state;
	private boolean newsletter;
	private String cdFisc;

	public String getCdFisc() {
		return cdFisc;
	}

	public void setCdFisc(String cdFisc) {
		this.cdFisc = cdFisc;
	}

	public boolean isNewsletter() {
		return newsletter;
	}

	public void setNewsletter(boolean newsletter) {
		this.newsletter = newsletter;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

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

}
