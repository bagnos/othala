package it.othala.service.interfaces;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.MailConfermaDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.StateOrderDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;
import it.othala.payment.paypal.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalPaymentRefusedException;

import java.util.List;

public interface IOrderService {

	public List<OrderFullDTO> getOrders(Integer Order, String User, Integer StatoOrdine);

	public OrderFullDTO insertOrder(OrderFullDTO orderFull) throws MailNotSendException, OthalaException;

	public OrderFullDTO confirmOrderPayment(PayPalWrapper wrap, Integer idOrder, GetExpressCheckoutDetailsDTO details)
			throws StockNotPresentException, PayPalException, PayPalFundingFailureException, PayPalFailureException, PayPalPaymentRefusedException;

	public OrderFullDTO doPaymentByPayPal(PayPalWrapper wrapper, Integer idOrder, GetExpressCheckoutDetailsDTO details)
			throws StockNotPresentException, PayPalException, PayPalFundingFailureException, PayPalFailureException,PayPalPaymentRefusedException;

	public void confirmOrderDelivery(String idTrackingNumber, Integer idOrder);

	public void updateStateOrder(Integer idOrder, OrderFullDTO orderFull, TypeStateOrder stato);

	public void deleteAddress(Integer idAddress);

	public void deleteDeliveryCost(Integer idDeliveryCost);

	public DeliveryDTO getDeliveryInfo(String userId);

	public DeliveryAddressDTO newAddress(DeliveryAddressDTO newAddress);

	public DeliveryAddressDTO updateAddress(DeliveryAddressDTO newAddress, Integer idAddress);

	

}
