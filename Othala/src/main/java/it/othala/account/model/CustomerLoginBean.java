package it.othala.account.model;


import javax.inject.Named;
import java.io.Serializable;

@Named
@javax.enterprise.context.SessionScoped
public class CustomerLoginBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email;
	
	private String name;
	
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
	
	
	
}
