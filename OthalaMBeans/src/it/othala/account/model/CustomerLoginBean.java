package it.othala.account.model;


import it.othala.dto.AccountDTO;
import it.othala.dto.DeliveryDTO;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/*@Named
@javax.enterprise.context.SessionScoped*/
@ManagedBean
@SessionScoped
public class CustomerLoginBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email;
	
	private String name;
	private String surname;
	
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public void updateLoginBean(AccountDTO acc)
	{
		this.setName(acc.getName());
		this.setEmail(acc.getEmail());
		this.setSurname(acc.getSurname());
	}
	
	
	
}
