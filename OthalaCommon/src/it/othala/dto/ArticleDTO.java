package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

public class ArticleDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private BigDecimal price;
	private String brand;
	private String imagesUrl;
	private List<String> size = new ArrayList<>();
	private BigDecimal priceRounded;
	private String descrption;
	private List<String> color = new ArrayList<>();

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
		if (price != null) {
			priceRounded = price.setScale(2, RoundingMode.HALF_UP);
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

}
