package it.othala.payment.paypal.exception;

import it.othala.execption.OthalaException;


public class PayPalPaymentRefusedException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_payPalRefused";

	public PayPalPaymentRefusedException(String stato) {
		/*String prd=StringUtils.collectionToCommaDelimitedString(productsNoStocked);*/
		
		super(KEY_MESSAGE, new Object[] {stato});
		// TODO Auto-generated constructor stub
		
	}

}
