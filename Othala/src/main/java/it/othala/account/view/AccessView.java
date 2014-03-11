package it.othala.account.view;

import it.othala.account.execption.BadCredentialException;
import it.othala.account.execption.DuplicateUserException;
import it.othala.account.execption.MailNotSendException;
import it.othala.account.execption.UserNotActivatedException;
import it.othala.account.execption.UserNotFoundException;
import it.othala.account.model.AccessBean;
import it.othala.account.model.CustomerLoginBean;
import it.othala.enums.TypeCustomerState;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.event.ActionEvent;

@ManagedBean
public class AccessView extends BaseView {

	@ManagedProperty(value = "#{accessBean}")
	private AccessBean accessBean;
	private boolean renderClient;

	@ManagedProperty(value = "#{customerLoginBean}")
	private CustomerLoginBean loginBean;

	public void setLoginBean(CustomerLoginBean loginBean) {
		this.loginBean = loginBean;
	}

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

	public String registration() {

		if (isVerifiedInput()) {
			try {
				accessBean.getAccountDTO().setState(TypeCustomerState.DISATTIVATO.getState());
				OthalaFactory.getAccountServiceInstance().registerAccount(accessBean.getAccountDTO());
				addInfo(OthalaUtil.getWordBundle("account_registerUser"), OthalaUtil.getWordBundle(
						"account_registeredUser", new Object[] { accessBean.getAccountDTO().getEmail() }));
				return "home";
			} catch (DuplicateUserException | BadCredentialException e) {
				addOthalaExceptionError(e, "registration ko");

			} catch (MailNotSendException e) {
				addGenericError(e, "registration ko");

			}
		}
		return null;

	}

	/*
	 * public String moveToRequestResetPsw() { try {
	 * FacesContext.getCurrentInstance
	 * ().getExternalContext().redirect("requestResetPsw.xhtml"); } catch
	 * (IOException e) { // TODO Auto-generated catch block
	 * log.error("errore nella navigazione", e); } return null; }
	 */

	public String resetPsw() {

		try {
			OthalaFactory.getAccountServiceInstance().resetPasswordAccount(accessBean.getEmail());
			addInfo(OthalaUtil.getWordBundle("account_checkYourMail"), "");
		} catch (UserNotFoundException | UserNotActivatedException e) {
			addOthalaExceptionError(e, "Errore nel reset della password.");
		} catch (MailNotSendException e) {
			// TODO Auto-generated catch block
			addGenericError(e, "registration ko");
		}
		return null;
	}

	public String login() {
		try {
			String name = OthalaFactory.getAccountServiceInstance().verifyPasswordAccount(accessBean.getEmail(),
					accessBean.getPsw());
			loginBean.setName(name);
			loginBean.setEmail(accessBean.getEmail());
			renderClient = true;
		} catch (BadCredentialException e) {
			// TODO Auto-generated catch block
			addOthalaExceptionError(e, "login error");
		}
		return "home";
	}

	public void logout(ActionEvent e) {
		loginBean.setEmail(null);
		loginBean.setName(null);
		renderClient = false;

	}
	
	public String moveToAcess()
	{
		return "accedi";
	}
	
	public String moveToregistration()
	{
		return "registrazione";
	}

	private boolean isVerifiedInput() {
		if (!accessBean.getEmail().equalsIgnoreCase(accessBean.getConfEmail())) {
			addError(null, OthalaUtil.getWordBundle("validator_eqMail"));
			return false;
		}

		return true;
	}
}
