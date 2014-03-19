package it.othala.cartflow.view;

import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

@ManagedBean
@ViewScoped
public class CartFlowView extends BaseView {

	private List<ProductDTO> articles;
	private List<ProductDTO> articlesPage;
	private Integer size;
	private Integer brand;
	private Integer color;
	private int priceMin = 100;
	private int priceMax = 1000;
	private final Integer ITEMS_PAGE = 20;
	private Integer currentPage = null;
	private Integer totPages = null;
	private int starIndex = 0;
	private int endIndex = 0;
	private boolean renderPaginator;
	private String classForw;
	private String classBack;

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

	public List<ProductDTO> getArticlesPage() {
		return articlesPage;
	}

	public List<ProductDTO> getArticles() {
		return articles;
	}

	public String getClassForw() {
		return classForw;
	}

	public String getClassBack() {
		return classBack;
	}

	public boolean isRenderPaginator() {
		return renderPaginator;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public Integer getTotPages() {
		return totPages;
	}

	public int getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(int priceMin) {
		this.priceMin = priceMin;
	}

	public int getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(int priceMax) {
		this.priceMax = priceMax;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		articles = new ArrayList<>();
		articlesPage = new ArrayList<>();

		// List<MenuDTO> a =
		// OthalaFactory.getProductServiceInstance().getMenu("it");
		ProductFullDTO b = OthalaFactory.getProductServiceInstance()
				.getProductFull("it", 1);

		// articles = OthalaFactory.getProductServiceInstance().getListProduct("it", null, null, null, null, null, null, null, null);

		/*
		 * for (int i = 0; i <= 18; i++) { for (int y = 0; y <= art1.size() - 1;
		 * y++) { articles.add(art1.get(y)); }
		 * 
		 * }
		 */

		// articles = art1;
		initPaginator();

		return null;
	}

	public void forward(ActionEvent e) {
		currentPage++;
		starIndex = endIndex;
		endIndex += ITEMS_PAGE;
		changePage();
	}

	public void backword(ActionEvent e) {
		currentPage--;
		endIndex = starIndex;
		starIndex = endIndex - ITEMS_PAGE;
		changePage();
	}

	private void changePage() {

		articlesPage.clear();

		if (endIndex > articles.size()) {
			endIndex = articles.size();
		}
		articlesPage.addAll(articles.subList(starIndex, endIndex));
		classBack = "";
		if (currentPage == 1) {
			classBack = "disabled";
		}
		classForw = "";
		if (currentPage == totPages) {
			classForw = "disabled";
		}

	}

	private void initPaginator() {
		currentPage = 1;
		starIndex = 0;
		classBack = "disabled";

		if (!articles.isEmpty()) {
			endIndex = ITEMS_PAGE > articles.size() ? articles.size()
					: ITEMS_PAGE;
			double dblPages = (double) articles.size() / (double) ITEMS_PAGE;
			totPages = (int) Math.ceil(dblPages);
			articlesPage.clear();
			articlesPage.addAll(articles.subList(starIndex, endIndex));
			renderPaginator = true;
		} else {
			renderPaginator = false;
		}
	}

	public void find(ActionEvent e) {
		size = size == null || size == -1 ? null : size;
		color = color == null || color == -1 ? null : size;
		brand = brand == null || brand == -1 ? null : size;
		articles = OthalaFactory.getProductServiceInstance().getListProduct(
				"it", null, null, brand, new BigDecimal(priceMin),
				new BigDecimal(priceMax), size, color, null);
		initPaginator();
	}

}
