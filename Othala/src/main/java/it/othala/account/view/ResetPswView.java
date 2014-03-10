package it.othala.account.view;

import it.othala.execption.UserNotFoundException;
import it.othala.service.factory.OthalaFactory;
import it.othala.util.HelperCrypt;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import javax.faces.bean.ManagedBean;

@ManagedBean
public class ResetPswView extends BaseView {

	private String email;
	private String psw;
	private String confPsw;
	private boolean renderPanel;

	public boolean isRenderPanel() {
		return renderPanel;
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
		renderPanel=true;
		String user = getQueryStringParm("u");
		if (user != null) {
			email = HelperCrypt.decrypt(user);

		} else {
			addError(OthalaUtil.getWordBundle("account_assistanceResetPsw"),
					OthalaUtil.getWordBundle("account_assistanceResetEmailEmpty"));
			renderPanel=false;
		}
		return null;
	}

	public String resetPsw() {

		try {
			OthalaFactory.getAccountServiceInstance().changePsswordAccount(email, psw);
			addInfo( OthalaUtil.getWordBundle("account_assistanceResetPsw"), OthalaUtil.getWordBundle("account_assistanceResetSuccess"));
		} catch (UserNotFoundException e) {
			// TODO Auto-generated catch block
			addOthalaExceptionError(e, "errore nel cambio della password");
		}
		
		return null;
	}

}
