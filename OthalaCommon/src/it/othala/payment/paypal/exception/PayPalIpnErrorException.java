package it.othala.payment.paypal.exception;

import it.othala.execption.OthalaException;

public class PayPalIpnErrorException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public PayPalIpnErrorException(String errorMessage) {
		super(errorMessage);
	}
	


}
