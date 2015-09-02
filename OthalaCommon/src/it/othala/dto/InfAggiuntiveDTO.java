package it.othala.dto;

import java.io.Serializable;

public class InfAggiuntiveDTO implements Serializable {

	public Integer getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(Integer idProduct) {
		this.idProduct = idProduct;
	}
	public String getIdLanguages() {
		return idLanguages;
	}
	public void setIdLanguages(String idLanguages) {
		this.idLanguages = idLanguages;
	}
	public Integer getIdInformazione() {
		return idInformazione;
	}
	public void setIdInformazione(Integer idInformazione) {
		this.idInformazione = idInformazione;
	}
	public String getTxInformazione() {
		return txInformazione;
	}
	public void setTxInformazione(String txInformazione) {
		this.txInformazione = txInformazione;
	}
	public String getTxDescrizione() {
		return txDescrizione;
	}
	public void setTxDescrizione(String txDescrizione) {
		this.txDescrizione = txDescrizione;
	}
	public String getTxInformazioneIT() {
		return txInformazioneIT;
	}
	public void setTxInformazioneIT(String txInformazioneIT) {
		this.txInformazioneIT = txInformazioneIT;
	}
	public String getTxDescrizioneIT() {
		return txDescrizioneIT;
	}
	public void setTxDescrizioneIT(String txDescrizioneIT) {
		this.txDescrizioneIT = txDescrizioneIT;
	}
	public String getTxInformazioneEN() {
		return txInformazioneEN;
	}
	public void setTxInformazioneEN(String txInformazioneEN) {
		this.txInformazioneEN = txInformazioneEN;
	}
	public String getTxDescrizioneEN() {
		return txDescrizioneEN;
	}
	public void setTxDescrizioneEN(String txDescrizioneEN) {
		this.txDescrizioneEN = txDescrizioneEN;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idProduct;
	private String idLanguages;
	private Integer idInformazione;
	private String txInformazione;
	private String txDescrizione;
	
	private String txInformazioneIT;
	private String txDescrizioneIT;
	
	private String txInformazioneEN;
	private String txDescrizioneEN;
	
	
	
	
}
