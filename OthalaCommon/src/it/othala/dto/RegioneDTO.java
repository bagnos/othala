package it.othala.dto;

import java.io.Serializable;
import java.util.List;

public class RegioneDTO implements Serializable {


	public Integer getIdRegione() {
		return idRegione;
	}
	public void setIdRegione(Integer idRegione) {
		this.idRegione = idRegione;
	}
	public String getTxRegione() {
		return txRegione;
	}
	public void setTxRegione(String txRegione) {
		this.txRegione = txRegione;
	}
	public List<ProvinciaDTO> getProvince() {
		return province;
	}
	public void setProvince(List<ProvinciaDTO> province) {
		this.province = province;
	}
	private static final long serialVersionUID = 1L;

	private Integer idRegione;
	private String txRegione;
	private List<ProvinciaDTO> province;


	
	
}
