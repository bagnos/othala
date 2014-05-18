package it.othala.service.interfaces;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;
import it.othala.payment.paypal.dto.DoExpressCheckoutPaymentDTO;
import it.othala.payment.paypal.dto.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.dto.SetExpressCheckoutDTO;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalIpnErrorException;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;

public interface IPaymentService {

	public void processIpnMessage(String originalRequest, String mc_gross, String mc_currency, String payment_status,
			ProfilePayPalDTO profle,MailPropertiesDTO mailProps) throws PayPalException, PayPalIpnErrorException;

	

	public boolean isPaymentKO(String paypalStatus);

	public boolean isPaymentPending(String paypalStatus);

	public boolean isPaymentCompleted(String paypalStatus);

	public void sendMailRefusedPayment(OrderFullDTO order,MailPropertiesDTO mailProps) throws MailNotSendException;

	public void sendMailRefundedPayment(OrderFullDTO order,MailPropertiesDTO mailProps) throws MailNotSendException;

	public void sendMailAcceptedPyament(OrderFullDTO order, MailPropertiesDTO mailDTO, String status)
			throws MailNotSendException;

	public void sendMailAcceptedPyamentAfterPending(OrderFullDTO order, MailPropertiesDTO mailDTO) throws MailNotSendException;

	public SetExpressCheckoutDTO setExpressCheckout(OrderFullDTO order, ProfilePayPalDTO profile)
			throws MalformedURLException, UnsupportedEncodingException, PayPalException,OthalaException;

	public DoExpressCheckoutPaymentDTO doExpressCheckoutPayment(GetExpressCheckoutDetailsDTO details,
			ProfilePayPalDTO profile,OrderFullDTO order) throws PayPalFundingFailureException, PayPalException,StockNotPresentException, PayPalFailureException;

	public GetExpressCheckoutDetailsDTO getExpressCheckoutDetails(String token, ProfilePayPalDTO profile)
			throws MalformedURLException, UnsupportedEncodingException, PayPalException;
}
