package it.othala.merchant.model;

import it.othala.dto.AccountDTO;
import it.othala.dto.CouponDTO;
import it.othala.dto.FidelityCardDTO;

import java.io.Serializable;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class PromozioniBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<CouponDTO> listCoupon;
	private List<AccountDTO> listAccount;
	private String idCoupon;
	private String idUser;
	private AccountDTO accountSelected;
	private CouponDTO couponSelected;
	private FidelityCardDTO fidelityCardSelected;
	private List<FidelityCardDTO> fidelity;
	private FidelityCardDTO findFidelity;
	

	public FidelityCardDTO getFindFidelity() {
	
		return findFidelity;
	}

	public void setFindFidelity(FidelityCardDTO findFidelity) {
		this.findFidelity = findFidelity;
	}

	public List<FidelityCardDTO> getFidelity() {
		return fidelity;
	}

	public void setFidelity(List<FidelityCardDTO> fidelity) {
		this.fidelity = fidelity;
	}

	public FidelityCardDTO getFidelityCardSelected() {
		return fidelityCardSelected;
	}

	public void setFidelityCardSelected(FidelityCardDTO fidelityCardSelected) {
		this.fidelityCardSelected = fidelityCardSelected;
	}

	public List<AccountDTO> getListAccount() {
		return listAccount;
	}

	public void setListAccount(List<AccountDTO> listAccount) {
		this.listAccount = listAccount;
	}

	public void setListCoupon(List<CouponDTO> listCoupon) {
		this.listCoupon = listCoupon;
	}

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


}
