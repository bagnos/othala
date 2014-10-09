package it.othala.dto;

import java.io.Serializable;

public class ArticleRefounded extends ArticleFullDTO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String fgChangeRefound;
	private String txChangeRefound;
	
	
	public ArticleRefounded(){
		super();
	};
	
	public ArticleRefounded(ArticleFullDTO artFull){
		this.setIdColor(artFull.getIdColor());
		this.setIdSize(artFull.getIdSize());
		this.setNote(artFull.getNote());
		this.setPgArticle(artFull.getPgArticle());
		this.setPrdFullDTO(artFull.getPrdFullDTO());
		this.setQtBooked(artFull.getQtBooked());
		this.setQtStock(artFull.getQtStock());
		this.setShop(artFull.getShop());
		this.setThumbnailsUrl(artFull.getThumbnailsUrl());
		this.setTxBarCode(artFull.getTxBarCode());
		this.setTxColor(artFull.getTxColor());
		this.setTxSize(artFull.getTxSize());
		this.setChangesAvailable(artFull.getChangesAvailable());
		this.setPgArticleChangeSelected(artFull.getPgArticleChangeSelected());
		
	};
	
	public String getFgChangeRefound() {
		return fgChangeRefound;
	}
	public void setFgChangeRefound(String fgChangeRefound) {
		this.fgChangeRefound = fgChangeRefound;
	}
	public String getTxChangeRefound() {
		return txChangeRefound;
	}
	public void setTxChangeRefound(String txChangeRefound) {
		this.txChangeRefound = txChangeRefound;
	}

	

	
}
