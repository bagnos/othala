package it.othala.dto;

import java.io.Serializable;
import java.util.Date;

public class CampaignDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idCampaign;
	private String txCampaign;
	private Date dtInizio;
	private Date dtFine;
	private Integer pcSconto;
	public Integer getIdCampaign() {
		return idCampaign;
	}
	public void setIdCampaign(Integer idCampaign) {
		this.idCampaign = idCampaign;
	}
	public String getTxCampaign() {
		return txCampaign;
	}
	public void setTxCampaign(String txCampaign) {
		this.txCampaign = txCampaign;
	}
	public Date getDtInizio() {
		return dtInizio;
	}
	public void setDtInizio(Date dtInizio) {
		this.dtInizio = dtInizio;
	}
	public Date getDtFine() {
		return dtFine;
	}
	public void setDtFine(Date dtFine) {
		this.dtFine = dtFine;
	}
	public Integer getPcSconto() {
		return pcSconto;
	}
	public void setPcSconto(Integer pcSconto) {
		this.pcSconto = pcSconto;
	}

}
