package it.othala.payment.paypal.exception;

import it.othala.execption.OthalaException;

public class PayPalFailureException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_payPalFailureException";

	public PayPalFailureException(String message,String errorMessage) {
		super(KEY_MESSAGE, new Object[] {errorMessage}, message);
	}
	
	public PayPalFailureException(String errorMessage) {
		super(errorMessage);
	}
	


}
