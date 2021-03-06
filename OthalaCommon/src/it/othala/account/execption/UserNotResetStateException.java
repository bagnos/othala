package it.othala.account.execption;

import it.othala.execption.OthalaException;

public class UserNotResetStateException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3415594102509119972L;
	private String user;

	private static final String KEY_MESSAGE = "exception_userNotResetStateException";

	public String getUser() {
		return user;
	}

	public UserNotResetStateException(String user) {
		super(KEY_MESSAGE, new Object[] { user });
		// TODO Auto-generated constructor stub
		this.user = user;
	}

}
