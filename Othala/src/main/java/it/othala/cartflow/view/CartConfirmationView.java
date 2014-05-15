package it.othala.cartflow.view;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.MailConfermaDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.payment.paypal.DoExpressCheckoutPaymentDTO;
import it.othala.payment.paypal.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalPaymentRefusedException;
import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.IPaymentService;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;
import it.othala.web.utils.PayPalUtil;

import java.io.IOException;
import java.util.List;

import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

@Named
@ViewScoped
public class CartConfirmationView extends BaseView {

	private GetExpressCheckoutDetailsDTO details;
	private DoExpressCheckoutPaymentDTO checkDTO;
	private String messagePayment;
	private boolean paymentOK;
	private OrderFullDTO order;
	private boolean payCompleted;

	public boolean isPayCompleted() {
		return payCompleted;
	}

	public OrderFullDTO getOrder() {
		return order;
	}

	public boolean isPaymentOK() {
		return paymentOK;
	}

	public String getMessagePayment() {
		return messagePayment;
	}

	public DoExpressCheckoutPaymentDTO getCheckDTO() {
		return checkDTO;
	}

	public GetExpressCheckoutDetailsDTO getDetails() {
		return details;
	}

	public String doInit() {
		// TODO Auto-generated method stub
		PayPalWrapper wrap = null;
		paymentOK = true;
		IPaymentService servicePayment = OthalaFactory.getPaymentServiceInstance();
		try {
			wrap = PayPalUtil.getPayPalWrapper();
			details = wrap.getExpressCheckoutDetails(getQueryStringParm("token"));

			checkDTO = wrap.doExpressCheckoutPayment(details);
			int idOrder = Integer.valueOf(details.getCustom());
			try {
				List<OrderFullDTO> orders = OthalaFactory.getOrderServiceInstance().getOrders(idOrder, null, null);
				order = orders.get(0);

				if (servicePayment.isPaymentCompleted(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS())
						|| servicePayment.isPaymentPending(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS())) {

					MailConfermaDTO mail = new MailConfermaDTO();
					mail.setBasePathThumbinalsArticle(getBaseImageThumbinals());
					mail.setPathImgLogo(getLogoHomeMail());
					mail.setPathImgPayment(getBaseImagePath());
					try {
						OthalaFactory.getPaymentServiceInstance().sendMailAcceptedPyament(order, mail,
								checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS());
					} catch (MailNotSendException e) {
						log.error("errore nell'invio della mail, pagamento accettato", e);
						addError("null", OthalaUtil.getWordBundle("exception_postMailAcceptedPostPayPalException"));
					}
				} else {
					paymentOK = false;
				}
			} catch (Exception e) {
				log.error("errore nella rilettura oppure nell'update dell'ordine, chiamata paypal effettuata correttamente");
				addError(null, OthalaUtil.getWordBundle("exception_postPayPalException"));
			}

		} catch (PayPalFundingFailureException e) {
			//problemi sulla carta, gli chiediamo di scegliere un altro strumento di pagamento
			paymentOK = false;
			log.error("PayPal funding failure error code 10486", e);
			try {
				FacesContext.getCurrentInstance().getExternalContext().redirect(e.getRedirectUrl());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				log.error("errore redirect funding failure error code 10486", e);
				addError(null, OthalaUtil.getWordBundle("exception_payPalFundingFailureException"));
			}
			return null;
		} catch (PayPalPaymentRefusedException e) {
			paymentOK = false;
			addError("null", OthalaUtil.getWordBundle("exception_payPalRefused"));
			return null;
		}

		catch (Exception ex) {
			// TODO Auto-generated catch block
			paymentOK = false;
			log.error("Errore comunicazione PayPal", ex);
			addError(null, OthalaUtil.getWordBundle("exception_payPalException"));
			// return null;
		}

		if (paymentOK) {
			messagePayment = OthalaUtil.getWordBundle("catalogo_paySuccess");
		} else {
			messagePayment = OthalaUtil.getWordBundle("catalogo_payKO");
		}
		return null;
	}

}
