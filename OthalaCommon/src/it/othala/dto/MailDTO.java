package it.othala.dto;

import java.io.Serializable;

public class MailDTO implements Serializable {

	public Integer getIdMail() {
		return idMail;
	}
	public void setIdMail(Integer idMail) {
		this.idMail = idMail;
	}
	public Integer getIdMailGroup() {
		return idMailGroup;
	}
	public void setIdMailGroup(Integer idMailGroup) {
		this.idMailGroup = idMailGroup;
	}
	public String getTxUser() {
		return txUser;
	}
	public void setTxUser(String txUser) {
		this.txUser = txUser;
	}
	public String getTxNome() {
		return txNome;
	}
	public void setTxNome(String txNome) {
		this.txNome = txNome;
	}
	private static final long serialVersionUID = 1L;

	private Integer idMail;
	private Integer idMailGroup;
	private String txUser;
	private String txNome;


	
	
}
