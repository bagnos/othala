package it.othala.dto;

import java.io.Serializable;

public class ProductCarouselDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ProductDTO product1;
	private ProductDTO product2;
	private ProductDTO product3;
	private ProductDTO product4;

	public ProductDTO getProduct1() {
		return product1;
	}

	public void setProduct1(ProductDTO product1) {
		this.product1 = product1;
	}

	public ProductDTO getProduct2() {
		return product2;
	}

	public void setProduct2(ProductDTO product2) {
		this.product2 = product2;
	}

	public ProductDTO getProduct3() {
		return product3;
	}

	public void setProduct3(ProductDTO product3) {
		this.product3 = product3;
	}

	public ProductDTO getProduct4() {
		return product4;
	}

	public void setProduct4(ProductDTO product4) {
		this.product4 = product4;
	}

}
