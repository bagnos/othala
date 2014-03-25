package it.othala.cartflow.view;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import java.math.BigDecimal;

import javax.faces.event.ActionEvent;
import javax.inject.Inject;
import javax.inject.Named;

@Named
@javax.faces.view.ViewScoped
public class CartFlowView extends BaseView {

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

	private Integer idMenu;
	private Integer idSubMenu;
	private Boolean fgNewArrivals;

	@Inject
	private CartFlowBean flowBean;

	public CartFlowBean getFlowBean() {
		return flowBean;
	}

	public Boolean getFgNewArrivals() {
		return fgNewArrivals;
	}

	public void setFgNewArrivals(Boolean fgNewArrivals) {
		this.fgNewArrivals = fgNewArrivals;
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

	public String preInit() {
		return "cart-flow-1";
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		flowBean.getArticles().clear();
		flowBean.getArticlesPage().clear();
		
		flowBean.getArticles().addAll(
				OthalaFactory.getProductServiceInstance().getListProduct(getLang(), idMenu, idSubMenu, null, null,
						null, null, null, fgNewArrivals));

		initPaginator();
		updatefBreadCrumb();

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

		flowBean.getArticlesPage().clear();

		if (endIndex > flowBean.getArticles().size()) {
			endIndex = flowBean.getArticles().size();
		}
		flowBean.getArticlesPage().addAll(flowBean.getArticles().subList(starIndex, endIndex));
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

		if (!flowBean.getArticles().isEmpty()) {
			endIndex = ITEMS_PAGE > flowBean.getArticles().size() ? flowBean.getArticles().size() : ITEMS_PAGE;
			double dblPages = (double) flowBean.getArticles().size() / (double) ITEMS_PAGE;
			totPages = (int) Math.ceil(dblPages);
			flowBean.getArticlesPage().clear();
			flowBean.getArticlesPage().addAll(flowBean.getArticles().subList(starIndex, endIndex));
			renderPaginator = true;
		} else {
			renderPaginator = false;
		}
	}

	public void find(ActionEvent e) {
		size = size == null || size == -1 ? null : size;
		color = color == null || color == -1 ? null : size;
		brand = brand == null || brand == -1 ? null : size;
		flowBean.getArticles().addAll(
				OthalaFactory.getProductServiceInstance().getListProduct(getLang(), idMenu, idSubMenu, brand,
						new BigDecimal(priceMin), new BigDecimal(priceMax), size, color, null));
		initPaginator();
	}

	public String detailProduct(ProductDTO p) {

		/* flowBean.setDetailProduct(p); */
		return "cart-choice-2";

	}

	public void updatefBreadCrumb() {
		if (flowBean.getBreadCrumb().isEmpty()) {
			if (getQueryStringParm("idMenu") != null && getQueryStringParm("idSubMenu") != null) {
				Integer idMenu = Integer.valueOf(getQueryStringParm("idMenu"));
				Integer idSubMenu = Integer.valueOf(getQueryStringParm("idSubMenu"));

				if (idMenu != null && idSubMenu != null) {
					flowBean.getBreadCrumb().add("");
					for (MenuDTO m : getBeanApplication().getMenu()) {
						if (m.getIdGender() == idMenu.intValue()) {
							flowBean.getBreadCrumb().add(m.getTxGender());
							for (SubMenuDTO sm : m.getSubMenu()) {
								if (sm.getIdType() == idSubMenu.intValue()) {
									flowBean.getBreadCrumb().add(sm.getTxType());

								}
							}
						}
					}
				}
			} else if (getQueryStringParm("idMenu") != null && getQueryStringParm("fgNewArrivals") != null) {
				flowBean.getBreadCrumb().add("");
				Integer idMenu = Integer.valueOf(getQueryStringParm("idMenu"));
				for (MenuDTO m : getBeanApplication().getMenu()) {
					if (m.getIdGender() == idMenu.intValue()) {
						flowBean.getBreadCrumb().add(m.getTxGender());
						break;
					}

				}
				flowBean.getBreadCrumb().add(OthalaUtil.getWordBundle("catalog_newArrival"));
			}
		}

	}
}
