package it.othala.model;

import it.othala.dto.AccountDTO;

import java.io.Serializable;

public abstract class BaseBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private AccountDTO accountDTO;
	public AccountDTO getAccountDTO() {
		return accountDTO;
	}
	public void setAccountDTO(AccountDTO accountDTO) {
		this.accountDTO = accountDTO;
	}


}
