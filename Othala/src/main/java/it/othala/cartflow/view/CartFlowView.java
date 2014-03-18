package it.othala.cartflow.view;

import it.othala.dto.ProductDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

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

	public List<ProductDTO> getArticlesPage() {
		return articlesPage;
	}

	public List<ProductDTO> getArticles() {
		return articles;
	}

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
		List<String> color = new ArrayList<>();
		color.add("GIALLO");
		color.add("BLU");
		color.add("ROSSO");

		List<String> size = new ArrayList<>();
		size.add("L");
		size.add("XL");
		size.add("M");

		List<ProductDTO> art1 = OthalaFactory.getProductServiceInstance()
				.getListProduct(1);

		for (int i = 0; i <= 18; i++) {
			articles.add(art1.get(0));
			articles.add(art1.get(1));
		}

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
			endIndex = ITEMS_PAGE>articles.size()?articles.size():ITEMS_PAGE;
			double dblPages = (double) articles.size() / (double) ITEMS_PAGE;
			totPages = (int) Math.ceil(dblPages);
			articlesPage.clear();
			articlesPage.addAll(articles.subList(starIndex, endIndex));
			renderPaginator = true;
		} else {
			renderPaginator = false;
		}
	}

}
