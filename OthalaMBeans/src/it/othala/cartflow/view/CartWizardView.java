package it.othala.cartflow.view;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import it.othala.account.execption.MailNotSendException;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.NazioniDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.execption.FidelityCardNotPresentException;
import it.othala.execption.FidelityCardNotValidException;
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

import com.sun.faces.taglib.jsf_core.IdTagParserImpl;

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
	private boolean blockInsAddrDelivery;
	private final int ID_ADDRESS_MERCHANT = 9999;
	private boolean addressMerchant;
	private List<DeliveryAddressDTO> delAdress = new ArrayList<DeliveryAddressDTO>();
	private List<DeliveryCostDTO> listDeliveryCostDTO = null;
	private DeliveryAddressDTO deliverAddressMerchant;
	private DeliveryCostDTO deliverCostMerchant;
	private List<DeliveryAddressDTO> delAdressFat = new ArrayList<DeliveryAddressDTO>();
	private boolean andAddrSpe = false;
	private DeliveryAddressDTO deliverCurrenteAddressMerchant = new DeliveryAddressDTO();

	private BigDecimal importoScontabile;

	public DeliveryAddressDTO getDeliverCurrenteAddressMerchant() {
		return deliverCurrenteAddressMerchant;
	}

	public boolean isAndAddrSpe() {
		return andAddrSpe;
	}

	public List<DeliveryAddressDTO> getDelAdressFat() {
		return delAdressFat;
	}

	public List<DeliveryCostDTO> getListDeliveryCostDTO() {
		return listDeliveryCostDTO;
	}

	public boolean isAddressMerchant() {
		return addressMerchant;
	}

	public boolean isBlockInsAddrDelivery() {
		return blockInsAddrDelivery;
	}

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
		/*
		 * if (getLoginBean().getEmail() != null &&
		 * deliveryDTO.getIndirizzo().isEmpty()) { retrieveAddresses(); }
		 */
		return deliveryDTO;
	}

	public String doInit() {
		// TODO Auto-generated method stub
		blockInsAddrDelivery = false;
		newAddrFat = false;
		newAddrSpe = false;
		andAddrSpe = false;

		idAddressFat = getCartFlowBean().getAddressFat() != null
				&& getCartFlowBean().getAddressFat().getIdAddress() == null ? 0 : getCartFlowBean().getAddressFat()
				.getIdAddress();
		idAddressSpe = getCartFlowBean().getAddressSpe() != null
				&& getCartFlowBean().getAddressSpe().getIdAddress() == null ? 0 : getCartFlowBean().getAddressSpe()
				.getIdAddress();

		if (getLoginBean().getEmail() != null) {

			retrieveAddresses();
		}

		sameAddress = false;

		getCartFlowBean().setCheckoutCart(true);

		// recupero l'indirizzo di fatturazione e spedizione

		getCartFlowBean().setNazioni(getBeanApplication().getDomain().getNazioni());

		return null;
	}

	private boolean equalsAddrMerchant(DeliveryAddressDTO del) {
		return (del.getCognome().equalsIgnoreCase(deliverAddressMerchant.getCognome()) && del.getNome()
				.equalsIgnoreCase(deliverAddressMerchant.getNome()));
	}

	private boolean equalsAddrSede(DeliveryAddressDTO del, DeliveryCostDTO d) {
		return (del.getCap().equalsIgnoreCase(d.getDeliverySede().getCap())
				&& d.getDeliverySede().getComune().equalsIgnoreCase(d.getDeliverySede().getComune()) && del.getVia()
				.equalsIgnoreCase(d.getDeliverySede().getVia()));
	}

	public void retrieveAddresses() {

		// recupero indirizzi già associati al clienti
		deliveryDTO = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(getLoginBean().getEmail());

		// inserisco l'indirizzi già presenti tra quelli selezionabil (spe e
		// fat)
		delAdress.clear();
		delAdress.addAll(deliveryDTO.getIndirizzo());
		delAdressFat.clear();
		delAdressFat.addAll(deliveryDTO.getIndirizzo());

		if (getCartFlowBean().getAddressSpe().getNazione() == null) {
			getCartFlowBean().getAddressSpe().setNazione("ITALIA");
		}

		// recupero spese di spedizione associate alla nazione
		listDeliveryCostDTO = OthalaFactory.getOrderServiceInstance().getSpeseSpedizione(
				getCartFlowBean().getAddressSpe().getNazione());

		if (getCartFlowBean().getDeliveryCost() == null) {
			getCartFlowBean().setDeliveryCost(listDeliveryCostDTO.get(0));
			getCartFlowBean().setIdTypeDelivery(listDeliveryCostDTO.get(0).getIdDeliveryCost());
		}

		if (deliveryDTO != null && deliveryDTO.getIndirizzo() != null && !deliveryDTO.getIndirizzo().isEmpty()) {
			// ci sono indirizzi associati al cliente, se non è presente già una
			// selezione imposto il primo per default

			if (idAddressSpe == 0) {
				getCartFlowBean().setAddressSpe(deliveryDTO.getIndirizzo().get(0));
				idAddressSpe = getCartFlowBean().getAddressSpe().getIdAddress();

			}
			if (idAddressFat == 0) {
				getCartFlowBean().setAddressFat(deliveryDTO.getIndirizzo().get(0));
				idAddressFat = getCartFlowBean().getAddressFat().getIdAddress();
			}
		}

		editAddrFat = idAddressFat == 0;
		editAddrSpe = idAddressSpe == 0;

		// verifico presenza indirizzo merchant
		deliverAddressMerchant = null;
		for (DeliveryCostDTO del : listDeliveryCostDTO) {
			if (del.getDeliverySede() != null && del.getDeliverySede().getIdAddress().intValue() == ID_ADDRESS_MERCHANT) {
				// merchant
				deliverAddressMerchant = del.getDeliverySede();
				deliverCostMerchant = del;
				break;
			}
		}

		// inizializzo tipo spedizione ed imposto indirizzi compatibile con
		// la spedizione selezionata
		modifyTypeDelivery(null);

		// elimino la sede come indirizzo di fatturazione
		if (deliverAddressMerchant != null) {
			for (DeliveryAddressDTO del : delAdress) {
				if (del.getCognome().equalsIgnoreCase(deliverAddressMerchant.getCognome())
						&& del.getNome().equalsIgnoreCase(deliverAddressMerchant.getNome())) {
					delAdressFat.remove(del);
				}
			}
		}

	}

	public void hideAddressFat(AjaxBehaviorEvent ev) {

	}

	public void modifyNazione(AjaxBehaviorEvent e) {

		listDeliveryCostDTO = OthalaFactory.getOrderServiceInstance().getSpeseSpedizione(
				getCartFlowBean().getAddressSpe().getNazione());

		getCartFlowBean().setDeliveryCost(listDeliveryCostDTO.get(0));

	}

	public void modifyTypeDelivery(AjaxBehaviorEvent ev) {

		blockInsAddrDelivery = false;
		addressMerchant = false;
		deliverCurrenteAddressMerchant = new DeliveryAddressDTO();

		for (DeliveryCostDTO d : listDeliveryCostDTO) {
			if (d.getIdDeliveryCost().intValue() == getCartFlowBean().getIdTypeDelivery()) {
				getCartFlowBean().setDeliveryCost(d);

				// recupero indirizzi associati al tipo di spedizione
				if (d.getDeliverySede() != null) {
					// spedizione in sede con vincolo cap,comune e citta

					deliverCurrenteAddressMerchant = d.getDeliverySede();

					// indirizzo presente verifico se sede
					if (d.getDeliverySede().getIdAddress().intValue() == ID_ADDRESS_MERCHANT) {
						addressMerchant = true;

						// indirizzo con sede
						if (d.getDeliverySede().getEtichetta() == null || d.getDeliverySede().getEtichetta().isEmpty()) {
							d.getDeliverySede().setEtichetta("sede");
						}
					}

					if (d.getDeliverySede().getEtichetta() != null && d.getDeliverySede().getEtichetta().isEmpty()) {
						d.getDeliverySede().setEtichetta(null);
					}
					// si verifica la presenza di indirizzi del cliente
					// compatibile con la
					// spedizione selezionata

					List<DeliveryAddressDTO> filter = new ArrayList<DeliveryAddressDTO>();
					for (DeliveryAddressDTO del : delAdress) {
						if (del.getCap().equalsIgnoreCase(d.getDeliverySede().getCap())
								&& d.getDeliverySede().getComune().equalsIgnoreCase(d.getDeliverySede().getComune())) {

							if (addressMerchant) {
								// spedizione sede, se presente inseriamo solo
								// l'indirizzo della sede indipendentemente dal
								// cap e
								// comune
								if (equalsAddrMerchant(del)) {
									filter.add(del);
								}
							} else {
								// non merchant, ecluso la sede anche se stesso
								// comune
								if (!equalsAddrMerchant(del)) {
									filter.add(del);
								}
							}
						}
					}

					if (filter.isEmpty()) {
						// se address non presenti preimpostatiamo i campi di
						// partenza per l'inserimento con quelle presenti della
						// spedizione
						getCartFlowBean().setAddressSpe(d.getDeliverySede());

						editAddrSpe();

					} else {
						// prendiamo il primo indirizzo valido
						deliveryDTO.getIndirizzo().clear();
						deliveryDTO.getIndirizzo().addAll(filter);

						readAddrSpe(filter.get(0));
					}

					blockInsAddrDelivery = true;
				} else if (deliverAddressMerchant != null) {
					// sezione altro, rimuovere tutti gli indirizzi associta
					// alle
					// atre sedi

					filterOtherAddress();

				}
				break;

			}
		}
		/*
		 * if (blockInsAddrDelivery == false && delAdress.isEmpty()) {
		 * newAddrSpe = true; saveAddressSpe = true; editAddrSpe = true; }
		 */

	}

	private void editAddrSpe() {
		editAddrSpe = true;
		// non ha senso annullare se nessun indirizzo è
		// presente, va per forza inserito
		andAddrSpe = false;
		if (!delAdress.isEmpty()) {
			// editiamo solo se address cliente non è vuoto, se
			// vuoto è già in edit
			newAddrSpe = true;
			saveAddressSpe = true;

		}
	}

	private void readAddrSpe(DeliveryAddressDTO del) {
		newAddrSpe = false;
		saveAddressSpe = false;
		editAddrSpe = false;
		getCartFlowBean().setAddressSpe(del);
		idAddressSpe = del.getIdAddress();
	}

	private void filterOtherAddress() {

		List<DeliveryAddressDTO> listDelete = new ArrayList<DeliveryAddressDTO>();
		// eliminiamo tutti gli indirizzi delle altre sedi
		for (DeliveryAddressDTO add : delAdress) {
			for (DeliveryCostDTO del : listDeliveryCostDTO) {
				if (del.getDeliverySede() != null && equalsAddrSede(add, del)) {
					listDelete.add(add);
				}
			}

		}
		deliveryDTO.getIndirizzo().clear();
		deliveryDTO.getIndirizzo().addAll(delAdress);
		deliveryDTO.getIndirizzo().removeAll(listDelete);
		if (deliveryDTO.getIndirizzo().isEmpty()) {
			editAddrSpe();
			getCartFlowBean().setAddressSpe(new DeliveryAddressDTO());

		} else {
			// se è presente una selezione occorre verificare se è compatibile
			// con la spedizione
			if (idAddressSpe != 0) {
				for (DeliveryAddressDTO d : deliveryDTO.getIndirizzo()) {
					if (d.getIdAddress().intValue() == idAddressSpe) {
						readAddrSpe(d);
						return;
					}
				}
			}

			readAddrSpe(deliveryDTO.getIndirizzo().get(0));
		}

	}

	public void changeAddrFat(AjaxBehaviorEvent ev) {
		if (idAddressFat == 0) { // nuovo indirizzo
			editAddrFat = true;
			getCartFlowBean().setAddressFat(new DeliveryAddressDTO());
			getCartFlowBean().getAddressFat().setUserId(getLoginBean().getEmail());

		} else {
			editAddrFat = false;
			for (DeliveryAddressDTO addr : delAdressFat) {
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
					if (deliverAddressMerchant != null) {
						if (addressMerchant && !equalsAddrMerchant(addr)) {
							// tipo spedizione sede ma indirizzo diverso da sede
							getCartFlowBean().setAddressSpe(deliverAddressMerchant);
							getCartFlowBean().setIdTypeDelivery(deliverAddressMerchant.getIdAddress());

							// si recuepera l'id address associtao a sede
							for (DeliveryAddressDTO addr1 : deliveryDTO.getIndirizzo()) {
								if (equalsAddrMerchant(addr1)) {
									idAddressSpe = addr1.getIdAddress();
									break;
								}
							}
							return;
						} else if (!addressMerchant && equalsAddrMerchant(addr)) {
							// ho selezionato indirizzo sede ma non è selezonato
							// la spedizione in sede
							getCartFlowBean().setIdTypeDelivery(deliverAddressMerchant.getIdAddress());
							getCartFlowBean().setDeliveryCost(deliverCostMerchant);
							modifyTypeDelivery(null);
							return;
						}
					}
					getCartFlowBean().setAddressSpe(addr);
					break;
				}
			}

		}

		/*
		 * deliveryDTO.setSpeseSpedizione(OthalaFactory.getOrderServiceInstance()
		 * .getSpeseSpedizione(
		 * getCartFlowBean().getAddressSpe().getNazione()));
		 * getCartFlowBean().setDeliveryCost
		 * (deliveryDTO.getSpeseSpedizione().get(0));
		 * getCartFlowBean().setIdTypeDelivery
		 * (deliveryDTO.getSpeseSpedizione().get(0).getIdDeliveryCost());
		 */

		modifyNazione(ev);

	}

	public void modifyAddrFat(AjaxBehaviorEvent ev) {
		editAddrFat = true;
		saveAddressFat = true;
		newAddrFat = false;
	}

	public void modifyAddrSpe(AjaxBehaviorEvent ev) {
		editAddrSpe = true;
		saveAddressSpe = true;
		andAddrSpe = true;
		newAddrSpe = false;
	}

	public void newAddrFat(AjaxBehaviorEvent ev) {
		modifyAddrFat(ev);
		newAddrFat = true;
	}

	public void newAddrSpe(AjaxBehaviorEvent ev) {
		modifyAddrSpe(ev);
		newAddrSpe = true;
		andAddrSpe = true;

		for (DeliveryCostDTO d : listDeliveryCostDTO) {
			if (d.getIdDeliveryCost().intValue() == getCartFlowBean().getIdTypeDelivery()) {

				// inizializzo cap, prov, citta e naz secondo le specifiche
				// della spedizione
				getCartFlowBean().setAddressAnnSpe(getCartFlowBean().getAddressSpe());
				getCartFlowBean().setAddressSpe(new DeliveryAddressDTO());
				{
					if (d.getDeliverySede() != null) {
						getCartFlowBean().getAddressSpe().setCap(d.getDeliverySede().getCap());
						getCartFlowBean().getAddressSpe().setComune(d.getDeliverySede().getComune());
						getCartFlowBean().getAddressSpe().setProvincia(d.getDeliverySede().getProvincia());
						getCartFlowBean().getAddressSpe().setNazione(d.getDeliverySede().getNazione());
					}
				}

			}
		}

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
		getCartFlowBean().setAddressSpe(getCartFlowBean().getAddressAnnSpe());
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
			idAddressFat = getCartFlowBean().getAddressFat().getIdAddress();
			retrieveAddresses();

			if (idAddressFat == idAddressSpe) {
				RequestContext.getCurrentInstance().execute("$('#select-spe').val('" + idAddressSpe + "');");
				RequestContext.getCurrentInstance().execute("$('#select-fat').val('" + idAddressFat + "');");
			} else {
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

			idAddressSpe = getCartFlowBean().getAddressSpe().getIdAddress();

			retrieveAddresses();

			if (idAddressSpe == idAddressFat) {
				RequestContext.getCurrentInstance().execute("$('#select-spe').val('" + idAddressSpe + "');");
				RequestContext.getCurrentInstance().execute("$('#select-fat').val('" + idAddressFat + "');");
				getCartFlowBean().setAddressFat(getCartFlowBean().getAddressSpe());
			} else {
				RequestContext.getCurrentInstance().execute("$('#select-spe').val('" + idAddressSpe + "');");
			}

			// idAddressSpe=getCartFlowBean().getAddressSpe().getIdAddress();
			editAddrSpe = false;
			saveAddressSpe = false;
			andAddrSpe = false;
		} catch (Exception e) {
			addGenericError(e, "errore nell'inserimento dell'indirizzo");
		}

	}

	public void verifyDiscount(ActionEvent ev) {
		CouponDTO coupon = null;
		FidelityCardDTO fidelity = null;
		getCartFlowBean().setPcScontoCoupon(0);
		getCartFlowBean().setPcScontoFidelity(0);

		if (getCartFlowBean().getCoupon() != null && !getCartFlowBean().getCoupon().isEmpty()) {
			// inserito coupon

			try {
				coupon = OthalaFactory.getOrderServiceInstance().checkCoupon(getCartFlowBean().getCoupon(),
						getLoginBean().getEmail());

				getCartFlowBean().setPcScontoCoupon(coupon.getPcSconto());
			} catch (OthalaException e) {
				// TODO Auto-generated catch block
				addOthalaExceptionError(e, "Errore verfica coupon");
				return;
			}
		}
		if (getCartFlowBean().getFidelityCard() != null && !getCartFlowBean().getFidelityCard().isEmpty()) {
			// inserita fidelity card
			try {
				fidelity = OthalaFactory.getOrderServiceInstance().checkFidelityCard(
						getCartFlowBean().getFidelityCard(), getLoginBean().getEmail(), null, getLoginBean().getName(),
						getLoginBean().getSurname());
				getCartFlowBean().setPcScontoFidelity(fidelity.getPcSconto());
			} catch (FidelityCardNotPresentException | FidelityCardNotValidException e) {
				// TODO Auto-generated catch block
				addOthalaExceptionError(e, "Errore verfica fideliy");
				return;
			}

		}
		int pcScontoTotale = getCartFlowBean().getPcScontoCoupon() + getCartFlowBean().getPcScontoFidelity();

		getCartFlowBean().setTotalPriceOrdeNoDiscount(
				getCartFlowBean().getTotalItemOrder().add(getCartFlowBean().getDeliveryCost().getImportoSpese()));

		if (pcScontoTotale > 0) {

			importoScontabile = new BigDecimal(0);
			for (ArticleFullDTO art : getCartFlowBean().getCart()) {

				if (art.getSpecialPrice() == null || art.getSpecialPrice() == new BigDecimal(0)) {
					setImportoScontabile(importoScontabile.add(art.getPriceDiscounted()));

				}

			}

			BigDecimal sconto = new BigDecimal(pcScontoTotale);
			sconto = sconto.divide(new BigDecimal(100));

			getCartFlowBean().setAmtDiscount(importoScontabile.multiply(sconto));
			sconto = getCartFlowBean().getTotalPriceOrdeNoDiscount().subtract(getCartFlowBean().getAmtDiscount());

		} else {
			getCartFlowBean().setAmtDiscount(BigDecimal.ZERO);
		}

		getCartFlowBean().setTotalPriceOrder(
				getCartFlowBean().getTotalPriceOrdeNoDiscount().subtract(getCartFlowBean().getAmtDiscount()));

		RequestContext.getCurrentInstance().execute(WizardUtil.NextStepWizard());
	}

	public void newAddr(ActionEvent ev) {
		try {
			boolean modify = false;

			if (idAddressSpe == 0) {
				// nuovo spedizione
				getCartFlowBean().getAddressSpe().setUserId(getLoginBean().getEmail());
				getCartFlowBean().setAddressSpe(
						OthalaFactory.getOrderServiceInstance().newAddress(getCartFlowBean().getAddressSpe()));
				idAddressSpe = getCartFlowBean().getAddressSpe().getIdAddress();
				modify = true;
			}
			if (isSameAddress() == false) {
				if (idAddressFat == 0) {
					// nuovo fatturazione
					getCartFlowBean().getAddressFat().setUserId(getLoginBean().getEmail());
					getCartFlowBean().setAddressFat(
							OthalaFactory.getOrderServiceInstance().newAddress(getCartFlowBean().getAddressFat()));
					idAddressFat = getCartFlowBean().getAddressFat().getIdAddress();
					modify = true;
				}
			} else {
				getCartFlowBean().setAddressFat(getCartFlowBean().getAddressSpe());
				idAddressFat = idAddressSpe;
			}
			if (modify) {
				retrieveAddresses();
			}
			editAddrSpe = false;
			editAddrFat = false;
			sameAddress = false;
			calcolaPrezzoCarrello();
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

		order.setIdFidelity(null);
		order.setPcSconto(getCartFlowBean().getPcScontoFidelity() + getCartFlowBean().getPcScontoCoupon());
		if (getCartFlowBean().getPcScontoFidelity() > 0) {
			order.setIdFidelity(getCartFlowBean().getFidelityCard());

		}
		order.setIdCoupon(null);
		if (getCartFlowBean().getPcScontoCoupon() > 0) {
			order.setIdCoupon(getCartFlowBean().getCoupon());

		}

		// importo

		order.setSpeseSpedizione(getCartFlowBean().getDeliveryCost());
		order.setImItemOrdine(getCartFlowBean().getTotalItemOrder());
		order.setImOrdineDiscount(getCartFlowBean().getAmtDiscount());

		order.setImOrdine(getCartFlowBean().getTotalPriceOrder());

		getCartFlowBean().setTotalPriceOrder(order.getImOrdine());
		return order;

	}

	public BigDecimal getImportoScontabile() {
		return importoScontabile;
	}

	public void setImportoScontabile(BigDecimal importoScontabile) {
		this.importoScontabile = importoScontabile;
	}

}
