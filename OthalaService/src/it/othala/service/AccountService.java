package it.othala.service;

import it.othala.account.execption.BadCredentialException;
import it.othala.account.execption.DuplicateUserException;
import it.othala.dto.AccountDTO;
import it.othala.service.interfaces.IAccountService;

public class AccountService implements IAccountService {

	@Override
	public void loginAccoun(String mail, String pswd) throws BadCredentialException {
		// TODO Auto-generated method stub

	}

	@Override
	public void subscribeAccount(AccountDTO account) throws DuplicateUserException, BadCredentialException {
		// TODO Auto-generated method stub

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
