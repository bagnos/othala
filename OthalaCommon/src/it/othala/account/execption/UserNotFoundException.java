package it.othala.account.execption;

import it.othala.execption.OthalaException;


public class UserNotFoundException extends OthalaException {

	private static final long serialVersionUID = 1L;
	private String user;
	private static final String KEY_MESSAGE="exception_userNotFoundException"; 

	public String getUser() {
		return user;
	}

	public UserNotFoundException(String user) {		
		super(KEY_MESSAGE,new Object[] { user });
		// TODO Auto-generated constructor stub
		this.user=user;
	}

}
