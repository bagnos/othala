package it.othala.dao.interfaces;

import it.othala.dto.AccountDTO;

public interface IAccountDAO {

	public int insertAccount(AccountDTO account);
	
	public int insertAccountRole(String email,String role);

	public int existAccount(String email);

	public AccountDTO getAccount(String email);

	public int deleteAccount(String email);

	public int updateAccount(String email, AccountDTO account);
	
	public int updatePassword(String email, String psw);

	public int changeStateAccount(String email, int Stato);

	public int updatePsw(String email, String psw);
	
	public AccountDTO verifyPassword(String email, String psw);
	

}
