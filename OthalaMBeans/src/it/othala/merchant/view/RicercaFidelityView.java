package it.othala.merchant.view;

import it.othala.dto.AccountDTO;
import it.othala.dto.FidelityCardDTO;
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
import javax.faces.event.AjaxBehaviorEvent;

import org.apache.catalina.ant.FindLeaksTask;

@ManagedBean
@ViewScoped
public class RicercaFidelityView extends BaseView {

	/**
	 * 
	 */

	private String idFidelity;

	private AccountDTO accountSelected;
	
	@ManagedProperty(value = "#{promozioniBean}")
	private PromozioniBean promozioniBean;

	public PromozioniBean getPromozioniBean() {
		return promozioniBean;
	}

	public void setPromozioniBean(PromozioniBean promozioniBean) {
		this.promozioniBean = promozioniBean;
	}

	

	public AccountDTO getAccountSelected() {
		return accountSelected;
	}

	public void setAccountSelected(AccountDTO accountSelected) {
		this.accountSelected = accountSelected;
	}

	public String getIdFidelity() {
		return idFidelity;
	}

	public void setIdFidelity(String idFidelity) {
		this.idFidelity = idFidelity;
	}

	private static final long serialVersionUID = 1L;

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		try {
			if (promozioniBean.getFindFidelity()==null)
			{
				promozioniBean.setFindFidelity(new FidelityCardDTO());
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			addGenericError(e, "errore inizializzazione campagne");
		}

		return null;
	}

	private void resetFidelity() {
		accountSelected = null;
		promozioniBean.setFidelityCardSelected(null);
		promozioniBean.setFindFidelity(new FidelityCardDTO());
	}

	public void eliminaFidelity(ActionEvent e) {
		try {
			OthalaFactory.getOrderServiceInstance().deleteFidelityCard(
					promozioniBean.getFidelityCardSelected().getIdFidelity());
			promozioniBean.setFidelityCardSelected(null);
			cercaFidelity(null);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "errore eliminazione fidelity card");
		}
	}

	public void cercaFidelity(ActionEvent e) {
		try {
			
			
			promozioniBean.setFidelity(OthalaFactory.getOrderServiceInstance().getFidelityCards(
					promozioniBean.getFindFidelity().getIdFidelity(), promozioniBean.getFindFidelity().getTxNome(), promozioniBean.getFindFidelity().getTxCognome(),
					promozioniBean.getFindFidelity().getTxEmail()));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "errore riecrca fidelity card");
		}
	}

	public List<AccountDTO> completeAccount(String query) {
		List<AccountDTO> filter = AutoCompleteUtils.completeAccountDTO(query.trim());
		return filter;
	}

	public void itemSelectAccount(AjaxBehaviorEvent e) {
		
		promozioniBean.getFindFidelity().setTxCognome(accountSelected.getSurname());
		promozioniBean.getFindFidelity().setTxEmail(accountSelected.getEmail());
		promozioniBean.getFindFidelity().setTxNome(accountSelected.getName());

	}

	public void modifica(ActionEvent e) {

		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect("inserisciFidelityCard.xhtml?modifica=true&facesRedirect=true");
		} catch (IOException ex) {
			// TODO Auto-generated catch block
			addGenericError(ex, "errore redirect modifica fidelity");
		}

	}

}
