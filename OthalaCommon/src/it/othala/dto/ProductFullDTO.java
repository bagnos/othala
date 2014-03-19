package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class ProductFullDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idProduct;
	private BigDecimal price;
	private Integer discount;
	private BigDecimal priceDiscounted;
	private String description;
	private String thumbnailsUrl;

	private Integer idGender;
	private Integer pgGender;
	private String txDescGender;
	private String txGender;

	private Integer idType;
	private Integer pgType;
	private String txDescType;
	private String txType;

	private Integer idBrand;
	private Integer pgBrand;
	private String txDescBrand;
	private String txBrand;

	private List<DescriptionDTO> langDescription;

	private List<String> imagesUrl;

	private List<ArticleFullDTO> articles;

	private Boolean fgNewArrivals;

	public Integer getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(Integer idProduct) {
		this.idProduct = idProduct;
	}

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getIdGender() {
		return idGender;
	}

	public void setIdGender(Integer idGender) {
		this.idGender = idGender;
	}

	public Integer getPgGender() {
		return pgGender;
	}

	public void setPgGender(Integer pgGender) {
		this.pgGender = pgGender;
	}

	public String getTxGender() {
		return txGender;
	}

	public void setTxGender(String txGender) {
		this.txGender = txGender;
	}

	public Integer getIdType() {
		return idType;
	}

	public void setIdType(Integer idType) {
		this.idType = idType;
	}

	public Integer getPgType() {
		return pgType;
	}

	public void setPgType(Integer pgType) {
		this.pgType = pgType;
	}

	public String getTxType() {
		return txType;
	}

	public void setTxType(String txType) {
		this.txType = txType;
	}

	public Integer getIdBrand() {
		return idBrand;
	}

	public void setIdBrand(Integer idBrand) {
		this.idBrand = idBrand;
	}

	public Integer getPgBrand() {
		return pgBrand;
	}

	public void setPgBrand(Integer pgBrand) {
		this.pgBrand = pgBrand;
	}

	public String getTxBrand() {
		return txBrand;
	}

	public void setTxBrand(String txBrand) {
		this.txBrand = txBrand;
	}


	public List<ArticleFullDTO> getArticles() {
		return articles;
	}

	public void setArticles(List<ArticleFullDTO> articles) {
		this.articles = articles;
	}

	public Boolean getFgNewArrivals() {
		return fgNewArrivals;
	}

	public void setFgNewArrivals(Boolean fgNewArrivals) {
		this.fgNewArrivals = fgNewArrivals;
	}

	public String getTxDescGender() {
		return txDescGender;
	}

	public void setTxDescGender(String txDescGender) {
		this.txDescGender = txDescGender;
	}

	public String getTxDescType() {
		return txDescType;
	}

	public void setTxDescType(String txDescType) {
		this.txDescType = txDescType;
	}

	public String getTxDescBrand() {
		return txDescBrand;
	}

	public void setTxDescBrand(String txDescBrand) {
		this.txDescBrand = txDescBrand;
	}

	public String getThumbnailsUrl() {
		return thumbnailsUrl;
	}

	public void setThumbnailsUrl(String thumbnailsUrl) {
		this.thumbnailsUrl = thumbnailsUrl;
	}



	public List<String> getImagesUrl() {
		return imagesUrl;
	}

	public void setImagesUrl(List<String> imagesUrl) {
		this.imagesUrl = imagesUrl;
	}

	public List<DescriptionDTO> getLangDescription() {
		return langDescription;
	}

	public void setLangDescription(List<DescriptionDTO> langDescription) {
		this.langDescription = langDescription;
	}



}
