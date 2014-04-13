package it.othala.account.view;

import it.othala.account.execption.BadCredentialException;
import it.othala.account.execption.DuplicateUserException;
import it.othala.account.execption.MailNotSendException;
import it.othala.account.execption.UserNotActivatedException;
import it.othala.account.execption.UserNotFoundException;
import it.othala.account.model.CustomerLoginBean;
import it.othala.dto.AccountDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;
import it.othala.web.utils.WizardUtil;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;

import org.primefaces.context.RequestContext;

@Named
@javax.faces.view.ViewScoped
public class AccessView extends BaseView {

	/*
	 * @ManagedProperty(value = "#{accessBean}")
	 */

	private boolean renderClient;

	/*
	 * @ManagedProperty(value = "#{customerLoginBean}")
	 */
	@Inject
	private CustomerLoginBean loginBean;

	private String psw;
	private String email;
	private boolean staySignIn;
	private String confEmail;
	private String confPsw;
	private String name;
	private String surname;
	private boolean newsletter;
	private Boolean acceptPrivacy;

	public Boolean getAcceptPrivacy() {
		return acceptPrivacy;
	}

	public void setAcceptPrivacy(Boolean acceptPrivacy) {
		this.acceptPrivacy = acceptPrivacy;
	}

	public boolean isStaySignIn() {
		return staySignIn;
	}

	public void setStaySignIn(boolean staySignIn) {
		this.staySignIn = staySignIn;
	}

	public String getConfEmail() {
		return confEmail;
	}

	public void setConfEmail(String confEmail) {
		this.confEmail = confEmail;
	}

	public String getConfPsw() {
		return confPsw;
	}

	public void setConfPsw(String confPsw) {
		this.confPsw = confPsw;
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

	public boolean isNewsletter() {
		return newsletter;
	}

	public void setNewsletter(boolean newsletter) {
		this.newsletter = newsletter;
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

	public void setLoginBean(CustomerLoginBean loginBean) {
		this.loginBean = loginBean;
	}

	public boolean isRenderClient() {
		return renderClient;
	}

	public void setRenderClient(boolean renderClient) {
		this.renderClient = renderClient;
	}

	private AccountDTO getAccountDTO() {
		AccountDTO acc = new AccountDTO();
		acc.setEmail(email);
		acc.setName(name);
		acc.setPsw(confPsw);
		acc.setSurname(surname);
		acc.setNewsletter(newsletter);
		return acc;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		setStaySignIn(true);
		return null;
	}

	public String registration() {

		if (registrationCore()) {
			return "home";
		} else {
			return null;
		}

	}

	private boolean registrationCore() {

		if (isVerifiedInput()) {
			try {
				OthalaFactory.getAccountServiceInstance().registerAccount(getAccountDTO());
				addInfo(OthalaUtil.getWordBundle("account_registerUser"),
						OthalaUtil.getWordBundle("account_registeredUser", new Object[] { getAccountDTO().getEmail() }));

			} catch (DuplicateUserException | BadCredentialException e) {
				addOthalaExceptionError(e, "registration ko");
				return false;

			} catch (MailNotSendException e) {
				addGenericError(e, "registration ko");
				return false;

			}
			return true;
		}
		return false;
	}

	public void registrationWizard(ActionEvent e) {
		if (registrationCore()) {
			loginWizard(null);
		}
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
			OthalaFactory.getAccountServiceInstance().resetPasswordAccount(getEmail());
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
			AccountDTO acc = OthalaFactory.getAccountServiceInstance().verifyPasswordAccount(getEmail(), getPsw());
			loginBean.setName(acc.getName());
			loginBean.setEmail(acc.getEmail());
			loginBean.setSurname(acc.getSurname());
			renderClient = true;
		} catch (BadCredentialException e) {
			// TODO Auto-generated catch block
			addOthalaExceptionError(e, "login error");
		}
		return "home";
	}

	public void loginWizard(ActionEvent e) {
		try {
			AccountDTO acc = OthalaFactory.getAccountServiceInstance().verifyPasswordAccount(email, psw);
			loginBean.setName(acc.getName());
			loginBean.setEmail(acc.getEmail());
			loginBean.setSurname(acc.getSurname());
			renderClient = true;
			// disabilitiamo l'accedi ed avanziiamo allo step successivo
			RequestContext.getCurrentInstance().execute(WizardUtil.NextStepWizard());

			// RequestContext.getCurrentInstance().execute("$('#rootwizard').bootstrapWizard({onTabChange: function(tab, navigation, index) { if(index == 1) { alert('on tab show disabled');return false;	}}});");

		} catch (BadCredentialException ex) {
			// TODO Auto-generated catch block
			addOthalaExceptionError(ex, "login error");
		}

	}

	public void logout(ActionEvent e) {
		loginBean.setEmail(null);
		loginBean.setName(null);
		renderClient = false;

		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
		if (session != null) {
			session.invalidate();
		}
		redirectHome();
	}

	public String moveToAcess() {
		return "accedi";
	}

	public String moveToregistration() {
		return "registrazione";
	}

	private boolean isVerifiedInput() {
		if (!getEmail().equalsIgnoreCase(getConfEmail())) {
			addError(null, OthalaUtil.getWordBundle("validator_eqMail"));
			return false;
		}
		
		if (!acceptPrivacy)
		{
			addError("privacy", null,OthalaUtil.getWordBundle("validator_privacy"));
			return false;
		}

		return true;
	}
}
