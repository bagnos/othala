package it.othala.account.execption;

import it.othala.execption.OthalaException;

public class MailNotSendException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_mailNotSendException";

	public MailNotSendException() {
		super(KEY_MESSAGE, new Object[] {});
	}
	
	public MailNotSendException(Throwable cause) {
		super(cause,KEY_MESSAGE);
	}

}
