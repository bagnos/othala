package it.othala.service.interfaces;

import it.othala.account.execption.BadCredentialException;
import it.othala.account.execption.DuplicateUserException;
import it.othala.dto.AccountDTO;

public interface IAccountService {

	public void loginAccoun(String mail, String pswd) throws BadCredentialException;

	public void registerAccount(AccountDTO account) throws DuplicateUserException, BadCredentialException;

	public void resetPsswordAccount(String email) throws BadCredentialException;
	
	public void removeAccount(AccountDTO account) throws BadCredentialException;

	public void modifyAccount(String OldEmail, AccountDTO account) throws BadCredentialException;

}
