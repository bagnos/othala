package it.othala.dao.interfaces;

import it.othala.dto.AccountDTO;
import it.othala.dto.MailDTO;
import it.othala.dto.MailGroupDTO;

import java.util.List;

public interface IAccountDAO {

	public int insertAccount(AccountDTO account);
	
	public int insertAccountRole(String email,String role);

	public int existAccount(String email);

	public AccountDTO getAccount(String email);

	public int deleteAccount(String email);

	public int updateAccount(String email, AccountDTO account);
	
	public int updatePassword(String email, String psw);

	public int changeStateAccount(List<String> email, int Stato);
	
	public int changeStateAccount(String email, int Stato);

	public int updatePsw(String email, String psw);
	
	public AccountDTO verifyPassword(String email, String psw);
	
	public List<AccountDTO> getAccount();
	
	public List<AccountDTO> getAccount(String cognome,String nome);

	public void	insertMail(Integer idMailGroup, String txUser, String txNome);

	public void updateMail(Integer idMail, Integer idMailGroup, String txUser, String txNome);

	public void deleteMail(Integer idMail);

	public void insertMailGroup(String txMailGroup);

	public void updateMailGroup(Integer idMailGroup, String txMailGroup);

	public void deleteMailGroup(Integer idMailGroup);

	public List<MailGroupDTO> listMailGroup(Integer idMailGroup);

	public List<MailDTO> listMail(Integer idMailGroup, String txUser);
	
	

}
