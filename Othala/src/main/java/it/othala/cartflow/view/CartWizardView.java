package it.othala.cartflow.view;

import it.othala.account.execption.MailNotSendException;
import it.othala.account.model.CustomerLoginBean;
import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.execption.OthalaException;
import it.othala.payment.paypal.dto.OrderPayPalDTO;
import it.othala.payment.paypal.dto.SetExpressCheckoutDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.IPaymentService;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;
import it.othala.web.utils.PayPalUtil;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.primefaces.context.RequestContext;

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
	private OrderFullDTO order = null;
	private boolean sameAddress;
	private boolean saveAddressSpe;
	private boolean saveAddressFat;
	private boolean newAddrSpe;
	private boolean newAddrFat;
	private boolean rendeRiepilogo;

	public boolean isRendeRiepilogo() {
		rendeRiepilogo = false;
		if (saveAddressFat) {
			return rendeRiepilogo;
		}
		if (saveAddressSpe) {
			return rendeRiepilogo;
		}
		if (editAddrFat && sameAddress == false && deliveryDTO.getIndirizzo().isEmpty() == false) {
			return rendeRiepilogo;
		}
		if (editAddrSpe && sameAddress == false && deliveryDTO.getIndirizzo().isEmpty() == false) {
			return rendeRiepilogo;
		}
		rendeRiepilogo = true;
		return rendeRiepilogo;
	}

	public boolean isNewAddrSpe() {
		return newAddrSpe;
	}

	public boolean isNewAddrFat() {
		return newAddrFat;
	}

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
		idAddressFat = cart.getAddressFat() != null && cart.getAddressFat().getIdAddress() == null ? 0 : cart
				.getAddressFat().getIdAddress();
		idAddressSpe = cart.getAddressSpe() != null && cart.getAddressSpe().getIdAddress() == null ? 0 : cart
				.getAddressSpe().getIdAddress();

		retrieveAddresses();

		sameAddress = false;

		cart.setCheckoutCart(true);

		// recupero l'indirizzo di fatturazione e spedizione

		if (cart.getDeliveryCost() == null) {
			cart.setDeliveryCost(deliveryDTO.getSpeseSpedizione().get(0));
			cart.setIdTypeDelivery(cart.getDeliveryCost().getIdDeliveryCost());
		}

		newAddrFat = false;
		newAddrSpe = false;

		return null;
	}

	private void retrieveAddresses() {

		deliveryDTO = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(loginBean.getEmail());

		if (idAddressFat == 0 && idAddressSpe == 0) {
			cart.getAddressFat().setNazione("Italia");
			cart.getAddressSpe().setNazione("Italia");
			if (deliveryDTO != null && deliveryDTO.getIndirizzo().isEmpty() == false) {
				idAddressFat = deliveryDTO.getIndirizzo().get(0).getIdAddress();
				idAddressSpe = idAddressFat;
				cart.setAddressFat(deliveryDTO.getIndirizzo().get(0));
				cart.setAddressSpe(cart.getAddressFat());
			}
		}

		editAddrFat = idAddressFat == 0;
		editAddrSpe = idAddressSpe == 0;

	}

	public void hideAddressFat(AjaxBehaviorEvent ev) {

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
		saveAddressFat = true;

	}

	public void modifyAddrSpe(AjaxBehaviorEvent ev) {
		editAddrSpe = true;
		saveAddressSpe = true;

	}

	public void newAddrFat(AjaxBehaviorEvent ev) {
		modifyAddrFat(ev);
		newAddrFat = true;
	}

	public void newAddrSpe(AjaxBehaviorEvent ev) {
		modifyAddrSpe(ev);
		newAddrSpe = true;
	}

	public void annAddrFat(AjaxBehaviorEvent ev) {
		newAddrFat = false;
		editAddrFat = false;
		saveAddressFat = false;
	}

	public void annAddrSpe(AjaxBehaviorEvent ev) {
		newAddrSpe = false;
		editAddrSpe = false;
		saveAddressSpe = false;
	}

	public void saveAddrFat(AjaxBehaviorEvent ev) {
		cart.getAddressFat().setUserId(loginBean.getEmail());
		if (newAddrFat) {
			// ho cliccato su nuovo
			cart.setAddressSpe(OthalaFactory.getOrderServiceInstance().newAddress(cart.getAddressSpe()));
			newAddrFat = false;
		} else {
			// modifica
			cart.setAddressFat(OthalaFactory.getOrderServiceInstance().updateAddress(cart.getAddressFat(),
					cart.getAddressFat().getIdAddress()));
		}
		retrieveAddresses();

		if (idAddressFat == idAddressSpe) {
			idAddressFat = cart.getAddressFat().getIdAddress();
			idAddressSpe = idAddressFat;

			RequestContext.getCurrentInstance().execute("$('#select-spe').val('" + idAddressSpe + "');");
			RequestContext.getCurrentInstance().execute("$('#select-fat').val('" + idAddressFat + "');");
		} else {
			idAddressFat = cart.getAddressFat().getIdAddress();
			RequestContext.getCurrentInstance().execute("$('#select-fat').val('" + idAddressFat + "');");
		}

		editAddrFat = false;
		saveAddressFat = false;

	}

	public void saveAddrSpe(AjaxBehaviorEvent ev) {
		cart.getAddressSpe().setUserId(loginBean.getEmail());

		if (newAddrSpe) {
			// ho cliccato su nuovo
			cart.setAddressSpe(OthalaFactory.getOrderServiceInstance().newAddress(cart.getAddressSpe()));
			newAddrSpe = false;
		} else {
			// ho cliccato su modifica
			cart.setAddressSpe(OthalaFactory.getOrderServiceInstance().updateAddress(cart.getAddressSpe(),
					cart.getAddressSpe().getIdAddress()));
		}

		retrieveAddresses();

		if (idAddressSpe == idAddressFat) {
			idAddressSpe = cart.getAddressSpe().getIdAddress();
			idAddressFat = idAddressSpe;

			RequestContext.getCurrentInstance().execute("$('#select-spe').val('" + idAddressSpe + "');");
			RequestContext.getCurrentInstance().execute("$('#select-fat').val('" + idAddressFat + "');");
		} else {
			idAddressSpe = cart.getAddressSpe().getIdAddress();
			RequestContext.getCurrentInstance().execute("$('#select-spe').val('" + idAddressSpe + "');");
		}

		// idAddressSpe=cart.getAddressSpe().getIdAddress();
		editAddrSpe = false;
		saveAddressSpe = false;

	}

	public void newAddr(ActionEvent ev) {
		boolean modify = false;
		if (cart.getAddressSpe().getIdAddress() == null || cart.getAddressSpe().getIdAddress() == 0) {
			// nuovo spedizione
			cart.getAddressSpe().setUserId(loginBean.getEmail());
			cart.setAddressSpe(OthalaFactory.getOrderServiceInstance().newAddress(cart.getAddressSpe()));
			modify = true;
		}
		if (isSameAddress() == false) {
			if (cart.getAddressFat().getIdAddress() == null || cart.getAddressFat().getIdAddress() == 0) {
				// nuovo fatturazione
				cart.getAddressFat().setUserId(loginBean.getEmail());
				cart.setAddressFat(OthalaFactory.getOrderServiceInstance().newAddress(cart.getAddressFat()));
				modify = true;
			}
		} else {
			cart.setAddressFat(cart.getAddressSpe());
		}
		if (modify) {
			retrieveAddresses();
		}
		idAddressSpe = cart.getAddressSpe().getIdAddress();
		idAddressFat = cart.getAddressFat().getIdAddress();
		editAddrSpe = false;
		editAddrFat = false;
		sameAddress = false;
	}

	public String updateWrapUp() {
		return null;
	}

	public void checkout(ActionEvent e) {

		try {
			try {
				insertOrder();
			} catch (Exception ex) {
				addError(null, OthalaUtil.getWordBundle("exception_base"));
				log.error("Errore inserimento ordine", ex);
				return;
			}

			// checkout paypall
			OrderPayPalDTO orderPayPal = PayPalUtil.getOrderPayPalDTO(cart, order.getIdOrder().toString(), getLang());
			ProfilePayPalDTO profile = PayPalUtil.getProfile();
			IPaymentService service = OthalaFactory.getPaymentServiceInstance();
			SetExpressCheckoutDTO checkDTO = service.setExpressCheckout(orderPayPal, profile);

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
		order.setNameUser(loginBean.getName());
		order.setSurnameUser(loginBean.getSurname());
		order.setImOrdine(cart.getTotalPriceOrder());
		order.setSpeseSpedizione(cart.getDeliveryCost());
		order = OthalaFactory.getOrderServiceInstance().insertOrder(order);

	}

}
