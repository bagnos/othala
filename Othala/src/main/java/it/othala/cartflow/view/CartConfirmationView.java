package it.othala.cartflow.view;

import it.othala.account.execption.MailNotSendException;
import it.othala.account.view.MyAccountView;
import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.StockNotPresentException;
import it.othala.payment.paypal.dto.DoExpressCheckoutPaymentDTO;
import it.othala.payment.paypal.dto.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalPaymentRefusedException;
import it.othala.payment.paypal.exception.PayPalPostPaymentException;
import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.IPaymentService;
import it.othala.view.BaseView;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.OthalaUtil;
import it.othala.web.utils.PayPalUtil;
import it.othala.web.utils.WizardUtil;

import java.io.IOException;
import java.util.List;

import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.primefaces.context.RequestContext;

@Named
@ViewScoped
public class CartConfirmationView extends BaseView {

	private GetExpressCheckoutDetailsDTO details;

	private String messagePayment;
	private boolean paymentOK;
	private OrderFullDTO order;
	private boolean payCompleted;

	@Inject
	private CartFlowBean cart;

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

	public GetExpressCheckoutDetailsDTO getDetails() {
		return details;
	}

	public String doInit() {

		IPaymentService servicePayment = OthalaFactory.getPaymentServiceInstance();
		paymentOK = false;
		try {
			IPaymentService service = OthalaFactory.getPaymentServiceInstance();
			ProfilePayPalDTO profile = PayPalUtil.getProfile();

			details = service.getExpressCheckoutDetails(getQueryStringParm("token"), profile);
			int idOrder = Integer.valueOf(details.getCustom());

			order = OthalaFactory.getOrderServiceInstance()
					.getOrders(idOrder, null, TypeStateOrder.INSERITO.getState()).get(0);

			// confirm e docheckOut
			// OrderFullDTO order=
			// OthalaFactory.getOrderServiceInstance().confirmOrderPayment(profile,
			// idOrder, details);
			DoExpressCheckoutPaymentDTO checkDTO = servicePayment.doExpressCheckoutPayment(details, profile, order);
			paymentOK = true;
			try {

				if (servicePayment.isPaymentCompleted(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS())
						|| servicePayment.isPaymentPending(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS())) {

					// si svuota il carrello
					try {
						if (cart != null) {
							deleteCart(cart);
						}
						RequestContext.getCurrentInstance().execute("clearCart();");
					} catch (Throwable e) {
						log.error("errore nella pulizia del carrello", e);
					}

					MailPropertiesDTO mail = ConfigurationUtil.getMailProps();
					try {
						OthalaFactory.getPaymentServiceInstance().sendMailAcceptedPyament(order, mail,
								checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS());
						if (servicePayment.isPaymentPending(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS())) {
							addInfo(null, OthalaUtil.getWordBundle("catalogo_payPending"));
						} else {
							addInfo(null, OthalaUtil.getWordBundle("catalogo_paySuccess"));
						}

					} catch (Exception e) {
						log.error("errore nell'invio della mail, pagamento accettato", e);
						addError(null, OthalaUtil.getWordBundle("exception_postMailAcceptedPostPayPalException"));
					}
				} else {
					addError(null, OthalaUtil.getWordBundle("catalogo_payKO", new Object[] { order.getTxStato() }));
				}

			} catch (Exception e) {
				log.error("errore nella rilettura oppure nell'update dell'ordine, chiamata paypal effettuata correttamente");
				addError(null, OthalaUtil.getWordBundle("exception_postPayPalException", new Object[] { idOrder }));
			}

		} catch (PayPalPostPaymentException e) {
			addGenericError(e, "errore dopo il pagamento");
		} catch (PayPalFundingFailureException e) {
			// problemi sulla carta, gli chiediamo di scegliere un altro
			// strumento di pagamento

			log.error("PayPal funding failure error code 10486", e);
			try {
				FacesContext.getCurrentInstance().getExternalContext().redirect(e.getRedirectUrl());
			} catch (IOException e1) {
				log.error("errore redirect funding failure error code 10486", e);
				addError(null, OthalaUtil.getWordBundle("exception_payPalFundingFailureException"));
			}
			return null;
		} catch (StockNotPresentException e) {
			addOthalaExceptionError(e, "qta non più presente");
		} catch (Exception ex) {
			log.error("Errore comunicazione PayPal", ex);
			addError(null, OthalaUtil.getWordBundle("exception_doCheckOutPaPalException"));
		}

		return null;
	}
}
