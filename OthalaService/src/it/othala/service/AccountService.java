package it.othala.service;

import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dto.AccountDTO;
import it.othala.enums.TypeCustomerState;
import it.othala.execption.BadCredentialException;
import it.othala.execption.DuplicateUserException;
import it.othala.execption.MailNotSendException;
import it.othala.execption.UserAlReadyActivatedException;
import it.othala.execption.UserNotFoundException;
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
	public void loginAccoun(String mail, String pswd) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	@Override
	public void registerAccount(AccountDTO account) throws DuplicateUserException, BadCredentialException,
			MailNotSendException {

		if (accountDAO.existAccount(account.getEmail()) > 0) {
			throw new DuplicateUserException(account.getEmail());
		}

		accountDAO.insertAccount(account);

		if (account.isNewsletter()) {
			newsService.insertNewsletter(account.getEmail());
		}

		inviaMailRegistrazione(account.getEmail());

	}

	@Override
	public void resetPsswordAccount(String email) throws UserNotFoundException, MailNotSendException {
		// TODO Auto-generated method stub
		if (accountDAO.existAccount(email)==0)
		{
			throw new UserNotFoundException(email);
		}
		accountDAO.changeStateAccount(email, TypeCustomerState.RESET_PSW.getState());
		resetMailRegistrazione(email);
	}

	@Override
	public void removeAccount(AccountDTO account) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyAccount(String OldEmail, AccountDTO account) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	private void inviaMailRegistrazione(String email) throws MailNotSendException {
		String content;
		try {
			content = Template.getContenFile(TipoTemplate.MailRegistrazione);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}
		content = content.replaceAll("<MAIL>", email);
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

	private void resetMailRegistrazione(String email) throws MailNotSendException {
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

		mailService.inviaMail(new String[] { email }, "Reset Password", content);
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
	public void changePsswordAccount(String email, String psw) throws UserNotFoundException{
		// TODO Auto-generated method stub
		AccountDTO acc = accountDAO.getAccount(email);

		if (acc == null) {
			throw new UserNotFoundException(email);
		}	
		
		accountDAO.updatePassword(email, psw);
		
		accountDAO.changeStateAccount(email, TypeCustomerState.ATTIVATO.getState());
	}

}
