package it.othala.service.interfaces;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailConfermaDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalIpnErrorException;

public interface IPaymentService {

	public void processIpnMessage(String originalRequest, String mc_gross, String mc_currency, String payment_status,
			PayPalWrapper payWrapper) throws PayPalException, PayPalIpnErrorException;

	
	
	public boolean isPaymentKO(TypeStateOrder state);

	public boolean isPaymentKO(String paypalStatus);

	public boolean isPaymentPending(String paypalStatus);

	public boolean isPaymentCompleted(String paypalStatus);

	public void sendMailRefusedPayment(OrderFullDTO order)throws MailNotSendException;

	public void sendMailRefundedPayment(OrderFullDTO order) throws MailNotSendException;
	
	public void sendMailAcceptedPyament(OrderFullDTO order, MailConfermaDTO mailDTO,String status) throws MailNotSendException;
}
