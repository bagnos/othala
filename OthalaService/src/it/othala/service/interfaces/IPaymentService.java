package it.othala.service.interfaces;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailConfermaDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.payment.paypal.DoExpressCheckoutPaymentDTO;
import it.othala.payment.paypal.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.OrderPayPalDTO;
import it.othala.payment.paypal.SetExpressCheckoutDTO;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalIpnErrorException;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;

public interface IPaymentService {

	public void processIpnMessage(String originalRequest, String mc_gross, String mc_currency, String payment_status,
			ProfilePayPalDTO profle) throws PayPalException, PayPalIpnErrorException;

	public boolean isPaymentKO(TypeStateOrder state);

	public boolean isPaymentKO(String paypalStatus);

	public boolean isPaymentPending(String paypalStatus);

	public boolean isPaymentCompleted(String paypalStatus);

	public void sendMailRefusedPayment(OrderFullDTO order) throws MailNotSendException;

	public void sendMailRefundedPayment(OrderFullDTO order) throws MailNotSendException;

	public void sendMailAcceptedPyament(OrderFullDTO order, MailConfermaDTO mailDTO, String status)
			throws MailNotSendException;

	public void sendMailAcceptedPyamentAfterPending(OrderFullDTO order) throws MailNotSendException;

	public SetExpressCheckoutDTO setExpressCheckout(OrderPayPalDTO cart, ProfilePayPalDTO profile)
			throws MalformedURLException, UnsupportedEncodingException, PayPalException;

	public DoExpressCheckoutPaymentDTO doExpressCheckoutPayment(GetExpressCheckoutDetailsDTO details,
			ProfilePayPalDTO profile) throws PayPalFundingFailureException, PayPalException, PayPalFailureException;

	public GetExpressCheckoutDetailsDTO getExpressCheckoutDetails(String token, ProfilePayPalDTO profile)
			throws MalformedURLException, UnsupportedEncodingException, PayPalException;
}
