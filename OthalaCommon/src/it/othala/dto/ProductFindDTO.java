package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.util.List;

public class ProductFindDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idProduct;
	
	private List<String> listTxBarcode;

	private Integer idProductState;
	private String txProductState;
	
	private List <ShopDTO> listShop;
	

	private Integer idGender;
	private String txGender;

	private Integer idType;
	private String txType;

	private Integer idBrand;
	private String txBrand;
	private BigDecimal imPrice;
	
	private BigDecimal priceDiscounted;
	private String description;
	
	private Date dtProductstate;
		
	private String thumbnailsUrl;

	public Integer getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(Integer idProduct) {
		this.idProduct = idProduct;
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

	public Date getDtProductstate() {
		return dtProductstate;
	}

	public void setDtProductstate(Date dtProductstate) {
		this.dtProductstate = dtProductstate;
	}

	public String getThumbnailsUrl() {
		return thumbnailsUrl;
	}

	public void setThumbnailsUrl(String thumbnailsUrl) {
		this.thumbnailsUrl = thumbnailsUrl;
	}

	public BigDecimal getImPrice() {
		return imPrice;
	}

	public void setImPrice(BigDecimal imPrice) {
		this.imPrice = imPrice;
	}
	
	


}
