package it.othala.cartflow.model;

import it.othala.dto.ProductDTO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Catalog implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer currentPage = null;
	private Integer totPages = null;
	private boolean renderPaginator;
	private Integer idMenu;
	private Integer idSubMenu;
	private Boolean fgNewArrivals;
	private Integer brand;
	private Integer color;
	private Integer size;
	private Integer priceMin = 1;
	private Integer priceMax = 5000;
	private int orderPrice;
	private List<ProductDTO> articles;
	private List<ProductDTO> articlesPage;
	private boolean includePromo;
	private Integer idCampaign;
	private boolean disabledNewCampaign;

	public boolean isDisabledNewCampaign() {
		return disabledNewCampaign;
	}

	public void setDisabledNewCampaign(boolean disabledNewCampaign) {
		this.disabledNewCampaign = disabledNewCampaign;
	}

	public Integer getIdCampaign() {
		return idCampaign;
	}

	public void setIdCampaign(Integer idCampaign) {
		this.idCampaign = idCampaign;
	}

	public boolean isIncludePromo() {
		return includePromo;
	}

	public void setIncludePromo(boolean includePromo) {
		this.includePromo = includePromo;
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

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

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

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

}
