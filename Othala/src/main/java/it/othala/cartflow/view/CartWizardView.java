package it.othala.cartflow.view;

import it.othala.account.model.CustomerLoginBean;
import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.SetExpressCheckoutDTO;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

@Named
@ViewScoped
public class CartWizardView extends BaseView {

	@Inject
	private CartFlowBean cart;

	@Inject
	private CustomerLoginBean loginBean;

	private DeliveryDTO deliveryDTO;
	private int addressFat;
	private int addressSpe;

	public int getAddressFat() {
		return addressFat;
	}

	public void setAddressFat(int addressFat) {
		this.addressFat = addressFat;
	}

	public int getAddressSpe() {
		return addressSpe;
	}

	public void setAddressSpe(int addressSpe) {
		this.addressSpe = addressSpe;
	}

	public DeliveryDTO getDeliveryDTO() {
		return deliveryDTO;
	}

	public String doInit() {
		// TODO Auto-generated method stub
		cart.setCheckoutCart(true);

		// recupero l'indirizzo di fatturazione e spedizione
		retrieveAddresses();

		return null;
	}

	private void retrieveAddresses() {

		// deliveryDTO =
		// OthalaFactory.getOrderServiceInstance().getDeliveryInfo(loginBean.getEmail());
		deliveryDTO = new DeliveryDTO();
		DeliveryAddressDTO addr = new DeliveryAddressDTO();
		addr.setCap("54100");
		addr.setCognome("1");
		addr.setComune("2");
		addr.setEtichetta("casa");
		addr.setIdAddress(1);
		addr.setNazione("IT");
		addr.setNome("2");
		addr.setProvincia("FI");
		addr.setVia("via del cazzo");
		deliveryDTO.getIndirizzo().add(addr);

		addr = new DeliveryAddressDTO();
		addr.setCap("54100");
		addr.setCognome("1");
		addr.setComune("2");
		addr.setEtichetta("lavoro");
		addr.setIdAddress(2);
		addr.setNazione("IT");
		addr.setNome("2");
		addr.setProvincia("FI");
		addr.setVia("via del cazzo");
		deliveryDTO.getIndirizzo().add(addr);
		/*
		 * for (DeliveryAddressDTO addr : deliveryDTO.getIndirizzo()) { if
		 * (addr.getTypeAddress().intValue() ==
		 * TypeAddress.FATTURAZIONE.getAddress()) { cart.setAddressFat(addr); }
		 * else if (addr.getTypeAddress().intValue() ==
		 * TypeAddress.SPEDIZIONE.getAddress()) { cart.setAddressSpe(addr); } }
		 */

	}

	public void changeAddrFat(AjaxBehaviorEvent ev) {
		if (addressFat == 0) {

		} else {

		}
	}

	public String updateWrapUp() {
		return null;
	}

	public void checkout(ActionEvent e) {
		PayPalWrapper pBd;
		try {
			pBd = new PayPalWrapper();

			// creazione ordine
			OrderFullDTO order = new OrderFullDTO();
			order.setIdOrder(122345);

			// checkout paypall
			SetExpressCheckoutDTO checkDTO = pBd.setExpressCheckout(cart, getLang(), order.getIdOrder().toString());
			if (checkDTO != null && checkDTO.getToken() != null) {
				// return null;
				FacesContext.getCurrentInstance().getExternalContext().redirect(checkDTO.getRedirectUrl());

			} else {
				addError(null, OthalaUtil.getWordBundle("exception_payPalException"));
				log.error(String.format("Paypal, SetExpressCheckout in errore:%s",
						checkDTO != null ? checkDTO.getKoMessage() : "errore generico nella cominicazione con paypal"));
				// return null;
			}
		} catch (Exception ex) {
			// TODO Auto-generated catch block
			log.error("Errore comunicazione PayPal", ex);
			addError(null, OthalaUtil.getWordBundle("exception_payPalException"));
			// return null;
		}

	}

}
