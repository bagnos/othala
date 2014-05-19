package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class ArticleFullDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer pgArticle;
	private Integer qtStock;
	private Integer idSize;
	private String txSize;
	private Integer idColor;
	private String txColor;
	private ProductFullDTO prdFullDTO;
	private Integer qtBooked;
	private BigDecimal totalPriced;
	private String thumbnailsUrl;
	private ShopDTO shop;
	private String txBarCode;

	public BigDecimal getTotalPriced() {
		if (prdFullDTO != null) {
			totalPriced = prdFullDTO.getPriceDiscounted() != null ? prdFullDTO.getPriceDiscounted() : prdFullDTO
					.getPrice();
			totalPriced=totalPriced.multiply(new BigDecimal(qtBooked));			
		}
		return totalPriced;
	}

	public Integer getQtBooked() {
		return qtBooked;
	}

	public void setQtBooked(Integer qtBooked) {
		this.qtBooked = qtBooked;
	}

	public ProductFullDTO getPrdFullDTO() {
		return prdFullDTO;
	}

	public void setPrdFullDTO(ProductFullDTO prdFullDTO) {
		this.prdFullDTO = prdFullDTO;
	}

	public Integer getPgArticle() {
		return pgArticle;
	}

	public void setPgArticle(Integer pgArticle) {
		this.pgArticle = pgArticle;
	}

	public Integer getQtStock() {
		return qtStock;
	}

	public void setQtStock(Integer qtStock) {
		this.qtStock = qtStock;
	}

	public Integer getIdSize() {
		return idSize;
	}

	public void setIdSize(Integer idSize) {
		this.idSize = idSize;
	}

	public String getTxSize() {
		return txSize;
	}

	public void setTxSize(String txSize) {
		this.txSize = txSize;
	}

	public Integer getIdColor() {
		return idColor;
	}

	public void setIdColor(Integer idColor) {
		this.idColor = idColor;
	}

	public String getTxColor() {
		return txColor;
	}

	public void setTxColor(String txColor) {
		this.txColor = txColor;
	}

	public String getThumbnailsUrl() {
		return thumbnailsUrl;
	}

	public void setThumbnailsUrl(String thumbnailsUrl) {
		this.thumbnailsUrl = thumbnailsUrl;
	}

	public ShopDTO getShop() {
		return shop;
	}

	public void setShop(ShopDTO shop) {
		this.shop = shop;
	}

	public String getTxBarCode() {
		return txBarCode;
	}

	public void setTxBarCode(String txBarCode) {
		this.txBarCode = txBarCode;
	}

}
