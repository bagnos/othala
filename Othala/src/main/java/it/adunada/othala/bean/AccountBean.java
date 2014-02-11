package it.adunada.othala.bean;



import it.othala.dto.AccountDTO;

import javax.faces.bean.ManagedBean;

@ManagedBean(name="accountBean")
public class AccountBean extends BaseBean {

	
	private static final long serialVersionUID = 1L;
	private AccountDTO accountDTO;
	public AccountDTO getAccountDTO() {
		return accountDTO;
	}
	public void setAccountDTO(AccountDTO accountDTO) {
		this.accountDTO = accountDTO;
	}

}
