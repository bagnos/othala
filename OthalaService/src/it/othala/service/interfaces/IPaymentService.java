package it.othala.service.interfaces;

import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalIpnErrorException;

public interface IPaymentService {

	public void processIpnMessage(String originalRequest, String mc_gross, String mc_currency, String payment_status,
			PayPalWrapper payWrapper) throws PayPalException, PayPalIpnErrorException;
	
	public boolean decreaseQuantity(String paypalStatus);
	public boolean paymentKO(String paypalStatus);
	public boolean paymentPending(String paypalStatus);
	public boolean paymentCompleted(String paypalStatus);
}
