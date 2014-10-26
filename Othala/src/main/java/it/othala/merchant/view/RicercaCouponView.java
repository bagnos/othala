package it.othala.merchant.view;

import it.othala.dto.AccountDTO;
import it.othala.dto.CouponDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.AutoCompleteUtils;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

@ManagedBean
@ViewScoped
public class RicercaCouponView extends BaseView {

	private List<CouponDTO> listCoupon;
	private List<AccountDTO> listAccount;
	private String idCoupon;
	private String idUser;
	private AccountDTO accountSelected;
	private CouponDTO couponSelected;

	public CouponDTO getCouponSelected() {
		return couponSelected;
	}

	public void setCouponSelected(CouponDTO couponSelected) {
		this.couponSelected = couponSelected;
	}

	public AccountDTO getAccountSelected() {
		return accountSelected;
	}

	public void setAccountSelected(AccountDTO accountSelected) {
		this.accountSelected = accountSelected;
	}

	public String getIdCoupon() {
		return idCoupon;
	}

	public void setIdCoupon(String idCoupon) {
		this.idCoupon = idCoupon;
	}

	public String getIdUser() {
		return idUser;
	}

	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}

	public List<CouponDTO> getListCoupon() {
		return listCoupon;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		return null;
	}

	public List<AccountDTO> completeAccount(String query) {
		List<AccountDTO> filter = AutoCompleteUtils.completeAccountDTO(query.trim());
		return filter;
	}

	public void cerca(ActionEvent e) {
		try {
			idCoupon=idCoupon!=null&&!idCoupon.isEmpty()?idCoupon:null;
			idUser=accountSelected!=null?accountSelected.getEmail():null;
			listCoupon = OthalaFactory.getOrderServiceInstance().getCoupons(idCoupon, idUser);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "errore ricerca coupon");
		}
	}

	public void elimina(ActionEvent e) {
		try {
			OthalaFactory.getOrderServiceInstance().deleteCoupon(couponSelected.getIdCoupon());
			cerca(null);
			addInfo("Elimina Coupon", String.format("Eliminato %s con successo", couponSelected.getIdCoupon()));
			accountSelected=null;
			idCoupon=null;

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "errore elimina coupon");
		}
	}

}
