package it.othala.service.interfaces;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailConfermaDTO;
import it.othala.dto.OrderFullDTO;
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

	public void sendMailRefusedPayment(OrderFullDTO order, String companyName)throws MailNotSendException;

	public void sendMailRefundedPayment(OrderFullDTO order, String companyName) throws MailNotSendException;
	
	public void sendMailAcceptedPyament(OrderFullDTO order, MailConfermaDTO mailDTO,boolean pending) throws MailNotSendException;
}
