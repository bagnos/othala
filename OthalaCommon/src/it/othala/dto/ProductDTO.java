package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

public class ProductDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer idProduct;
	private BigDecimal price;
	private String brand;
	private String imagesUrl;
	private List<String> size = new ArrayList<>();
	private BigDecimal priceRounded;
	private String descrption;
	private List<String> color = new ArrayList<>();
	private String genere;
	private String tipologia;
	private Integer pcSconto;
	
	
	public Integer getPcSconto() {
		return pcSconto;
	}

	public void setPcSconto(Integer pcSconto) {
		this.pcSconto = pcSconto;
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


	public void setSize(List<String> size) {
		this.size = size;
	}

	public List<String> getColor() {
		return color;
	}

	public String getDescrption() {
		return descrption;
	}

	public void setDescrption(String descrption) {
		this.descrption = descrption;
	}

	public BigDecimal getPriceRounded() {
		priceRounded = null;
		BigDecimal discount = new BigDecimal(pcSconto / 100);
		if (price != null) {
			priceRounded = (price.multiply(discount)).setScale(2, RoundingMode.HALF_UP);
		}

		return priceRounded;
	}

	public List<String> getSize() {
		return size;
	}

	public String getImagesUrl() {
		return imagesUrl;
	}

	public void setImagesUrl(String imagesUrl) {
		this.imagesUrl = imagesUrl;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Integer getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(Integer idProduct) {
		this.idProduct = idProduct;
	}

	public void setColor(List<String> color) {
		this.color = color;
	}

}
