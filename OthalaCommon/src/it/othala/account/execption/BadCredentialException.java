package it.othala.account.execption;

import it.othala.execption.OthalaException;

public class BadCredentialException extends OthalaException{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3415594102509119972L;

	public BadCredentialException(String dsErrore, Throwable cause) {
		super(dsErrore, cause);
		// TODO Auto-generated constructor stub
	}

}
