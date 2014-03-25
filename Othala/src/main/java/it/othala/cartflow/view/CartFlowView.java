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
// @javax.faces.flow.FlowScoped("cartFlow")
public class CartFlowView extends BaseView {

	private final Integer ITEMS_PAGE = 20;
	private int priceMin = 100;
	private int priceMax = 1000;
	private int starIndex = 0;
	private int endIndex = 0;
	private String classForw;
	private String classBack;
	private Integer size;
	private Integer brand;
	private Integer color;

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

	@Inject
	private CartFlowBean flowBean;

	public CartFlowBean getFlowBean() {
		return flowBean;
	}

	public String getClassForw() {
		return classForw;
	}

	public String getClassBack() {
		return classBack;
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

		priceMin = flowBean.getPriceMin();
		priceMax = flowBean.getPriceMax();
		brand = flowBean.getBrand();
		color = flowBean.getColor();
		size = flowBean.getSize();

		if (flowBean.getArticles().isEmpty()) {
			flowBean.getArticles().clear();
			flowBean.getArticlesPage().clear();

			flowBean.getArticles().addAll(
					OthalaFactory.getProductServiceInstance().getListProduct(getLang(), flowBean.getIdMenu(),
							flowBean.getIdSubMenu(), flowBean.getBrand(), new BigDecimal(flowBean.getPriceMin()),
							new BigDecimal(flowBean.getPriceMax()), flowBean.getColor(), flowBean.getSize(),
							flowBean.getFgNewArrivals()));

			initPaginator(flowBean.getCurrentPage()); 
			updatefBreadCrumb();
		}

		return null;
	}

	public void forward(ActionEvent e) {
		flowBean.setCurrentPage(flowBean.getCurrentPage() + 1);

		starIndex = endIndex;
		endIndex += ITEMS_PAGE;
		changePage();
	}

	public void backword(ActionEvent e) {
		flowBean.setCurrentPage(flowBean.getCurrentPage() - 1);
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
		if (flowBean.getCurrentPage().intValue() == 1) {
			classBack = "disabled";
		}
		classForw = "";
		if (flowBean.getCurrentPage().intValue() == flowBean.getTotPages().intValue()) {
			classForw = "disabled";
		}

	}

	private void initPaginator(int page) {
		flowBean.setCurrentPage(page);
		starIndex = 0;
		classBack = "disabled";

		if (!flowBean.getArticles().isEmpty()) {
			endIndex = ITEMS_PAGE > flowBean.getArticles().size() ? flowBean.getArticles().size() : ITEMS_PAGE;
			double dblPages = (double) flowBean.getArticles().size() / (double) ITEMS_PAGE;
			flowBean.setTotPages((int) Math.ceil(dblPages));
			flowBean.getArticlesPage().clear();
			flowBean.getArticlesPage().addAll(flowBean.getArticles().subList(starIndex, endIndex));
			flowBean.setRenderPaginator(true);
		} else {
			flowBean.getArticlesPage().clear();
			flowBean.setRenderPaginator(false);
		}
	}

	public void find(ActionEvent e) {

		flowBean.setSize(size == null || size.intValue() == -1 ? null : size);
		flowBean.setColor(color == null || color.intValue() == -1 ? null : color);
		flowBean.setBrand(brand == null || brand.intValue() == -1 ? null : flowBean.getBrand());
		flowBean.getArticles().clear();
		flowBean.setPriceMax(priceMax);
		flowBean.setPriceMin(priceMin);

		flowBean.getArticles().addAll(
				OthalaFactory.getProductServiceInstance().getListProduct(getLang(), flowBean.getIdMenu(),
						flowBean.getIdSubMenu(), flowBean.getBrand(), new BigDecimal(flowBean.getPriceMin()),
						new BigDecimal(flowBean.getPriceMax()), flowBean.getSize(), flowBean.getColor(), null));
		initPaginator(1);
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
