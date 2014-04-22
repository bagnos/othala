package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
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
	private String txGender;

	private Integer idType;
	private String txType;

	private Integer idBrand;
	private String txBrand;
	
	private BigDecimal realPrice;

	

	private List<DescriptionDTO> langDescription;

	private List<String> imagesUrl;

	private List<ArticleFullDTO> articles;

	private Boolean fgNewArrivals;

	public Integer getIdProduct() {
		return idProduct;
	}
	
	public BigDecimal getRealPrice() {
		realPrice=priceDiscounted!=null?priceDiscounted:price;
		realPrice=realPrice.setScale(2, RoundingMode.HALF_UP);
		return realPrice;
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
