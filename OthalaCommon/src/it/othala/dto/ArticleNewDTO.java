package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

public class ArticleNewDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idProduct;
	private String descrption;
	
	private BigDecimal price;
	private Integer discount;
	private BigDecimal discountedPrice;
	
	private String genere;
	private String tipologia;
	private String brand;
	
	private List<String> imagesUrl;
	
	
	private List<PiecesDTO> pieces = new ArrayList<>();
	
	private BigDecimal priceRounded;
	
	

	public BigDecimal getPriceRounded() {
		priceRounded = null;
		if (discountedPrice != null) {
			priceRounded = discountedPrice.setScale(2, RoundingMode.HALF_UP);
		}

		return priceRounded;
	}

	public BigDecimal getDiscountedPrice() {
		discountedPrice = null;
		if (price != null) {
			discountedPrice = price.multiply(new BigDecimal(discount)).divide(new BigDecimal(100));
		}

		return priceRounded;
	}

	public Integer getIdProduct() {
		return idProduct;
	}



	public void setIdProduct(Integer idProduct) {
		this.idProduct = idProduct;
	}



	public String getDescrption() {
		return descrption;
	}



	public void setDescrption(String descrption) {
		this.descrption = descrption;
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



	public String getGenere() {
		return genere;
	}



	public void setGenere(String genere) {
		this.genere = genere;
	}



	public String getTipologia() {
		return tipologia;
	}



	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}



	public String getBrand() {
		return brand;
	}



	public void setBrand(String brand) {
		this.brand = brand;
	}



	public List<String> getImagesUrl() {
		return imagesUrl;
	}



	public void setImagesUrl(List<String> imagesUrl) {
		this.imagesUrl = imagesUrl;
	}



	public List<PiecesDTO> getPieces() {
		return pieces;
	}



	public void setPieces(List<PiecesDTO> pieces) {
		this.pieces = pieces;
	}

	
}
