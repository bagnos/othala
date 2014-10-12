package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

public class ProductFullNewDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idProduct;
	private BigDecimal price;
	private Integer discount;
	private BigDecimal priceDiscounted;
	private BigDecimal specialPrice;

	private String description;
	private String descriptionEN;

	private String thumbnailsUrl;

	private Integer idGender;
	private String txGender;

	private Integer idType;
	private String txType;

	private Integer idBrand;
	private String txBrand;

	private BigDecimal realPrice;
	private BigDecimal imRisparmio;

	private String merchantCode;

	private Integer idCampaign;

	private Integer idMaterial;
	private String txMaterial;

	private List<DescriptionDTO> langDescription;

	private List<String> imagesUrl;

	private List<ArticleFullDTO> articles;

	private Boolean fgNewArrivals;

	private List<String> size = new ArrayList<>();
	private List<String> color = new ArrayList<>();

	// da eliminare, il prodotto ha sempre comunque un articolo
	private List<String> listTxBarcode;

	private Integer idProductState;
	private String txProductState;

	private List<ShopDTO> listShop;

	private Date dtProductstate;

	public String getColorsAsString() {
		return StringUtils.collectionToCommaDelimitedString(color);
	}

	public String getSizesAsString() {
		return StringUtils.collectionToCommaDelimitedString(size);
	}

	public void setSize(List<String> size) {
		this.size = size;
	}

	public List<String> getColor() {
		return color;
	}

	public List<String> getSize() {
		return size;
	}

	public void setColor(List<String> color) {
		this.color = color;
	}

	public Integer getIdProduct() {
		return idProduct;
	}

	public BigDecimal getRealPrice() {
		realPrice = priceDiscounted != null ? priceDiscounted : price;
		realPrice = realPrice.setScale(2, RoundingMode.HALF_UP);
		return realPrice;
	}

	public BigDecimal getImRisparmio() {

		imRisparmio = price.subtract(priceDiscounted);
		imRisparmio = imRisparmio.setScale(2, RoundingMode.HALF_UP);
		return imRisparmio;
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

	public Integer getIdCampaign() {
		return idCampaign;
	}

	public void setIdCampaign(Integer idCampaign) {
		this.idCampaign = idCampaign;
	}

	public String getDescriptionEN() {
		return descriptionEN;
	}

	public void setDescriptionEN(String descriptionEN) {
		this.descriptionEN = descriptionEN;
	}

	public Integer getIdMaterial() {
		return idMaterial;
	}

	public void setIdMaterial(Integer idMaterial) {
		this.idMaterial = idMaterial;
	}

	public String getTxMaterial() {
		return txMaterial;
	}

	public void setTxMaterial(String txMaterial) {
		this.txMaterial = txMaterial;
	}

	public BigDecimal getSpecialPrice() {
		return specialPrice;
	}

	public void setSpecialPrice(BigDecimal specialPrice) {
		this.specialPrice = specialPrice;
	}

	public String getMerchantCode() {
		if (merchantCode == null && idProduct != null) {
			return idProduct.toString();
		}
		return merchantCode;
	}

	public void setMerchantCode(String merchantCode) {
		this.merchantCode = merchantCode;
	}

	public List<String> getListTxBarcode() {
		return listTxBarcode;
	}

	public void setListTxBarcode(List<String> listTxBarcode) {
		this.listTxBarcode = listTxBarcode;
	}

	public Integer getIdProductState() {
		return idProductState;
	}

	public void setIdProductState(Integer idProductState) {
		this.idProductState = idProductState;
	}

	public String getTxProductState() {
		return txProductState;
	}

	public void setTxProductState(String txProductState) {
		this.txProductState = txProductState;
	}

	public List<ShopDTO> getListShop() {
		return listShop;
	}

	public void setListShop(List<ShopDTO> listShop) {
		this.listShop = listShop;
	}

	public Date getDtProductstate() {
		return dtProductstate;
	}

	public void setDtProductstate(Date dtProductstate) {
		this.dtProductstate = dtProductstate;
	}

}
