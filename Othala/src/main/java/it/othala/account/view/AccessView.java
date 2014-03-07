package it.othala.account.view;

import it.othala.account.model.AccessBean;
import it.othala.execption.BadCredentialException;
import it.othala.execption.DuplicateUserException;
import it.othala.execption.MailNotSendException;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.event.ActionEvent;

@ManagedBean
public class AccessView extends BaseView {

	@ManagedProperty(value = "#{accessBean}")
	private AccessBean accessBean;
	private boolean renderClient;

	public boolean isRenderClient() {
		return renderClient;
	}

	public void setRenderClient(boolean renderClient) {
		this.renderClient = renderClient;
	}

	public AccessBean getAccessBean() {
		return accessBean;
	}

	public void setAccessBean(AccessBean accessBean) {
		this.accessBean = accessBean;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		accessBean.setStaySignIn(true);
		return null;
	}

	public String login() {
		renderClient = true;
		return null;
	}

	public String registration() {

		if (isVerifiedInput()) {
			try {
				OthalaFactory.getAccountServiceInstance().registerAccount(accessBean.getAccountDTO());
				addInfo(OthalaUtil.getWordBundle("account_registerUser"), OthalaUtil.getWordBundle(
						"account_registeredUser", new Object[] { accessBean.getAccountDTO().getEmail() }));
				return "home";
			} catch (DuplicateUserException | BadCredentialException e) {
				addOthalaExceptionError(e, "errore nella registrazione");

			} catch (MailNotSendException e) {
				addGenericError(e, "errore nella registrazione");

			}
		}
		return null;

	}

	public String logout() {
		renderClient = false;
		return null;
	}

	public void logout(ActionEvent e) {
		renderClient = false;

	}

	private boolean isVerifiedInput() {
		if (!accessBean.getEmail().equalsIgnoreCase(accessBean.getConfEmail())) {
			addError(OthalaUtil.getWordBundle("validator_eqMail"), null);
			return false;
		}

		if (!accessBean.getPsw().equalsIgnoreCase(accessBean.getConfPsw())) {
			addError(OthalaUtil.getWordBundle("validator_eqPsw"), null);
			return false;
		}

		return true;
	}
}
