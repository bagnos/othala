package it.othala.cartflow.model;

import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Named;

@Named
@javax.faces.flow.FlowScoped("cartFlow")
public class CartFlowBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer nrProducts;
	private ProductDTO detailProduct;

	private List<ProductDTO> articles;
	private List<ProductDTO> articlesPage;
	private List<String> breadCrumb = new ArrayList<>();
	private ProductFullDTO detailProductFull;

	public ProductFullDTO getDetailProductFull() {
		return detailProductFull;
	}

	public void setDetailProductFull(ProductFullDTO detailProductFull) {
		this.detailProductFull = detailProductFull;
	}

	public List<String> getBreadCrumb() {
		return breadCrumb;
	}

	public List<ProductDTO> getArticles() {
		if (articles == null) {
			articles = new ArrayList<>();
		}
		return articles;
	}

	public List<ProductDTO> getArticlesPage() {
		if (articlesPage == null) {
			articlesPage = new ArrayList<>();
		}
		return articlesPage;
	}

	public ProductDTO getDetailProduct() {
		return detailProduct;
	}

	public void setDetailProduct(ProductDTO detailProduct) {
		this.detailProduct = detailProduct;
	}

	public void setNrProducts(Integer nrProducts) {
		this.nrProducts = nrProducts;
	}

	public Integer getNrProducts() {
		if (nrProducts == null) {
			nrProducts = 0;
		}
		return nrProducts;
	}

}
