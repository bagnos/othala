package it.othala.service;

import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dto.AccountDTO;
import it.othala.execption.BadCredentialException;
import it.othala.execption.DuplicateUserException;
import it.othala.execption.MailNotSendException;
import it.othala.service.interfaces.IAccountService;
import it.othala.service.interfaces.IMailService;

public class AccountService implements IAccountService {

	private IAccountDAO accountDAO;
	private IMailService mailService;

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
		mailService.inviaMail(null, null, null, null);
		
	}

	@Override
	public void resetPsswordAccount(String email) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeAccount(AccountDTO account) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyAccount(String OldEmail, AccountDTO account) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

}
