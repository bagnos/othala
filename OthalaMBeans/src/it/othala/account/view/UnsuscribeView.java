package it.othala.account.view;

import it.othala.service.factory.OthalaFactory;
import it.othala.util.HelperCrypt;
import it.othala.view.BaseView;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
public class UnsuscribeView extends BaseView {

	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		try {
			if (id != null) {
				id = HelperCrypt.decrypt(id);
				OthalaFactory.getAccountServiceInstance().deleteMail(Integer.valueOf(id));
				addInfo("Unsuscribe Newsletter", "Operazione eseguita correttamente");
			}
		} catch (Exception e) {
			addGenericError(e, "errore unsuscribe newletter");
		}

		return null;
	}

}
