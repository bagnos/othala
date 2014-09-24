package it.othala.dto;

import java.io.Serializable;

public class ProductCarouselDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ProductFullNewDTO product1;
	private ProductFullNewDTO product2;
	private ProductFullNewDTO product3;
	private ProductFullNewDTO product4;

	public ProductFullNewDTO getProduct1() {
		return product1;
	}

	public void setProduct1(ProductFullNewDTO product1) {
		this.product1 = product1;
	}

	public ProductFullNewDTO getProduct2() {
		return product2;
	}

	public void setProduct2(ProductFullNewDTO product2) {
		this.product2 = product2;
	}

	public ProductFullNewDTO getProduct3() {
		return product3;
	}

	public void setProduct3(ProductFullNewDTO product3) {
		this.product3 = product3;
	}

	public ProductFullNewDTO getProduct4() {
		return product4;
	}

	public void setProduct4(ProductFullNewDTO product4) {
		this.product4 = product4;
	}

}
