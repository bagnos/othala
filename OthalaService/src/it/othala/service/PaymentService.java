package it.othala.service;

import it.othala.dao.interfaces.IMessagelIpnDAO;
import it.othala.dto.OrderFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalIpnErrorException;
import it.othala.payment.paypal.exception.PayPalIpnInvalidException;
import it.othala.service.interfaces.IMailService;
import it.othala.service.interfaces.IOrderService;
import it.othala.service.interfaces.IPaymentService;

import java.math.BigDecimal;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PaymentService implements IPaymentService {

	private IOrderService orderService;
	private IMailService mailService;
	private IMessagelIpnDAO messageIpnDAO;

	public void setMessageIpnDAO(IMessagelIpnDAO messageIpnDAO) {
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
		StringBuilder sb = new StringBuilder();
		boolean formalMessage = false;

		try {
			// resend message to PayPal for securiry protocol
			HashMap<String, String> respMap = payWrapper.getNotificationIPN(responseRequest);

			// check that txn_id has not been previously processed
			String txn_id = respMap.get("txn_id");
			int idOrder = Integer.valueOf(respMap.get("custom"));
			if (!exitsIdTransaction(idOrder, txn_id)) {

				// recupero i dettagli dell'ordine
				OrderFullDTO order = orderService.getOrders(idOrder, null, null).get(0);

				// check that receiver_email is your Primary PayPal email
				String emailMerchant = payWrapper.getUsername();
				String receiver_email = respMap.get("receiver_email");
				if (!emailMerchant.equalsIgnoreCase(receiver_email)) {
					sb.append(String.format(
							"messagio non elaborato: emailMerchant %s diversa dalla mail %s presente nel messaggio %s",
							emailMerchant, receiver_email, originalRequest));
					formalMessage = false;
				}

				// check that payment_amount/payment_currency are correct
				BigDecimal mc_grossBD = new BigDecimal(mc_gross);
				if (order.getImOrdine().compareTo(mc_grossBD) != 0) {
					sb.append(String.format(
							"messagio non elaborato: importo db %s diverso dalla importo %s presente nel messaggio %s",
							order.getImOrdine(), mc_gross, order.getImOrdine(), originalRequest));
					formalMessage = false;
				}
				if (mc_currency != "EUR") {
					sb.append(String
							.format("messagio non elaborato:divisa accetta %s diversa dalla divisa %s presente nel messaggio %s",
									"EUR", mc_currency, originalRequest));
					formalMessage = false;
				}
				// inserisco il messaggio
				insertMessage(idOrder, txn_id, originalRequest);
				if (formalMessage == false) {
					log.error(String.format("Messagio %s non elaborato, ci sono errori formali", "txn_id"));
					return;
				}

				// message is correct, process message
				TypeStateOrder state = TypeStateOrder.valueOf(payment_status);
				orderService.updateStateOrder(idOrder, order, state);
				if (paymentKO(payment_status)) {
					// inviare una mail in cui si comunica che PayPal non ha
					// accettato il pagamento
				} else if (paymentCompleted(payment_status)) {
					// inviare una mail in cui si comunica che PayPal ha
					// accettato il pagamento
				} else {
					// nessuna elaborazione da fare
					log.error(String
							.format("stato del messaggio %s, per il transactionId %s, non ammesso. Nessuna elaborazione da fare, messaggio %s",
									payment_status, txn_id, originalRequest));
				}

				return;

			} else {
				// messaggio già elaborato
				log.error(String.format("transactionId %s del messaggio %s già elaborato ", txn_id, originalRequest));
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

	@Override
	public boolean decreaseQuantity(String paypalStatus) {
		// TODO Auto-generated method stub
		TypeStateOrder state = TypeStateOrder.valueOf(paypalStatus);

		switch (state) {
		case DENIED:
		case FAILED:
		case REFUNDED:
		case EXPIRED:
			return false;

		default:
			return true;
		}
	}

	public boolean paymentKO(String paypalStatus) {
		// TODO Auto-generated method stub
		TypeStateOrder state = TypeStateOrder.valueOf(paypalStatus);

		switch (state) {
		case DENIED:
		case FAILED:
		case REFUNDED:
		case EXPIRED:
			return false;

		default:
			return true;
		}
	}

	@Override
	public boolean paymentPending(String paypalStatus) {
		// TODO Auto-generated method stub
		TypeStateOrder state = TypeStateOrder.valueOf(paypalStatus);

		switch (state) {
		case PENDING:
		case PROCESSED:
			return true;

		default:
			return false;
		}
	}

	@Override
	public boolean paymentCompleted(String paypalStatus) {
		// TODO Auto-generated method stub
		TypeStateOrder state = TypeStateOrder.valueOf(paypalStatus);

		switch (state) {
		case COMPLETED:
		case REFUNDED:
			return true;

		default:
			return false;
		}
	}

}
