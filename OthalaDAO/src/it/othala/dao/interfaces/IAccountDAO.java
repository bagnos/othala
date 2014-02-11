package it.othala.dao.interfaces;

import it.othala.dto.AccountDTO;

public interface IAccountDAO {

	public int insertAccount(AccountDTO account); 

	public int existAccount(String email);
	
	public int deleteAccount(String email);
	
	public int updateAccount(String email, AccountDTO account);
	
	public int updatePsw(String email, String psw);

}
