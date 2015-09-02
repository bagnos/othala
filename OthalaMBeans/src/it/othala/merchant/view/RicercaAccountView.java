package it.othala.merchant.view;

import it.othala.dto.AccountDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.ShopDTO;
import it.othala.enums.TypeStateProduct;
import it.othala.merchant.model.MerchantBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ResizeImageUtil;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;

import org.primefaces.context.RequestContext;
import org.primefaces.model.UploadedFile;
import org.w3c.dom.ls.LSInput;

@ManagedBean
@ViewScoped
public class RicercaAccountView extends BaseView {

	private List<AccountDTO> listAccount = new ArrayList<>();
	private String name;
	private String surname;
	private String email;
	private List<AccountDTO> listSelectAccount = new ArrayList<>();

	
	public List<AccountDTO> getListSelectAccount() {
		return listSelectAccount;
	}

	public void setListSelectAccount(List<AccountDTO> listSelectAccount) {
		this.listSelectAccount = listSelectAccount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<AccountDTO> getListAccount() {
		return listAccount;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		return null;
	}

	public void findAccount(ActionEvent e) {

		if (email == null || email.isEmpty()) {
			listAccount = OthalaFactory.getAccountServiceInstance().findAccount(surname, name);
		} else {
			AccountDTO acc = OthalaFactory.getAccountServiceInstance().findAccount(email);
			listAccount.clear();
			listAccount.add(acc);
		}
		
	}

	public void removeAccount(ActionEvent e) {

		try {
			if (listSelectAccount.isEmpty()) {
				addError("Rimuovi account", "nessun account selezionato");
			}
			int deletes = OthalaFactory.getAccountServiceInstance().removeAccount(listSelectAccount);
			if (deletes == 0) {
				addError("Rimozione utenti", "nessun utente eliminato");
				
				
			} else {
				addInfo("Rimozione utenti", String.format("eliminati %d utenti", deletes));
				findAccount(null);
			}
		} catch (Exception ex) {
			addGenericError(ex, "errore nella rimozione deglia ccount");
		}

	}
	
	public void activeAccount(ActionEvent e) {

		try {
			if (listSelectAccount.isEmpty()) {
				addError("Rimuovi account", "nessun account selezionato");
			}
			int deletes = OthalaFactory.getAccountServiceInstance().activeAccount(listSelectAccount);
			if (deletes == 0) {
				addError("Rimozione utenti", "nessun utente eliminato");
				
				
			} else {
				addInfo("Rimozione utenti", String.format("eliminati %d utenti", deletes));
				findAccount(null);
			}
		} catch (Exception ex) {
			addGenericError(ex, "errore nella rimozione deglia ccount");
		}

	}

}
