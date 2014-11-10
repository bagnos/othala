package it.othala.dto;

import java.io.Serializable;
import java.util.List;

public class GroupImagesDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String txGroupImages;
	private String txLibrary;
	private Integer nrImages;
	private Integer maxHeight;
	private Integer maxWidth;

	private List<SiteImagesDTO> listImages;
	

	public String getTxLibrary() {
		return txLibrary;
	}

	public void setTxLibrary(String txLibrary) {
		this.txLibrary = txLibrary;
	}

	

	public String getTxGroupImages() {
		return txGroupImages;
	}

	public void setTxGroupImages(String txGroupImages) {
		this.txGroupImages = txGroupImages;
	}

	public Integer getNrImages() {
		return nrImages;
	}

	public void setNrImages(Integer nrImages) {
		this.nrImages = nrImages;
	}

	public Integer getMaxHeight() {
		return maxHeight;
	}

	public void setMaxHeight(Integer maxHeight) {
		this.maxHeight = maxHeight;
	}

	public List<SiteImagesDTO> getListImages() {
		return listImages;
	}

	public void setListImages(List<SiteImagesDTO> listImages) {
		this.listImages = listImages;
	}

	public Integer getMaxWidth() {
		return maxWidth;
	}

	public void setMaxWidth(Integer maxWidth) {
		this.maxWidth = maxWidth;
	}

	
}
