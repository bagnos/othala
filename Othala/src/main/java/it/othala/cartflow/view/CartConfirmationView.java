package it.othala.cartflow.view;

import it.othala.account.model.CustomerLoginBean;
import it.othala.cartflow.model.CartFlowBean;
import it.othala.payment.paypal.DoExpressCheckoutPaymentDTO;
import it.othala.payment.paypal.GetExpressCheckoutDetailsDTO;
import it.othala.payment.paypal.PayPalFundingFailureException;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import java.io.IOException;

import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

@Named
@ViewScoped
public class CartConfirmationView extends BaseView {

	
	private GetExpressCheckoutDetailsDTO details;
	private DoExpressCheckoutPaymentDTO checkDTO;

	public DoExpressCheckoutPaymentDTO getCheckDTO() {
		return checkDTO;
	}

	public GetExpressCheckoutDetailsDTO getDetails() {
		return details;
	}

	public String doInit() {
		// TODO Auto-generated method stub
		PayPalWrapper wrap = null;
		try {
			wrap = new PayPalWrapper();		
			details = wrap.getExpressCheckoutDetails(getQueryStringParm("token"));
			checkDTO=wrap.doExpressCheckoutPayment(details);
		} 
		catch (PayPalFundingFailureException e)
		{
			log.error("PayPal funding failure error code 10486", e);
			try {
				FacesContext.getCurrentInstance().getExternalContext().redirect(e.getRedirectUrl());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				log.error("errore redirect funding failure error code 10486", e);
				addError(null, OthalaUtil.getWordBundle("exception_payPalFundingFailureException"));
			}
			return null;
		}
		catch (Exception ex) {
			// TODO Auto-generated catch block
			log.error("Errore comunicazione PayPal", ex);
			addError(null, OthalaUtil.getWordBundle("exception_payPalException"));
			// return null;
		}
		return null;
	}

}
