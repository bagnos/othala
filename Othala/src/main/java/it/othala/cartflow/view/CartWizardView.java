package it.othala.cartflow.view;

import java.io.IOException;

import it.othala.account.model.CustomerLoginBean;
import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.enums.TypeAddress;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.SetExpressCheckoutDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

@Named
@ViewScoped
public class CartWizardView extends BaseView {

	@Inject
	private CartFlowBean cart;

	@Inject
	private CustomerLoginBean loginBean;

	public String doInit() {
		// TODO Auto-generated method stub
		cart.setCheckoutCart(true);

		// recupero l'indirizzo di fatturazione e spedizione
		retrieveAddresses();

		return null;
	}

	private void retrieveAddresses() {
		if (cart.getAddressFat().getUserId() == null && cart.getAddressSpe().getUserId() == null) {
			DeliveryDTO deliveryDTO = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(loginBean.getEmail());
			for (DeliveryAddressDTO addr : deliveryDTO.getIndirizzo()) {
				if (addr.getTypeAddress().intValue() == TypeAddress.FATTURAZIONE.getAddress()) {
					cart.setAddressFat(addr);
				} else if (addr.getTypeAddress().intValue() == TypeAddress.SPEDIZIONE.getAddress()) {
					cart.setAddressSpe(addr);
				}
			}
		}
	}

	public String updateWrapUp() {
		return null;
	}

	public void checkout(ActionEvent e) {
		PayPalWrapper pBd;
		try {
			pBd = new PayPalWrapper();
			SetExpressCheckoutDTO checkDTO = pBd.setExpressCheckout(cart,getLang());
			if (checkDTO.getToken() != null) {
				// return null;
				FacesContext.getCurrentInstance().getExternalContext().redirect(checkDTO.getRedirectUrl());
				
			} else {
				addError(null, OthalaUtil.getWordBundle("exception_payPalCredentialException"));
				log.error(String.format("Paypal, SetExpressCheckout in errore:%s",checkDTO.getKoMessage()));
				// return null;
			}
		} catch (IOException ex) {
			// TODO Auto-generated catch block
			log.error("Errore autenticazione PayPal", ex);
			addError(null, OthalaUtil.getWordBundle("exception_payPalCredentialException"));
			// return null;
		}

	}

}
