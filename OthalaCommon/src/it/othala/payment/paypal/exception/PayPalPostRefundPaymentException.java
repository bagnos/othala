package it.othala.payment.paypal.exception;

import it.othala.execption.OthalaException;

public class PayPalPostRefundPaymentException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_postPayPalRefundException";

	public PayPalPostRefundPaymentException(String message,String errorMessage) {
		super(KEY_MESSAGE, new Object[] {errorMessage}, message);
	}
	
	public PayPalPostRefundPaymentException(String errorMessage) {
		super(errorMessage);
	}
	
	public PayPalPostRefundPaymentException(Throwable e,String idRefund,String dsErrore) {
		super(KEY_MESSAGE, new Object[] {idRefund}, dsErrore,e);
		
	}


}
