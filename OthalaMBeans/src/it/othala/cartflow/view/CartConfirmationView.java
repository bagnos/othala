package it.othala.cartflow.view;

import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.execption.StockNotPresentException;
import it.othala.payment.paypal.dto.DoExpressCheckoutPaymentDTO;
import it.othala.payment.paypal.dto.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalPostPaymentException;
import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.IPaymentService;
import it.othala.view.BaseView;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.OthalaUtil;
import it.othala.web.utils.PayPalUtil;

import java.io.IOException;
import java.math.BigDecimal;

import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

import org.primefaces.context.RequestContext;

/*@Named
@ViewScoped*/
@ManagedBean
@javax.faces.bean.ViewScoped
public class CartConfirmationView extends BaseView {

	private GetExpressCheckoutDetailsDTO details;

	private String messagePayment;
	private boolean paymentOK;
	private OrderFullDTO order;
	private boolean payCompleted;
	private BigDecimal sconto;



	public BigDecimal getSconto() {
		return sconto;
	}

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
		try {
			IPaymentService servicePayment = OthalaFactory.getPaymentServiceInstance();
			paymentOK = false;
			sconto=null;

			IPaymentService service = OthalaFactory.getPaymentServiceInstance();
			ProfilePayPalDTO profile = PayPalUtil.getProfile(getRequest());

			if (!getExpressCheckoutDetails(service, profile)) {
				return null;
			}
			

			doExpressCheckoutPayment(servicePayment, profile);

		} catch (Throwable ex) {
			log.error("Errore comunicazione PayPal", ex);
			addError(null, OthalaUtil.getWordBundle("exception_doCheckOutPaPalException"));
		}

		return null;
	}

	private void sendMailAcceptedPayment(String paymentStatus, IPaymentService servicePayment) {
		MailPropertiesDTO mail = ConfigurationUtil.getMailProps(getRequest());
		try {
			OthalaFactory.getPaymentServiceInstance().sendMailAcceptedPyament(order, mail, paymentStatus);
			if (servicePayment.isPaymentPending(paymentStatus)) {
				addInfo(null, OthalaUtil.getWordBundle("catalogo_payPending"));
			} else {
				addInfo(null, OthalaUtil.getWordBundle("catalogo_paySuccess"));
			}

		} catch (Exception e) {
			log.error("errore nell'invio della mail, pagamento accettato", e);
			addError(null, OthalaUtil.getWordBundle("exception_postMailAcceptedPostPayPalException"));
		}
	}

	private boolean getExpressCheckoutDetails(IPaymentService service, ProfilePayPalDTO profile) {
		boolean esito = false;
		try {
			String token=getQueryStringParm("token");
			
			details = service.getExpressCheckoutDetails(token, profile);
			sconto=details.getDiscount();
			
			esito = true;
		} catch (PayPalFailureException ex) {
			addOthalaExceptionError(ex, "PayPal failure Response nel getExpressCheckoutDetails");
			return false;
		} catch (PayPalException ex) {
			addOthalaExceptionError(ex, "PayPal communication error in getExpressCheckoutDetails ");
			return false;
		}
		int idOrder = Integer.valueOf(details.getCustom());
		order = OthalaFactory.getOrderServiceInstance().getOrders(idOrder, null, TypeStateOrder.INSERITO)
				.get(0);
		return esito;

	}

	private void doExpressCheckoutPayment(IPaymentService servicePayment, ProfilePayPalDTO profile) {
		try {
			DoExpressCheckoutPaymentDTO checkDTO = servicePayment.doExpressCheckoutPayment(details, profile, order);
			
			paymentOK = true;
			try {

				if (servicePayment.isPaymentCompleted(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS())
						|| servicePayment.isPaymentPending(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS())) {

					// si svuota il carrello
					try {
						if (getCartFlowBean() != null) {
							deleteCart(getCartFlowBean());
						}
						RequestContext.getCurrentInstance().execute("clearCart();");
					} catch (Throwable e) {
						log.error("errore nella pulizia del carrello", e);
					}

					// invio mail al cliente
					sendMailAcceptedPayment(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS(), servicePayment);

				} else {
					addError(null, OthalaUtil.getWordBundle("catalogo_payKO", new Object[] { order.getTxStato() }));
				}

			} catch (Exception e) {
				log.error("errore nella rilettura oppure nell'update dell'ordine, chiamata paypal effettuata correttamente");
				addError(null,
						OthalaUtil.getWordBundle("exception_postPayPalException", new Object[] { order.getIdOrder() }));
			}

		} catch (PayPalPostPaymentException e) {
			addOthalaExceptionError(e, "errore dopo il pagamento");			
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

		} catch (StockNotPresentException e) {
			addOthalaExceptionError(e, "qta non più presente");
		} catch (PayPalFailureException ex) {
			addOthalaExceptionError(ex, "PayPal failure Response nel SetCheckOutPayment");

		} catch (PayPalException ex) {
			addOthalaExceptionError(ex, "PayPal communication error");
		}

	}
}
