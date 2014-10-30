package it.othala.merchant.view;

import it.othala.dto.AccountDTO;
import it.othala.dto.CouponDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.FidelityCardDTO;
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
import javax.faces.event.AjaxBehaviorEvent;

@ManagedBean
@ViewScoped
public class InserisciFidelityCardView extends BaseView {

	private List<AccountDTO> listAccountFiltered = new ArrayList<>();
	private AccountDTO accountSelected;
	private boolean modifica;
	private Date dateNow = GregorianCalendar.getInstance().getTime();
	private FidelityCardDTO fidelityCardDTO;

	@ManagedProperty(value = "#{promozioniBean}")
	private PromozioniBean promozioniBean;

	public PromozioniBean getPromozioniBean() {
		return promozioniBean;
	}

	public void setPromozioniBean(PromozioniBean promozioniBean) {
		this.promozioniBean = promozioniBean;
	}

	public FidelityCardDTO getFidelityCardDTO() {
		return fidelityCardDTO;
	}

	public void setFidelityCardDTO(FidelityCardDTO fidelityCardDTO) {
		this.fidelityCardDTO = fidelityCardDTO;
	}

	public boolean isModifica() {
		return modifica;
	}

	public void setModifica(boolean modifica) {
		this.modifica = modifica;
	}

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

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		try {
			if (!isModifica()) {
				resetFidelity();
			} else {
				fidelityCardDTO = promozioniBean.getFidelityCardSelected();
			}
		} catch (Exception e) {
			addGenericError(e, "errore inizializzazione fidelity");
		}

		return null;
	}

	private void resetFidelity() {

		fidelityCardDTO = new FidelityCardDTO();
		accountSelected = null;
	}

	public void inserisciFidelity(ActionEvent e) {
		try {

			if (!isModifica()) {
				OthalaFactory.getOrderServiceInstance().addFidelityCard(fidelityCardDTO);
			} else {

				OthalaFactory.getOrderServiceInstance().aggiornaFidelity(fidelityCardDTO.getIdFidelity(),
						fidelityCardDTO.getPcSconto(), fidelityCardDTO.getTxNome(), fidelityCardDTO.getTxCognome(),
						fidelityCardDTO.getTxEmail(),fidelityCardDTO.getTxTel());
			}

			resetFidelity();
			addInfo("Fidelity card", "Inserimento eseguito correttamente");
		} catch (Exception ex) {
			// TODO Auto-generated catch block
			addGenericError(ex, "errore generazione coupon");
		}
	}

	public List<AccountDTO> completeAccount(String query) {
		List<AccountDTO> filter = AutoCompleteUtils.completeAccountDTO(query.trim());
		return filter;
	}

	public void itemSelectAccount(AjaxBehaviorEvent e) {
		fidelityCardDTO.setTxCognome(accountSelected.getSurname());
		fidelityCardDTO.setTxEmail(accountSelected.getEmail());
		fidelityCardDTO.setTxNome(accountSelected.getName());

		DeliveryDTO addresses = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(getLoginBean().getEmail());
		if (addresses.getIndirizzo() != null && !addresses.getIndirizzo().isEmpty()) {
			DeliveryAddressDTO da = addresses.getIndirizzo().get(0);
			fidelityCardDTO.setTxTel(da.getTel());
		}
	}

}
