package it.othala.service.interfaces;

import it.othala.dto.AccountDTO;
import it.othala.execption.BadCredentialException;
import it.othala.execption.DuplicateUserException;
import it.othala.execption.MailNotSendException;
import it.othala.execption.UserAlReadyActivatedException;
import it.othala.execption.UserNotFoundException;

public interface IAccountService {

	public void loginAccoun(String mail, String pswd) throws BadCredentialException;

	public void registerAccount(AccountDTO account) throws DuplicateUserException, BadCredentialException, MailNotSendException;
	

	public void resetPsswordAccount(String email)  throws UserNotFoundException, MailNotSendException;
	
	public void changePsswordAccount(String email,String psw)  throws UserNotFoundException;
	
	public void removeAccount(AccountDTO account) throws BadCredentialException;

	public void modifyAccount(String OldEmail, AccountDTO account) throws BadCredentialException;
	
	public void activatedAccount(String email) throws UserNotFoundException,UserAlReadyActivatedException;

}
