package it.othala.payment.paypal.exception;

import it.othala.execption.OthalaException;

public class PayPalException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_payPalException";

	public PayPalException(String message,String errorMessage) {
		super(KEY_MESSAGE, new Object[] {errorMessage}, message);
	}
	
	public PayPalException(String errorMessage) {
		super(errorMessage);
	}
	
	public PayPalException(Throwable e) {
		super(e,KEY_MESSAGE);
	}


}
