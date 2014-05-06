package it.othala.cartflow.view;

import java.math.BigDecimal;

import it.othala.account.execption.MailNotSendException;
import it.othala.account.model.CustomerLoginBean;
import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.execption.OthalaException;
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

	public CartFlowBean getCart() {
		return cart;
	}

	@Inject
	private CustomerLoginBean loginBean;

	private DeliveryDTO deliveryDTO;
	private int idAddressFat;
	private int idAddressSpe;
	private boolean editAddrFat;
	private boolean editAddrSpe;
	private OrderFullDTO order;
	private boolean sameAddress;
	private boolean saveAddressSpe;
	private boolean saveAddressFat;

	

	public boolean isSaveAddressFat() {
		return saveAddressFat;
	}

	public boolean isSaveAddressSpe() {
		return saveAddressSpe;
	}

	public boolean isSameAddress() {
		return sameAddress;
	}

	public void setSameAddress(boolean sameAddress) {
		this.sameAddress = sameAddress;
	}

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
		if (loginBean.getEmail() != null && deliveryDTO.getIndirizzo().isEmpty()) {
			retrieveAddresses();
		}
		return deliveryDTO;
	}

	public String doInit() {
		// TODO Auto-generated method stub

		idAddressFat = cart.getAddressFat()!=null && cart.getAddressFat().getIdAddress() == null ? 0 : cart.getAddressFat().getIdAddress();
		idAddressSpe = cart.getAddressSpe()!=null && cart.getAddressSpe().getIdAddress() == null ? 0 : cart.getAddressSpe().getIdAddress();
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

		if (cart.getDeliveryCost() == null) {
			cart.setDeliveryCost(deliveryDTO.getSpeseSpedizione().get(0));
			cart.setIdTypeDelivery(cart.getDeliveryCost().getIdDeliveryCost());
		}

		return null;
	}


	private void retrieveAddresses() {

		deliveryDTO = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(loginBean.getEmail());

	}

	public void modifyTypeDelivery(AjaxBehaviorEvent ev) {
		for (DeliveryCostDTO d : deliveryDTO.getSpeseSpedizione()) {
			if (d.getIdDeliveryCost().intValue() == cart.getIdTypeDelivery()) {
				cart.setDeliveryCost(d);
				break;
			}
		}
	}

	public void changeAddrFat(AjaxBehaviorEvent ev) {
		if (idAddressFat == 0) { // nuovo indirizzo
			editAddrFat = true;
			cart.setAddressFat(new DeliveryAddressDTO());
			cart.getAddressFat().setUserId(loginBean.getEmail());

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
		saveAddressFat=true;
	}

	public void modifyAddrSpe(AjaxBehaviorEvent ev) {
		editAddrSpe = true;
		saveAddressSpe=true;
	}

	public void newAddrFat(AjaxBehaviorEvent ev) {
		cart.getAddressFat().setUserId(loginBean.getEmail());
		// modifica
		cart.setAddressFat(OthalaFactory.getOrderServiceInstance().updateAddress(cart.getAddressFat(),
				cart.getAddressFat().getIdAddress()));

		retrieveAddresses();
		idAddressFat = cart.getAddressFat().getIdAddress();
		// idAddressSpe=cart.getAddressSpe().getIdAddress();
		editAddrFat = false;
		saveAddressFat=false;
		
	}
	
	public void newAddrSpe(AjaxBehaviorEvent ev) {
		cart.getAddressSpe().setUserId(loginBean.getEmail());
		// modifica
		cart.setAddressSpe(OthalaFactory.getOrderServiceInstance().updateAddress(cart.getAddressSpe(),
				cart.getAddressSpe().getIdAddress()));

		retrieveAddresses();
		idAddressSpe = cart.getAddressSpe().getIdAddress();
		// idAddressSpe=cart.getAddressSpe().getIdAddress();
		editAddrSpe = false;
		saveAddressSpe=false;
		
	}

	

	public void newAddr(ActionEvent ev) {

		
		if (cart.getAddressSpe().getIdAddress() == null || cart.getAddressSpe().getIdAddress() == 0) {
			// nuovo spedizione
			cart.getAddressSpe().setUserId(loginBean.getEmail());
			cart.setAddressSpe(OthalaFactory.getOrderServiceInstance().newAddress(cart.getAddressSpe()));
		}
		if (isSameAddress() == false) {
			if (cart.getAddressFat().getIdAddress() == null || cart.getAddressFat().getIdAddress() == 0) {
				// nuovo fatturazione
				cart.getAddressFat().setUserId(loginBean.getEmail());
				cart.setAddressFat(OthalaFactory.getOrderServiceInstance().newAddress(cart.getAddressFat()));
			}
		}
		else
		{
			cart.setAddressFat(cart.getAddressSpe());	
		}

		retrieveAddresses();
		idAddressSpe = cart.getAddressSpe().getIdAddress();
		idAddressFat = cart.getAddressFat().getIdAddress();
		editAddrSpe=false;
		editAddrFat=false;

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

	private void insertOrder() throws MailNotSendException, OthalaException {
		order = new OrderFullDTO();
		order.setBillingAddress(cart.getAddressFat());
		order.setShippingAddress(cart.getAddressSpe());
		order.setCart(cart.getCart());
		order.setIdUser(loginBean.getEmail());

		order = OthalaFactory.getOrderServiceInstance().insertOrder(order);

	}

}
