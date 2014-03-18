package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

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
	private String description;
	private List<String> color = new ArrayList<>();
	private String gender;
	private String type;
	private Integer discount;
		

	public String getColorsAsString() {
		return StringUtils.collectionToCommaDelimitedString(color);
	}

	public String getSizesAsString() {
		return StringUtils.collectionToCommaDelimitedString(size);
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public void setSize(List<String> size) {
		this.size = size;
	}

	public List<String> getColor() {
		return color;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String descrption) {
		this.description = descrption;
	}

	public BigDecimal getPriceRounded() {
		priceRounded = null;
		BigDecimal discount2 = new BigDecimal(discount / 100);
		if (price != null) {
			priceRounded = (price.multiply(discount2)).setScale(2, RoundingMode.HALF_UP);
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
