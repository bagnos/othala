package it.othala.cartflow.view;

import java.util.List;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.NazioniDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.execption.OthalaException;
import it.othala.execption.StockNotPresentException;
import it.othala.payment.paypal.dto.SetExpressCheckoutDTO;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.IPaymentService;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;
import it.othala.web.utils.PayPalUtil;
import it.othala.web.utils.WizardUtil;

import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;

import org.primefaces.context.RequestContext;

@ManagedBean
@javax.faces.bean.ViewScoped
public class CartWizardView extends BaseView {

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
		if (getLoginBean().getEmail() != null && deliveryDTO.getIndirizzo().isEmpty()) {
			retrieveAddresses();
		}
		return deliveryDTO;
	}

	public String doInit() {
		// TODO Auto-generated method stub
		idAddressFat = getCartFlowBean().getAddressFat() != null
				&& getCartFlowBean().getAddressFat().getIdAddress() == null ? 0 : getCartFlowBean().getAddressFat()
				.getIdAddress();
		idAddressSpe = getCartFlowBean().getAddressSpe() != null
				&& getCartFlowBean().getAddressSpe().getIdAddress() == null ? 0 : getCartFlowBean().getAddressSpe()
				.getIdAddress();

		retrieveAddresses();

		sameAddress = false;

		getCartFlowBean().setCheckoutCart(true);

		// recupero l'indirizzo di fatturazione e spedizione

		getCartFlowBean().setDeliveryCost(deliveryDTO.getSpeseSpedizione().get(0));
		getCartFlowBean().setIdTypeDelivery(deliveryDTO.getSpeseSpedizione().get(0).getIdDeliveryCost());

		newAddrFat = false;
		newAddrSpe = false;

		getCartFlowBean().setNazioni(getBeanApplication().getDomain().getNazioni());

		return null;
	}

	private void retrieveAddresses() {

		deliveryDTO = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(getLoginBean().getEmail());

		if (idAddressFat == 0 && idAddressSpe == 0) {
			getCartFlowBean().getAddressFat().setNazione("ITALIA");
			getCartFlowBean().getAddressSpe().setNazione("ITALIA");
			if (deliveryDTO != null && deliveryDTO.getIndirizzo().isEmpty() == false) {
				idAddressFat = deliveryDTO.getIndirizzo().get(0).getIdAddress();
				idAddressSpe = idAddressFat;
				getCartFlowBean().setAddressFat(deliveryDTO.getIndirizzo().get(0));
				getCartFlowBean().setAddressSpe(getCartFlowBean().getAddressFat());
			}
		}

		editAddrFat = idAddressFat == 0;
		editAddrSpe = idAddressSpe == 0;

		deliveryDTO.setSpeseSpedizione(OthalaFactory.getOrderServiceInstance().getSpeseSpedizione(
				getCartFlowBean().getAddressSpe().getNazione()));

		getCartFlowBean().setDeliveryCost(deliveryDTO.getSpeseSpedizione().get(0));
		getCartFlowBean().setIdTypeDelivery(deliveryDTO.getSpeseSpedizione().get(0).getIdDeliveryCost());

	}

	public void hideAddressFat(AjaxBehaviorEvent ev) {

	}

	public void modifyTypeDelivery(AjaxBehaviorEvent ev) {

		for (DeliveryCostDTO d : deliveryDTO.getSpeseSpedizione()) {
			if (d.getIdDeliveryCost().intValue() == getCartFlowBean().getIdTypeDelivery()) {
				getCartFlowBean().setDeliveryCost(d);
				break;
			}
		}
	}

	public void changeAddrFat(AjaxBehaviorEvent ev) {
		if (idAddressFat == 0) { // nuovo indirizzo
			editAddrFat = true;
			getCartFlowBean().setAddressFat(new DeliveryAddressDTO());
			getCartFlowBean().getAddressFat().setUserId(getLoginBean().getEmail());

		} else {
			editAddrFat = false;
			for (DeliveryAddressDTO addr : deliveryDTO.getIndirizzo()) {
				if (addr.getIdAddress().intValue() == idAddressFat) {
					getCartFlowBean().setAddressFat(addr);
					break;
				}
			}
		}
	}

	public void changeAddrSpe(AjaxBehaviorEvent ev) {
		if (idAddressSpe == 0) { // nuovo indirizzo
			editAddrSpe = true;
			getCartFlowBean().setAddressSpe(new DeliveryAddressDTO());
			getCartFlowBean().getAddressSpe().setUserId(getLoginBean().getEmail());

		} else {
			editAddrSpe = false;
			for (DeliveryAddressDTO addr : deliveryDTO.getIndirizzo()) {
				if (addr.getIdAddress().intValue() == idAddressSpe) {
					getCartFlowBean().setAddressSpe(addr);
					break;
				}
			}

		}

		deliveryDTO.setSpeseSpedizione(OthalaFactory.getOrderServiceInstance().getSpeseSpedizione(
				getCartFlowBean().getAddressSpe().getNazione()));
		getCartFlowBean().setDeliveryCost(deliveryDTO.getSpeseSpedizione().get(0));
		getCartFlowBean().setIdTypeDelivery(deliveryDTO.getSpeseSpedizione().get(0).getIdDeliveryCost());

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
		try {
			getCartFlowBean().getAddressFat().setUserId(getLoginBean().getEmail());
			if (newAddrFat) {
				// ho cliccato su nuovo
				getCartFlowBean().setAddressSpe(
						OthalaFactory.getOrderServiceInstance().newAddress(getCartFlowBean().getAddressSpe()));
				newAddrFat = false;
			} else {
				// modifica
				getCartFlowBean().setAddressFat(
						OthalaFactory.getOrderServiceInstance().updateAddress(getCartFlowBean().getAddressFat(),
								getCartFlowBean().getAddressFat().getIdAddress()));
			}
			retrieveAddresses();

			if (idAddressFat == idAddressSpe) {
				idAddressFat = getCartFlowBean().getAddressFat().getIdAddress();
				idAddressSpe = idAddressFat;

				RequestContext.getCurrentInstance().execute("$('#select-spe').val('" + idAddressSpe + "');");
				RequestContext.getCurrentInstance().execute("$('#select-fat').val('" + idAddressFat + "');");
			} else {
				idAddressFat = getCartFlowBean().getAddressFat().getIdAddress();
				RequestContext.getCurrentInstance().execute("$('#select-fat').val('" + idAddressFat + "');");
			}

			editAddrFat = false;
			saveAddressFat = false;
		} catch (Exception e) {
			addGenericError(e, "errore nell'inserimento dell'indirizzo");
		}

	}

	public void saveAddrSpe(AjaxBehaviorEvent ev) {
		try {
			getCartFlowBean().getAddressSpe().setUserId(getLoginBean().getEmail());

			if (newAddrSpe) {
				// ho cliccato su nuovo
				getCartFlowBean().setAddressSpe(
						OthalaFactory.getOrderServiceInstance().newAddress(getCartFlowBean().getAddressSpe()));

				newAddrSpe = false;
			} else {
				// ho cliccato su modifica
				getCartFlowBean().setAddressSpe(
						OthalaFactory.getOrderServiceInstance().updateAddress(getCartFlowBean().getAddressSpe(),
								getCartFlowBean().getAddressSpe().getIdAddress()));

			}

			retrieveAddresses();

			if (idAddressSpe == idAddressFat) {
				idAddressSpe = getCartFlowBean().getAddressSpe().getIdAddress();
				idAddressFat = idAddressSpe;

				RequestContext.getCurrentInstance().execute("$('#select-spe').val('" + idAddressSpe + "');");
				RequestContext.getCurrentInstance().execute("$('#select-fat').val('" + idAddressFat + "');");
			} else {
				idAddressSpe = getCartFlowBean().getAddressSpe().getIdAddress();
				RequestContext.getCurrentInstance().execute("$('#select-spe').val('" + idAddressSpe + "');");
			}

			// idAddressSpe=getCartFlowBean().getAddressSpe().getIdAddress();
			editAddrSpe = false;
			saveAddressSpe = false;
		} catch (Exception e) {
			addGenericError(e, "errore nell'inserimento dell'indirizzo");
		}

	}

	public void verifyDiscount(ActionEvent ev) {
		if (getCartFlowBean().getCoupon() != null && !getCartFlowBean().getCoupon().isEmpty()
				&& getCartFlowBean().getFidelityCard() != null && !getCartFlowBean().getFidelityCard().isEmpty()) {
			addError(OthalaUtil.getWordBundle("catalogo_discounted"),
					OthalaUtil.getWordBundle("catalogo_discount_error"));
		}

		// mettere chiamata a verifica carta e coupon
		RequestContext.getCurrentInstance().execute(WizardUtil.NextStepWizard());
	}

	public void newAddr(ActionEvent ev) {
		try {
			boolean modify = false;
			if (getCartFlowBean().getAddressSpe().getIdAddress() == null
					|| getCartFlowBean().getAddressSpe().getIdAddress() == 0) {
				// nuovo spedizione
				getCartFlowBean().getAddressSpe().setUserId(getLoginBean().getEmail());
				getCartFlowBean().setAddressSpe(
						OthalaFactory.getOrderServiceInstance().newAddress(getCartFlowBean().getAddressSpe()));
				modify = true;
			}
			if (isSameAddress() == false) {
				if (getCartFlowBean().getAddressFat().getIdAddress() == null
						|| getCartFlowBean().getAddressFat().getIdAddress() == 0) {
					// nuovo fatturazione
					getCartFlowBean().getAddressFat().setUserId(getLoginBean().getEmail());
					getCartFlowBean().setAddressFat(
							OthalaFactory.getOrderServiceInstance().newAddress(getCartFlowBean().getAddressFat()));
					modify = true;
				}
			} else {
				getCartFlowBean().setAddressFat(getCartFlowBean().getAddressSpe());
			}
			if (modify) {
				retrieveAddresses();
			}
			idAddressSpe = getCartFlowBean().getAddressSpe().getIdAddress();
			idAddressFat = getCartFlowBean().getAddressFat().getIdAddress();
			editAddrSpe = false;
			editAddrFat = false;
			sameAddress = false;
			RequestContext.getCurrentInstance().execute(WizardUtil.NextStepWizard());
		} catch (Exception e) {
			addGenericError(e, "errore nell'inserimento dell'indirizzo");
		}
	}

	public String updateWrapUp() {
		return null;
	}

	public void checkout(ActionEvent e) {

		try {
			// checkout paypall
			ProfilePayPalDTO profile = PayPalUtil.getProfile(getRequest());
			IPaymentService service = OthalaFactory.getPaymentServiceInstance();

			// effettuo il setExpressCheckout
			SetExpressCheckoutDTO checkDTO = service.setExpressCheckout(valueOrderOf(), profile);

			if (checkDTO != null && checkDTO.getToken() != null) {
				// return null;
				FacesContext.getCurrentInstance().getExternalContext().redirect(checkDTO.getRedirectUrl());

			} else {
				addError(null, OthalaUtil.getWordBundle("exception_payPalException"));
				log.error(String.format("Paypal, SetExpressCheckout in errore:%s",
						checkDTO != null ? checkDTO.getKoMessage() : "errore generico nella cominicazione con paypal"));
			}
		} catch (PayPalFailureException ex) {
			addOthalaExceptionError(ex, "PayPal failure Response nel SetCheckOutPayment");

		} catch (PayPalException ex) {
			addOthalaExceptionError(ex, "PayPal communication error");

		} catch (StockNotPresentException ex) {
			addOthalaExceptionError(ex, "qta non più presente");
		}

		catch (Throwable ex) {
			// TODO Auto-generated catch block

			log.error("Errore generico", ex);

			addError(null, OthalaUtil.getWordBundle("exception_base"));

			// return null;
		}
		RequestContext.getCurrentInstance().execute("lastPage();PF('blockAll').unblock();");
	}

	private OrderFullDTO valueOrderOf() throws MailNotSendException, OthalaException {
		order = new OrderFullDTO();
		order.setBillingAddress(getCartFlowBean().getAddressFat());
		order.setShippingAddress(getCartFlowBean().getAddressSpe());
		order.setCart(getCartFlowBean().getCart());
		order.setIdUser(getLoginBean().getEmail());
		order.setNameUser(getLoginBean().getName());
		order.setSurnameUser(getLoginBean().getSurname());
		order.setImOrdine(getCartFlowBean().getTotalPriceOrder());
		order.setSpeseSpedizione(getCartFlowBean().getDeliveryCost());
		return order;

	}

}
