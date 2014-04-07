package it.othala.cartflow.view;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.OrderByCartFlow;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import java.math.BigDecimal;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.inject.Inject;
import javax.inject.Named;

@Named
@javax.faces.view.ViewScoped
// @javax.faces.flow.FlowScoped("cartFlow")
/*
 * @ManagedBean
 * 
 * @ViewScoped
 */
public class CartFlowView extends BaseView {

	private final Integer ITEMS_PAGE = 20;

	private int starIndex = 0;
	private int endIndex = 0;
	private String classForw;
	private String classBack;

	// @ManagedProperty(value="#{cartFlowBean}")
	@Inject
	private CartFlowBean flowBean;

	public void setFlowBean(CartFlowBean flowBean) {
		this.flowBean = flowBean;
	}

	public CartFlowBean getFlowBean() {
		return flowBean;
	}

	public String getClassForw() {
		return classForw;
	}

	public String getClassBack() {
		return classBack;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		flowBean.getArticles().clear();
		flowBean.getArticlesPage().clear();

		callServiceProduct(flowBean.getCurrentPage() == null ? 1 : flowBean.getCurrentPage());

		updateBreadCrumb();

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
			if (flowBean.getCurrentPage().intValue() == flowBean.getTotPages().intValue()) {
				classForw = "disabled";
			}
			flowBean.setRenderPaginator(true);
		} else {
			flowBean.getArticlesPage().clear();
			flowBean.setRenderPaginator(false);
		}
	}

	public void find(ActionEvent e) {

		callServiceProduct(1);

	}

	public String detailProduct(ProductDTO p) {

		return "cart-choice-2";

	}

	public void orderListener(AjaxBehaviorEvent event) {

		callServiceProduct(1);

	}

	private void callServiceProduct(int page) {

		flowBean.setSize(flowBean.getSize() == null || flowBean.getSize().intValue() == -1 ? null : flowBean.getSize());
		flowBean.setColor(flowBean.getColor() == null || flowBean.getColor().intValue() == -1 ? null : flowBean
				.getColor());
		flowBean.setBrand(flowBean.getBrand() == null || flowBean.getBrand().intValue() == -1 ? null : flowBean
				.getBrand());

		flowBean.getArticles().clear();
		flowBean.getArticles().addAll(
				OthalaFactory.getProductServiceInstance().getListProduct(getLang(), flowBean.getIdMenu(),
						flowBean.getIdSubMenu(), flowBean.getBrand(), new BigDecimal(flowBean.getPriceMin()),
						new BigDecimal(flowBean.getPriceMax()), flowBean.getSize(), flowBean.getColor(),
						flowBean.getFgNewArrivals(),
						flowBean.getOrderPrice() == 1 ? OrderByCartFlow.PREZZODESC : OrderByCartFlow.PREZZOASC));
		initPaginator(page);
	}

	public void updateBreadCrumb() {
		flowBean.getBreadCrumb().clear();
		if (flowBean.getIdMenu() != null && flowBean.getIdSubMenu() != null) {
			Integer idMenu = flowBean.getIdMenu();
			Integer idSubMenu = flowBean.getIdSubMenu();

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
		} else if (flowBean.getIdMenu() != null && flowBean.getFgNewArrivals() == true) {
			flowBean.getBreadCrumb().add("");
			Integer idMenu = flowBean.getIdMenu();
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
