package it.othala.dto;

import java.io.Serializable;

public class AccountDTO implements Serializable  {

	private static final long serialVersionUID = 1L;
	private String email;
	private String psw;
	private String telCell;
	private String nome;
	private String cognome;
	private String indirizzo;
	private String loc;
	private String prov;
	private String cap;
	
	public String getCap() {
		return cap;
	}
	public void setCap(String cap) {
		this.cap = cap;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public String getTelCell() {
		return telCell;
	}
	public void setTelCell(String telCell) {
		this.telCell = telCell;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getProv() {
		return prov;
	}
	public void setProv(String prov) {
		this.prov = prov;
	}
	
	

}
