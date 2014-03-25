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
	
	private Integer currentPage = null;
	private Integer totPages = null;
	private boolean renderPaginator;
	private Integer idMenu;
	private Integer idSubMenu;
	private Boolean fgNewArrivals;	
	private Integer brand;
	private Integer color;
	private Integer size;
	private Integer priceMin = 100;
	private Integer priceMax = 1000;

	
	
	
	public Integer getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(Integer priceMin) {
		this.priceMin = priceMin;
	}

	public Integer getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(Integer priceMax) {
		this.priceMax = priceMax;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getBrand() {
		return brand;
	}

	public void setBrand(Integer brand) {
		this.brand = brand;
	}

	public Integer getColor() {
		return color;
	}

	public void setColor(Integer color) {
		this.color = color;
	}

	public Integer getCurrentPage() {
		
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotPages() {
		return totPages;
	}

	public void setTotPages(Integer totPages) {
		this.totPages = totPages;
	}

	public boolean isRenderPaginator() {
		return renderPaginator;
	}

	public void setRenderPaginator(boolean renderPaginator) {
		this.renderPaginator = renderPaginator;
	}

	public Integer getIdMenu() {
		return idMenu;
	}

	public void setIdMenu(Integer idMenu) {
		this.idMenu = idMenu;
	}

	public Integer getIdSubMenu() {
		return idSubMenu;
	}

	public void setIdSubMenu(Integer idSubMenu) {
		this.idSubMenu = idSubMenu;
	}

	public Boolean getFgNewArrivals() {
		return fgNewArrivals;
	}

	public void setFgNewArrivals(Boolean fgNewArrivals) {
		this.fgNewArrivals = fgNewArrivals;
	}

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
