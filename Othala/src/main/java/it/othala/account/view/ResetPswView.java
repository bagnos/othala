package it.othala.account.view;

import it.othala.account.execption.UserNotFoundException;
import it.othala.account.execption.UserNotResetStateException;
import it.othala.service.factory.OthalaFactory;
import it.othala.util.HelperCrypt;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

@ManagedBean
@ViewScoped
public class ResetPswView extends BaseView {

	private String email;
	private String psw;
	private String confPsw;	
	private boolean disabled;

	public boolean isDisabled() {
		return disabled;
	}

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getConfPsw() {
		return confPsw;
	}

	public void setConfPsw(String confPsw) {
		this.confPsw = confPsw;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		disabled = false;
		String user = getQueryStringParm("u");
		if (user != null) {
			email = HelperCrypt.decrypt(user);

		} else {
			addError(OthalaUtil.getWordBundle("account_assistanceResetPsw"),
					OthalaUtil.getWordBundle("account_assistanceResetEmailEmpty"));
			disabled = true;
		}
		return null;
	}

	public void resetPsw(ActionEvent e) {

		try {

			OthalaFactory.getAccountServiceInstance().changePassworResetdAccount(email, psw);
			addInfo(OthalaUtil.getWordBundle("account_assistanceResetPsw"),
					OthalaUtil.getWordBundle("account_assistanceResetSuccess"));

		} catch (UserNotFoundException | UserNotResetStateException ex) {
			// TODO Auto-generated catch block
			addOthalaExceptionError(ex, "errore nel cambio della password");
		}
	}

}
