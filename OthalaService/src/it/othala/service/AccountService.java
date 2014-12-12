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
import it.othala.dto.MailPropertiesDTO;
import it.othala.enums.TypeCustomerState;
import it.othala.service.interfaces.IAccountService;
import it.othala.service.interfaces.IMailService;
import it.othala.service.template.Template;
import it.othala.service.template.Template.TipoTemplate;
import it.othala.util.HelperCrypt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AccountService implements IAccountService {

	private IAccountDAO accountDAO;
	private IMailService mailService;
	
	private final String CUSTOMER_ROLE = "CUSTOMER";

	public void setMailService(IMailService mailService) {
		this.mailService = mailService;
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
	public void registerAccount(AccountDTO account, MailPropertiesDTO mailProps) throws DuplicateUserException,
			BadCredentialException, MailNotSendException {

		if (accountDAO.existAccount(account.getEmail()) > 0) {
			throw new DuplicateUserException(account.getEmail());
		}

		accountDAO.insertAccount(account);
		accountDAO.insertAccountRole(account.getEmail(), CUSTOMER_ROLE);

		

		inviaMailRegistrazione(account.getEmail(), account.getName(), account.getPsw(), mailProps);

	}

	@Override
	public void resetPasswordAccount(String email, MailPropertiesDTO mailProps) throws UserNotFoundException,
			MailNotSendException, UserNotActivatedException {
		// TODO Auto-generated method stub

		if (accountDAO.existAccount(email) == 0) {
			throw new UserNotFoundException(email);
		}

		if (accountDAO.getAccount(email).getState() != TypeCustomerState.ATTIVATO.getState()) {
			throw new UserNotActivatedException(email);
		}

		accountDAO.changeStateAccount(email, TypeCustomerState.RESET_PSW.getState());
		inviaResetMailRegistrazione(email, mailProps);
	}

	@Override
	public int removeAccount(List<AccountDTO> listAccount) {
		// TODO Auto-generated method stub
		List<String> email = new ArrayList<>();
		if (listAccount == null || listAccount.isEmpty()) {
			return 0;
		}
		for (AccountDTO acc : listAccount) {
			email.add(acc.getEmail());
		}
		return accountDAO.changeStateAccount(email, TypeCustomerState.CESSATO.getState());
	}
	
	@Override
	public int activeAccount(List<AccountDTO> listAccount) {
		// TODO Auto-generated method stub
		List<String> email = new ArrayList<>();
		if (listAccount == null || listAccount.isEmpty()) {
			return 0;
		}
		for (AccountDTO acc : listAccount) {
			email.add(acc.getEmail());
		}
		return accountDAO.changeStateAccount(email, TypeCustomerState.ATTIVATO.getState());
	}

	@Override
	public void modifyAccount(String OldEmail, AccountDTO account) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	private void inviaMailRegistrazione(String email, String name, String psw, MailPropertiesDTO mailProps)
			throws MailNotSendException {
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
		content = content.replaceAll("<SITE>", mailProps.getDnsSite());
		content = content.replaceAll("<COMPANY_NAME>", mailProps.getCompanyName());
		content = content.replaceAll("<CONTEXT_ROOT>", mailProps.getContextRoot());
		content = content.replaceAll("<BOARD_URL>", mailProps.getBoardUrl());
		String encryptMail = HelperCrypt.encrypt(email);
		content = content.replaceAll("<USER>", encryptMail);
		mailService.inviaMail(new String[] { email }, "Welcome " + mailProps.getCompanyName(), content, mailProps);
	}

	private void inviaResetMailRegistrazione(String email, MailPropertiesDTO mailPros) throws MailNotSendException {
		String content = null;
		String encryptMail = null;
		try {
			content = Template.getContenFile(TipoTemplate.MailResetPSW);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new MailNotSendException(e);
		}

		content = content.replaceAll("<SITE>", mailPros.getDnsSite());
		content = content.replaceAll("<CONTEXT_ROOT>", mailPros.getContextRoot());

		encryptMail = HelperCrypt.encrypt(email);
		content = content.replaceAll("<USER>", encryptMail);
		String subject = "Reset Password ";
		subject += mailPros.getCompanyName();

		mailService.inviaMail(new String[] { email }, subject, content, mailPros);
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
	public void changePassworAccount(String email, String psw) throws UserNotFoundException {
		// TODO Auto-generated method stub
		AccountDTO acc = accountDAO.getAccount(email);

		if (acc == null) {
			throw new UserNotFoundException(email);
		}

		accountDAO.updatePassword(email, psw);
	}

	@Override
	public AccountDTO verifyPasswordAccount(String email, String psw) throws BadCredentialException {
		if (email == null || email.isEmpty() || psw == null || psw.isEmpty()) {
			throw new BadCredentialException();
		}
		AccountDTO name = accountDAO.verifyPassword(email, psw);
		if (name == null || name.getEmail().isEmpty()) {
			throw new BadCredentialException();
		}
		return name;

	}

	@Override
	public List<AccountDTO> findAccount(String surname, String name) {
		// TODO Auto-generated method stub
		return accountDAO.getAccount(surname, name);
	}

	@Override
	public List<AccountDTO> listAccount() {
		// TODO Auto-generated method stub
		return accountDAO.getAccount();
	}

	@Override
	public AccountDTO findAccount(String email) {
		// TODO Auto-generated method stub
		return accountDAO.getAccount(email);
	}


	

	

}
