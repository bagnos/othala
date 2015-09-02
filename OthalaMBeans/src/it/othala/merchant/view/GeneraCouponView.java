package it.othala.merchant.view;

import it.othala.dto.AccountDTO;
import it.othala.dto.CouponDTO;
import it.othala.merchant.model.PromozioniBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.AutoCompleteUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

@ManagedBean
@ViewScoped
public class GeneraCouponView extends BaseView {

	private CouponDTO coupon;

	private List<AccountDTO> listAccountFiltered = new ArrayList<>();
	private AccountDTO accountSelected;
	private boolean modifica;
	private String idCoupon;
	
	@ManagedProperty(value = "#{promozioniBean}")
	private PromozioniBean promozioniBean;

	public PromozioniBean getPromozioniBean() {
		return promozioniBean;
	}

	public void setPromozioniBean(PromozioniBean promozioniBean) {
		this.promozioniBean = promozioniBean;
	}

	public String getIdCoupon() {
		return idCoupon;
	}

	public void setIdCoupon(String idCoupon) {
		this.idCoupon = idCoupon;
	}

	public boolean isModifica() {
		return modifica;
	}

	public void setModifica(boolean modifica) {
		this.modifica = modifica;
	}

	private Date dateNow = GregorianCalendar.getInstance().getTime();

	public void setListAccountFiltered(List<AccountDTO> listAccountFiltered) {
		this.listAccountFiltered = listAccountFiltered;
	}

	public List<AccountDTO> getListAccountFiltered() {
		return listAccountFiltered;
	}

	public AccountDTO getAccountSelected() {
		return accountSelected;
	}

	public void setAccountSelected(AccountDTO accountSelected) {
		this.accountSelected = accountSelected;
	}

	public CouponDTO getCoupon() {
		return coupon;
	}

	public void setCoupon(CouponDTO coupon) {
		this.coupon = coupon;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		try {
			if (!isModifica()) {
				resetCoupon();
			} else {
				coupon = promozioniBean.getCouponSelected();
				accountSelected = OthalaFactory.getAccountServiceInstance().findAccount(coupon.getIdUser());
				listAccountFiltered.add(getAccountSelected());
				AutoCompleteUtils.completeAccountDTO(listAccountFiltered);
			}
		} catch (Exception e) {
			addGenericError(e, "errore inizializzazione genera coupon");
		}

		return null;
	}

	private void resetCoupon() {
		coupon = new CouponDTO();
		coupon.setPcSconto((short) 1);
		coupon.setQtUtilizzo(null);
		coupon.setDtScadenza(GregorianCalendar.getInstance().getTime());
		coupon.setIdUser(null);
	}

	public void generaCoupon(ActionEvent e) {
		try {

			if (coupon.getDtScadenza().compareTo(dateNow) <= 0) {
				addError("Genera Coupon", "Data scadenza minore della data ordierna");
				return;
			}

			// String idCoupon = RandomStringUtils.randomAlphanumeric(8);
			// coupon.setIdCoupon(idCoupon.toUpperCase());
			coupon.setIdUser(null);
			if (accountSelected != null && !accountSelected.getEmail().isEmpty()) {
				coupon.setIdUser(accountSelected.getEmail());
			}
			if (coupon.getQtUtilizzo() != null && coupon.getQtUtilizzo().intValue() == 0) {
				coupon.setQtUtilizzo(null);
			}
			if (!isModifica()) {
				OthalaFactory.getOrderServiceInstance().insertCoupon(coupon);
				addInfo("Coupon", String.format("Generato coupon %s", coupon.getIdCoupon()));
			} else {
				OthalaFactory.getOrderServiceInstance().updateCoupon(coupon);				
				addInfo("Coupon", String.format("Modificato coupon %s", coupon.getIdCoupon()));
			}
			resetCoupon();
		} catch (Exception ex) {
			// TODO Auto-generated catch block
			addGenericError(ex, "errore generazione coupon");
		}
	}

	public List<AccountDTO> completeAccount(String query) {
		List<AccountDTO> filter = AutoCompleteUtils.completeAccountDTO(query.trim());
		return filter;
	}

}
