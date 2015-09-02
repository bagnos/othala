package it.othala.payment.paypal.exception;

import it.othala.execption.OthalaException;


public class PayPalFundingFailureException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_payPalFundingFailureException";
	
	private String redirectUrl;

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public PayPalFundingFailureException(String messageException,String redirectUrl) {
		super(KEY_MESSAGE, new Object[] {}, messageException);
		this.redirectUrl=redirectUrl;
	}

}
