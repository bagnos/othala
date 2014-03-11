package it.othala.account.execption;

import it.othala.execption.OthalaException;

public class BadCredentialException extends OthalaException {

	private static final long serialVersionUID = 1L;

	private static final String KEY_MESSAGE = "exception_badCredentialException";
	
	public BadCredentialException() {
		super(KEY_MESSAGE,new Object[] {});
		// TODO Auto-generated constructor stub

	}

}
