package it.othala.payment.paypal.exception;

import it.othala.execption.OthalaException;

public class PayPalIpnInvalidException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PayPalIpnInvalidException(String errorMessage) {
		super(errorMessage);
	}
	


}
