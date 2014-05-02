package it.othala.cartflow.view;

import it.othala.account.model.CustomerLoginBean;
import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.payment.paypal.PayPalWrapper;
import it.othala.payment.paypal.SetExpressCheckoutDTO;
import it.othala.service.factory.OthalaFactory;
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
	private int idAddressFat;
	private int idAddressSpe;
	private boolean editAddrFat;
	private boolean editAddrSpe;

	public boolean isEditAddrSpe() {
		return editAddrSpe;
	}

	public boolean isEditAddrFat() {
		return editAddrFat;
	}

	public int getIdAddressFat() {
		return idAddressFat;
	}

	public void setIdAddressFat(int idAddressFat) {
		this.idAddressFat = idAddressFat;
	}

	public int getIdAddressSpe() {
		return idAddressSpe;
	}

	public void setIdAddressSpe(int idAddressSpe) {
		this.idAddressSpe = idAddressSpe;
	}

	public void setDeliveryDTO(DeliveryDTO deliveryDTO) {
		this.deliveryDTO = deliveryDTO;
	}

	public DeliveryDTO getDeliveryDTO() {
		if (loginBean.getEmail()!=null  && deliveryDTO.getIndirizzo().isEmpty())
		{
			retrieveAddresses();
		}
		return deliveryDTO;
	}

	public String doInit() {
		// TODO Auto-generated method stub

		idAddressFat = cart.getAddressFat().getIdAddress() == null ? 0 : cart.getAddressFat().getIdAddress();
		idAddressSpe = cart.getAddressSpe().getIdAddress() == null ? 0 : cart.getAddressFat().getIdAddress();
		editAddrFat = idAddressFat == 0;
		editAddrSpe = idAddressSpe == 0;
		if (idAddressFat == 0) {
			cart.getAddressFat().setNazione("Italia");
		}
		if (idAddressSpe == 0) {
			cart.getAddressSpe().setNazione("Italia");
		}
		cart.setCheckoutCart(true);

		// recupero l'indirizzo di fatturazione e spedizione
		retrieveAddresses();

		return null;
	}

	private void retrieveAddresses() {

		deliveryDTO = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(loginBean.getEmail());
		/*
		 * deliveryDTO = new DeliveryDTO(); DeliveryAddressDTO addr = new
		 * DeliveryAddressDTO(); addr.setCap("53100");
		 * addr.setCognome("Bagnolesi"); addr.setComune("Siena");
		 * addr.setEtichetta("Casa"); addr.setIdAddress(1);
		 * addr.setNazione("IT"); addr.setNome("Simone");
		 * addr.setProvincia("SI"); addr.setVia("Via aretina 89");
		 * addr.setTel("3332965518"); deliveryDTO.getIndirizzo().add(addr);
		 * 
		 * addr = new DeliveryAddressDTO(); addr.setCap("53100");
		 * addr.setCognome("Bagnolesi"); addr.setComune("Sinea");
		 * addr.setEtichetta("Lavoro"); addr.setIdAddress(2);
		 * addr.setNazione("IT"); addr.setNome("Simone");
		 * addr.setProvincia("SI"); addr.setVia("Via Ricasoli 48");
		 * addr.setTel("0577298434"); deliveryDTO.getIndirizzo().add(addr);
		 */
		/*
		 * for (DeliveryAddressDTO addr : deliveryDTO.getIndirizzo()) { if
		 * (addr.getTypeAddress().intValue() ==
		 * TypeAddress.FATTURAZIONE.getAddress()) { cart.setAddressFat(addr); }
		 * else if (addr.getTypeAddress().intValue() ==
		 * TypeAddress.SPEDIZIONE.getAddress()) { cart.setAddressSpe(addr); } }
		 */

	}

	public void changeAddrFat(AjaxBehaviorEvent ev) {
		if (idAddressFat == 0) { // nuovo indirizzo
			editAddrFat = true;
			cart.setAddressFat(new DeliveryAddressDTO());

		} else {
			editAddrFat = false;
			for (DeliveryAddressDTO addr : deliveryDTO.getIndirizzo()) {
				if (addr.getIdAddress().intValue() == idAddressFat) {
					cart.setAddressFat(addr);
					break;
				}
			}
		}
	}

	public void changeAddrSpe(AjaxBehaviorEvent ev) {
		if (idAddressSpe == 0) { // nuovo indirizzo
			editAddrSpe = true;
			cart.setAddressSpe(new DeliveryAddressDTO());
			cart.getAddressSpe().setUserId(loginBean.getEmail());
		} else {
			editAddrSpe = false;
			for (DeliveryAddressDTO addr : deliveryDTO.getIndirizzo()) {
				if (addr.getIdAddress().intValue() == idAddressSpe) {
					cart.setAddressSpe(addr);
					break;
				}
			}
		}
	}

	public void modifyAddrFat(AjaxBehaviorEvent ev) {
		editAddrFat = true;
	}

	public void modifyAddrSpe(AjaxBehaviorEvent ev) {
		editAddrSpe = true;
	}

	public void newAddrFat(ActionEvent ev) {
		cart.getAddressFat().setUserId(loginBean.getEmail());
		if (cart.getAddressFat().getIdAddress() == null || cart.getAddressFat().getIdAddress() == 0) {
			// nuovo
			cart.setAddressFat(OthalaFactory.getOrderServiceInstance().newAddress(cart.getAddressFat()));
		} else {
			// modifica
			cart.setAddressFat(OthalaFactory.getOrderServiceInstance().updateAddress(cart.getAddressFat(),
					cart.getAddressFat().getIdAddress()));
		}
		retrieveAddresses();
		idAddressFat = cart.getAddressFat().getIdAddress();
		idAddressSpe=cart.getAddressSpe().getIdAddress();
		editAddrFat = false;
	}

	public void newAddrSpe(ActionEvent ev) {

		cart.getAddressSpe().setUserId(loginBean.getEmail());
		if (cart.getAddressSpe().getIdAddress() == null || cart.getAddressSpe().getIdAddress() == 0) {
			// nuovo
			cart.setAddressSpe(OthalaFactory.getOrderServiceInstance().newAddress(cart.getAddressSpe()));
		} else {
			// modifica
			cart.setAddressSpe(OthalaFactory.getOrderServiceInstance().updateAddress(cart.getAddressSpe(),
					cart.getAddressSpe().getIdAddress()));
		}
		retrieveAddresses();
		idAddressSpe = cart.getAddressSpe().getIdAddress();
		idAddressFat=cart.getAddressFat().getIdAddress();
		editAddrSpe = false;
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
