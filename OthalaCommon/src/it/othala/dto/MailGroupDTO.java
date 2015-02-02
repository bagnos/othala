package it.othala.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class MailGroupDTO implements Serializable {




	public Integer getIdMailGroup() {
		return idMailGroup;
	}
	public void setIdMailGroup(Integer idMailGroup) {
		this.idMailGroup = idMailGroup;
	}
	public String getTxMailGroup() {
		return txMailGroup;
	}
	public void setTxMailGroup(String txMailGroup) {
		this.txMailGroup = txMailGroup;
	}
	private static final long serialVersionUID = 1L;

	private Integer idMailGroup;
	private String txMailGroup;


	
	
}
