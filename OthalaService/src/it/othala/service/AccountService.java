package it.othala.service;

import it.othala.account.execption.BadCredentialException;
import it.othala.account.execption.DuplicateUserException;
import it.othala.account.execption.MailNotSendException;
import it.othala.account.execption.UserAlReadyActivatedException;
import it.othala.account.execption.UserNotActivatedException;
import it.othala.account.execption.UserNotFoundException;
import it.othala.account.execption.UserNotResetStateException;
import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dto.AccountDTO;
import it.othala.enums.TypeCustomerState;
import it.othala.service.interfaces.IAccountService;
import it.othala.service.interfaces.IMailService;
import it.othala.service.interfaces.INewsletterService;
import it.othala.service.template.Template;
import it.othala.service.template.Template.TipoTemplate;
import it.othala.util.HelperCrypt;

import java.io.IOException;

public class AccountService implements IAccountService {

	private IAccountDAO accountDAO;
	private IMailService mailService;
	private INewsletterService newsService;
	private final String CUSTOMER_ROLE = "CUSTOMER";

	public void setMailService(IMailService mailService) {
		this.mailService = mailService;
	}

	public void setNewsService(INewsletterService newsService) {
		this.newsService = newsService;
	}

	public void setAccountDAO(IAccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	@Override
	public AccountDTO loginAccount(String mail, String pswd) throws BadCredentialException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registerAccount(AccountDTO account) throws DuplicateUserException, BadCredentialException,
			MailNotSendException {

		if (accountDAO.existAccount(account.getEmail()) > 0) {
			throw new DuplicateUserException(account.getEmail());
		}

		accountDAO.insertAccount(account);
		accountDAO.insertAccountRole(account.getEmail(), CUSTOMER_ROLE);

		if (account.isNewsletter()) {
			newsService.insertNewsletter(account.getEmail());
		}

		//inviaMailRegistrazione(account.getEmail(),account.getName(),account.getPsw());

	}

	@Override
	public void resetPasswordAccount(String email) throws UserNotFoundException, MailNotSendException,
			UserNotActivatedException {
		// TODO Auto-generated method stub

		if (accountDAO.existAccount(email) == 0) {
			throw new UserNotFoundException(email);
		}

		if (accountDAO.getAccount(email).getState() != TypeCustomerState.ATTIVATO.getState()) {
			throw new UserNotActivatedException(email);
		}

		accountDAO.changeStateAccount(email, TypeCustomerState.RESET_PSW.getState());
		inviaResetMailRegistrazione(email);
	}

	@Override
	public void removeAccount(AccountDTO account) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyAccount(String OldEmail, AccountDTO account) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	private void inviaMailRegistrazione(String email,String name,String psw) throws MailNotSendException {
		String content;
		try {
			content = Template.getContenFile(TipoTemplate.MailRegistrazione);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}
		content = content.replaceAll("<MAIL>", email);
		content = content.replaceAll("<NAME>", name);
		content = content.replaceAll("<PSW>", psw);
		content = content.replaceAll("<SITE>", ConfigurationService.getProperty(ConfigurationService.DNS_SITE));
		content = content.replaceAll("<COMPANY_NAME>",
				ConfigurationService.getProperty(ConfigurationService.COMPANY_NAME));
		content = content.replaceAll("<CONTEXT_ROOT>",
				ConfigurationService.getProperty(ConfigurationService.CONTEXT_ROOT));
		content = content.replaceAll("<BOARD_URL>", ConfigurationService.getProperty(ConfigurationService.BOARD_URL));
		String encryptMail = HelperCrypt.encrypt(email);
		content = content.replaceAll("<USER>", encryptMail);
		mailService.inviaMail(new String[] { email },
				"Welcome " + ConfigurationService.getProperty(ConfigurationService.COMPANY_NAME), content);
	}

	private void inviaResetMailRegistrazione(String email) throws MailNotSendException {
		String content = null;
		String encryptMail = null;
		try {
			content = Template.getContenFile(TipoTemplate.MailResetPSW);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}

		content = content.replaceAll("<SITE>", ConfigurationService.getProperty(ConfigurationService.DNS_SITE));
		content = content.replaceAll("<CONTEXT_ROOT>",
				ConfigurationService.getProperty(ConfigurationService.CONTEXT_ROOT));

		encryptMail = HelperCrypt.encrypt(email);
		content = content.replaceAll("<USER>", encryptMail);
		String subject = "Reset Password ";
		subject += ConfigurationService.getProperty(ConfigurationService.COMPANY_NAME);

		mailService.inviaMail(new String[] { email }, subject, content);
	}

	@Override
	public void activatedAccount(String email) throws UserNotFoundException, UserAlReadyActivatedException {
		// TODO Auto-generated method stub
		// INSERIRE LA VERIFICA SEL L'UTENTE è GIA PIN STATO ATTIVAZIONE
		AccountDTO acc = accountDAO.getAccount(email);

		if (acc == null) {
			throw new UserNotFoundException(email);
		}

		if (acc.getState() == TypeCustomerState.ATTIVATO.getState()) {
			throw new UserAlReadyActivatedException(email);

		}

		int res = accountDAO.changeStateAccount(email, TypeCustomerState.ATTIVATO.getState());
		if (res == 0) {
			// INSERIRE UN MESSAGGIO DEL LANGUAGE.
			throw new UserNotFoundException(email);
		}
	}

	@Override
	public void changePassworResetdAccount(String email, String psw) throws UserNotFoundException,
			UserNotResetStateException {
		// TODO Auto-generated method stub
		AccountDTO acc = accountDAO.getAccount(email);

		if (acc == null) {
			throw new UserNotFoundException(email);
		}

		if (acc.getState() != TypeCustomerState.RESET_PSW.getState()) {
			throw new UserNotFoundException(email);
		}

		accountDAO.updatePassword(email, psw);

		accountDAO.changeStateAccount(email, TypeCustomerState.ATTIVATO.getState());
	}

	@Override
	public AccountDTO verifyPasswordAccount(String email, String psw) throws BadCredentialException {
		if (email == null || email.isEmpty() || psw == null || psw.isEmpty()) {
			throw new BadCredentialException();
		} 
		AccountDTO name=accountDAO.verifyPassword(email, psw);
		if (name == null || name.getEmail().isEmpty()) {
			throw new BadCredentialException();
		}
		return name;

	}

}
