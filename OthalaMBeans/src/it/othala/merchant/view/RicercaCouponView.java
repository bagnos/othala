package it.othala.merchant.view;

import it.othala.dto.AccountDTO;
import it.othala.merchant.model.PromozioniBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.AutoCompleteUtils;

import java.io.IOException;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

@ManagedBean
@ViewScoped
public class RicercaCouponView extends BaseView {

	@ManagedProperty(value = "#{promozioniBean}")
	private PromozioniBean promozioniBean;

	public PromozioniBean getPromozioniBean() {
		return promozioniBean;
	}

	public void setPromozioniBean(PromozioniBean promozioniBean) {
		this.promozioniBean = promozioniBean;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		promozioniBean.setFidelityCardSelected(null);
		return null;
	}

	public List<AccountDTO> completeAccount(String query) {
		List<AccountDTO> filter = AutoCompleteUtils.completeAccountDTO(query.trim());
		return filter;
	}

	public void cerca(ActionEvent e) {
		try {
			promozioniBean
					.setIdCoupon(promozioniBean.getIdCoupon() != null && !promozioniBean.getIdCoupon().isEmpty() ? promozioniBean
							.getIdCoupon() : null);
			promozioniBean.setIdUser(promozioniBean.getAccountSelected() != null ? promozioniBean.getAccountSelected()
					.getEmail() : null);
			promozioniBean.setListCoupon(OthalaFactory.getOrderServiceInstance().getCoupons(
					promozioniBean.getIdCoupon(), promozioniBean.getIdUser()));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "errore ricerca coupon");
		}
	}

	public void elimina(ActionEvent e) {
		try {
			OthalaFactory.getOrderServiceInstance().deleteCoupon(promozioniBean.getCouponSelected().getIdCoupon());
			cerca(null);
			addInfo("Elimina Coupon",
					String.format("Eliminato %s con successo", promozioniBean.getCouponSelected().getIdCoupon()));
			promozioniBean.setAccountSelected(null);
			promozioniBean.setFidelityCardSelected(null);

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "errore elimina coupon");
		}
	}

	public void modifica(ActionEvent e) {

		try {
			FacesContext
					.getCurrentInstance()
					.getExternalContext()
					.redirect(
							"generaCoupon.xhtml?modifica=true&facesRedirect=true");
		} catch (IOException ex) {
			// TODO Auto-generated catch block
			addGenericError(ex, "errore redirect modifica coupon");
		}

	}

}
