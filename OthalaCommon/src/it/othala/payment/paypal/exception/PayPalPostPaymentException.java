package it.othala.payment.paypal.exception;

import it.othala.execption.OthalaException;

public class PayPalPostPaymentException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_postPayPalException";

	public PayPalPostPaymentException(String message,String errorMessage) {
		super(KEY_MESSAGE, new Object[] {errorMessage}, message);
	}
	
	public PayPalPostPaymentException(String errorMessage) {
		super(errorMessage);
	}
	
	public PayPalPostPaymentException(Throwable e,int idOrder,String dsErrore) {
		super(KEY_MESSAGE, new Object[] {idOrder}, dsErrore);
		
	}


}
