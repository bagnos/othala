package it.othala.dto;

import java.io.Serializable;
import java.util.List;

public class MenuDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int idGender;
	private String txGender;
	private String imgLibrary;
	private String imgName;
	
	private List<SubMenuDTO> subMenu;

	public int getIdGender() {
		return idGender;
	}

	public void setIdGender(int idGender) {
		this.idGender = idGender;
	}

	public String getTxGender() {
		return txGender;
	}

	public void setTxGender(String txGender) {
		this.txGender = txGender;
	}

	public List<SubMenuDTO> getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(List<SubMenuDTO> subMenu) {
		this.subMenu = subMenu;
	}

	public String getImgLibrary() {
		return imgLibrary;
	}

	public void setImgLibrary(String imgLibrary) {
		this.imgLibrary = imgLibrary;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

}
