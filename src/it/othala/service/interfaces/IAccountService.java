package it.othala.service.interfaces;

import it.othala.account.execption.BadCredentialException;
import it.othala.account.execption.DuplicateUserException;
import it.othala.account.execption.MailNotSendException;
import it.othala.account.execption.UserAlReadyActivatedException;
import it.othala.account.execption.UserNotActivatedException;
import it.othala.account.execption.UserNotFoundException;
import it.othala.account.execption.UserNotResetStateException;
import it.othala.dto.AccountDTO;
import it.othala.dto.MailPropertiesDTO;
import it.othala.execption.OthalaException;

import java.util.List;

public interface IAccountService {

	public AccountDTO loginAccount(String mail, String pswd) throws BadCredentialException;

	public void registerAccount(AccountDTO account, MailPropertiesDTO mailProps) throws DuplicateUserException,
			BadCredentialException, MailNotSendException;

	public void resetPasswordAccount(String email, MailPropertiesDTO mailProps) throws UserNotFoundException,
			UserNotActivatedException, MailNotSendException;

	public void changePassworResetdAccount(String email, String psw) throws UserNotFoundException,
			UserNotResetStateException;
	public void changePassworAccount(String email, String psw) throws UserNotFoundException;

	
	public int removeAccount(List<AccountDTO> account) ;
	
	public int activeAccount(List<AccountDTO> account) ;

	public void modifyAccount(String OldEmail, AccountDTO account) throws BadCredentialException;

	public void activatedAccount(String email) throws UserNotFoundException, UserAlReadyActivatedException;

	public AccountDTO verifyPasswordAccount(String email, String psw) throws BadCredentialException;

	public List<AccountDTO> findAccount(String surname, String name);

	public AccountDTO findAccount(String email);

	public List<AccountDTO> listAccount();

	public void richiediFidelity(String nome, String cognome, String email, String cell, String emailMerchant,
			String site, MailPropertiesDTO mail) throws MailNotSendException;

}
