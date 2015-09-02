package it.othala.dto;

import java.io.Serializable;
import java.sql.Timestamp;

public class FidelityCardDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String idFidelity;
	private String txNome;
	private String txCognome;
	private Timestamp dtRilascio;
	private String txEmail;
	private String txTel;
	private int pcSconto;
	
	public String getIdFidelity() {
		return idFidelity;
	}
	public void setIdFidelity(String idFidelity) {
		this.idFidelity = idFidelity;
	}
	public String getTxNome() {
		return txNome;
	}
	public void setTxNome(String txNome) {
		this.txNome = txNome;
	}
	public String getTxCognome() {
		return txCognome;
	}
	public void setTxCognome(String txCognome) {
		this.txCognome = txCognome;
	}
	public Timestamp getDtRilascio() {
		return dtRilascio;
	}
	public void setDtRilascio(Timestamp dtRilascio) {
		this.dtRilascio = dtRilascio;
	}
	public String getTxEmail() {
		return txEmail;
	}
	public void setTxEmail(String txEmail) {
		this.txEmail = txEmail;
	}
	public String getTxTel() {
		return txTel;
	}
	public void setTxTel(String txTel) {
		this.txTel = txTel;
	}
	public int getPcSconto() {
		return pcSconto;
	}
	public void setPcSconto(int pcSconto) {
		this.pcSconto = pcSconto;
	}
}
