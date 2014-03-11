package it.othala.service.interfaces;

import it.othala.account.execption.BadCredentialException;
import it.othala.account.execption.DuplicateUserException;
import it.othala.account.execption.MailNotSendException;
import it.othala.account.execption.UserAlReadyActivatedException;
import it.othala.account.execption.UserNotActivatedException;
import it.othala.account.execption.UserNotFoundException;
import it.othala.account.execption.UserNotResetStateException;
import it.othala.dto.AccountDTO;

public interface IAccountService {

	public void loginAccoun(String mail, String pswd) throws BadCredentialException;

	public void registerAccount(AccountDTO account) throws DuplicateUserException, BadCredentialException, MailNotSendException;
	

	public void resetPasswordAccount(String email)  throws UserNotFoundException,UserNotActivatedException, MailNotSendException;
	
	public void changePassworResetdAccount(String email,String psw)  throws UserNotFoundException,UserNotResetStateException;
	
	public void removeAccount(AccountDTO account) throws BadCredentialException;

	public void modifyAccount(String OldEmail, AccountDTO account) throws BadCredentialException;
	
	public void activatedAccount(String email) throws UserNotFoundException,UserAlReadyActivatedException;
	
	public String verifyPasswordAccount(String email,String psw) throws BadCredentialException;

}
