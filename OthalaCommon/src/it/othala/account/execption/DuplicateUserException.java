package it.othala.account.execption;

import it.othala.execption.OthalaException;

public class DuplicateUserException extends OthalaException {

	private static final long serialVersionUID = 1L;

	public DuplicateUserException(String dsErrore, Throwable cause) {
		super(dsErrore, cause);
		// TODO Auto-generated constructor stub
	}

}
