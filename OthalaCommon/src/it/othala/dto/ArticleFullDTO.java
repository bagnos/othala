package it.othala.dto;

import it.othala.enums.ArticleUpdate;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class ArticleFullDTO implements Serializable {

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public BigDecimal getPriceDiscounted() {
		return priceDiscounted;
	}

	public void setPriceDiscounted(BigDecimal priceDiscounted) {
		this.priceDiscounted = priceDiscounted;
	}

	public BigDecimal getSpecialPrice() {
		return specialPrice;
	}

	public void setSpecialPrice(BigDecimal specialPrice) {
		this.specialPrice = specialPrice;
	}

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
	private ProductFullNewDTO prdFullDTO;
	private Integer qtBooked;
	
	private String thumbnailsUrl;
	private ShopDTO shop;
	private String txBarCode;
	private boolean selected;
	private String note;
	private List<ChangeArticleDTO> changesAvailable;
	private ArticleUpdate articleUpdate;
	private Integer pgArticleChangeSelected;
	private BigDecimal price;
	private Integer discount;
	private BigDecimal priceDiscounted;
	private BigDecimal specialPrice;
	
	public Integer getPgArticleChangeSelected() {
		return pgArticleChangeSelected;
	}

	public void setPgArticleChangeSelected(Integer pgArticleChangeSelected) {
		this.pgArticleChangeSelected = pgArticleChangeSelected;
	}

	public List<ChangeArticleDTO> getChangesAvailable() {
		return changesAvailable;
	}

	public void setChangesAvailable(List<ChangeArticleDTO> changesAvailable) {
		this.changesAvailable = changesAvailable;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}


	public Integer getQtBooked() {
		return qtBooked;
	}

	public void setQtBooked(Integer qtBooked) {
		this.qtBooked = qtBooked;
	}

	public ProductFullNewDTO getPrdFullDTO() {
		return prdFullDTO;
	}

	public void setPrdFullDTO(ProductFullNewDTO prdFullDTO) {
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

	public ArticleUpdate getArticleUpdate() {
		return articleUpdate;
	}

	public void setArticleUpdate(ArticleUpdate articleUpdate) {
		this.articleUpdate = articleUpdate;
	}

}
