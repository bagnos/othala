package it.othala.service;

import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dao.interfaces.IMessagelIpn;
import it.othala.dto.OrderFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalIpnErrorException;
import it.othala.payment.paypal.exception.PayPalIpnInvalidException;
import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.IMailService;
import it.othala.service.interfaces.INewsletterService;
import it.othala.service.interfaces.IOrderService;
import it.othala.service.interfaces.IPaymentService;

import java.math.BigDecimal;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PaymentService implements IPaymentService {

	
	private IOrderService orderService;
	private IMailService mailService;
	private IMessagelIpn messageIpnDAO;

	public void setMessageIpnDAO(IMessagelIpn messageIpnDAO) {
		this.messageIpnDAO = messageIpnDAO;
	}

	public void setMailService(IMailService mailService) {
		this.mailService = mailService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

	private Log log = LogFactory.getLog(PaymentService.class);

	
	private void insertMessage(long idOrder, String idTransaction, String message) {
		// TODO Auto-generated method stub

	}

	
	private boolean exitsIdTransaction(long idOrder, String idTransaction) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void processIpnMessage(String originalRequest, String mc_gross, String mc_currency, String payment_status,
			PayPalWrapper payWrapper) throws PayPalException, PayPalIpnErrorException {
		
		String responseRequest = originalRequest + "&cmd=_notify-validate";
		try {
			// check the payment_status is Completed
			HashMap<String, String> respMap = payWrapper.getNotificationIPN(responseRequest);

			// check that txn_id has not been previously processed
			String txn_id = respMap.get("txn_id");
			int idOrder = Integer.valueOf(respMap.get("custom"));
			if (exitsIdTransaction(idOrder, respMap.get("txn_id"))) {

				// inserisco il messaggio
				insertMessage(idOrder, txn_id, originalRequest);

				// check that receiver_email is your Primary PayPal email
				String emailMerchant = payWrapper.getUsername();
				String receiver_email = respMap.get("receiver_email");
				if (!emailMerchant.equalsIgnoreCase(receiver_email)) {
					log.warn(String.format("emailMerchiant %s diversa dalla mail %s presente nel messaggio %s", txn_id,
							receiver_email, originalRequest));
					return;
				}

				// check that payment_amount/payment_currency are correct
				BigDecimal mc_grossBD = new BigDecimal(mc_gross);
				OrderFullDTO order = orderService.getOrders(idOrder, null, null).get(0);
				if (order.getImOrdine().compareTo(mc_grossBD) != 0) {
					log.warn(String.format("importo db %s diverso dalla importo %s presente nel messaggio %s",
							order.getImOrdine(), mc_gross, order.getImOrdine(), originalRequest));
					return;
				}
				if (mc_currency != "EUR") {
					log.warn(String.format("divisa accetta %s diversa dalla divisa %s presente nel messaggio %s",
							"EUR", mc_currency, originalRequest));
					return;
				}

				// process message
				TypeStateOrder state = TypeStateOrder.valueOf(payment_status);
				orderService.updateStateOrder(idOrder, order, state);
				if (state.getState() == TypeStateOrder.DENIED.getState()) {
					// inviare una mail in cui si comunica che PayPal non ha
					// accettato il pagamento
				}

				return;

			} else {
				// messaggio già elaborato
				log.warn(String.format("transactionId %s del messaggio %s già elaborato ", txn_id, originalRequest));
				return;
			}

		} catch (PayPalIpnInvalidException e) {
			// TODO Auto-generated catch block
			log.error("invalid nella ricezione IPN da paypal, messaggion non corretto", e);
		} catch (PayPalIpnErrorException e) {
			// TODO Auto-generated catch block
			log.error("stringa non prevista nella ricezione IPN da paypal", e);
			throw e;
		} catch (PayPalException e) {
			// TODO Auto-generated catch block
			log.error("errore imprevisto sull'invio del messaggio IPN verso paypal", e);
			throw e;
		}
	}

}
