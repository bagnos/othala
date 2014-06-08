package it.othala.cartflow.view;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.OrderByCartFlow;
import it.othala.model.ApplicationBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.OthalaUtil;

import java.math.BigDecimal;

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

	@Inject
	private ApplicationBean appBean;

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

		flowBean.getCatalog().getArticles().clear();
		flowBean.getCatalog().getArticlesPage().clear();
		flowBean.setCheckoutCart(false);
		flowBean.getCatalog().setPriceMin(Integer.valueOf(ConfigurationUtil.getProperty("catalogPriceMin")));
		flowBean.getCatalog().setPriceMax(Integer.valueOf(ConfigurationUtil.getProperty("catalogPriceMax")));
		if (flowBean.getCatalog().getIdCampaign()!=null && flowBean.getCatalog().getIdCampaign()!=0)
		{
			flowBean.getCatalog().setIncludePromo(true);
			flowBean.getCatalog().setDisabledNewCampaign(true);
		}
		else
		{
			flowBean.getCatalog().setIncludePromo(false);
			flowBean.getCatalog().setDisabledNewCampaign(false);
		}
		

		//appBean.updateSizes(flowBean.getCatalog().getIdSubMenu());

		callServiceProduct(flowBean.getCatalog().getCurrentPage() == null ? 1 : flowBean.getCatalog().getCurrentPage());

		updateBreadCrumb();

		return null;
	}

	public void forward(ActionEvent e) {
		flowBean.getCatalog().setCurrentPage(flowBean.getCatalog().getCurrentPage() + 1);

		starIndex = endIndex;
		endIndex += ITEMS_PAGE;
		changePage();
	}

	public void backword(ActionEvent e) {
		flowBean.getCatalog().setCurrentPage(flowBean.getCatalog().getCurrentPage() - 1);
		endIndex = starIndex;
		starIndex = endIndex - ITEMS_PAGE;
		changePage();
	}

	private void changePage() {

		flowBean.getCatalog().getArticlesPage().clear();

		if (endIndex > flowBean.getCatalog().getArticles().size()) {
			endIndex = flowBean.getCatalog().getArticles().size();
		}
		flowBean.getCatalog().getArticlesPage()
				.addAll(flowBean.getCatalog().getArticles().subList(starIndex, endIndex));
		classBack = "";
		if (flowBean.getCatalog().getCurrentPage().intValue() == 1) {
			classBack = "disabled";
		}
		classForw = "";
		if (flowBean.getCatalog().getCurrentPage().intValue() == flowBean.getCatalog().getTotPages().intValue()) {
			classForw = "disabled";
		}

	}

	private void initPaginator(int page) {
		flowBean.getCatalog().setCurrentPage(page);
		starIndex = 0;
		classBack = "disabled";

		if (!flowBean.getCatalog().getArticles().isEmpty()) {

			endIndex = ITEMS_PAGE > flowBean.getCatalog().getArticles().size() ? flowBean.getCatalog().getArticles()
					.size() : ITEMS_PAGE;
			double dblPages = (double) flowBean.getCatalog().getArticles().size() / (double) ITEMS_PAGE;
			flowBean.getCatalog().setTotPages((int) Math.ceil(dblPages));
			flowBean.getCatalog().getArticlesPage().clear();
			flowBean.getCatalog().getArticlesPage()
					.addAll(flowBean.getCatalog().getArticles().subList(starIndex, endIndex));
			if (flowBean.getCatalog().getCurrentPage().intValue() == flowBean.getCatalog().getTotPages().intValue()) {
				classForw = "disabled";
			}
			flowBean.getCatalog().setRenderPaginator(true);
		} else {
			flowBean.getCatalog().getArticlesPage().clear();
			flowBean.getCatalog().setRenderPaginator(false);
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

		flowBean.getCatalog().setSize(
				flowBean.getCatalog().getSize() == null || flowBean.getCatalog().getSize().intValue() == -1 ? null
						: flowBean.getCatalog().getSize());
		flowBean.getCatalog().setColor(
				flowBean.getCatalog().getColor() == null || flowBean.getCatalog().getColor().intValue() == -1 ? null
						: flowBean.getCatalog().getColor());
		flowBean.getCatalog().setBrand(
				flowBean.getCatalog().getBrand() == null || flowBean.getCatalog().getBrand().intValue() == -1 ? null
						: flowBean.getCatalog().getBrand());

		flowBean.getCatalog().getArticles().clear();
		flowBean.getCatalog()
				.getArticles()
				.addAll(OthalaFactory.getProductServiceInstance().getListProduct(
						getLang(),
						flowBean.getCatalog().getIdMenu() == 0 ? null : flowBean.getCatalog().getIdMenu(),
						flowBean.getCatalog().getIdSubMenu() == 0 ? null : flowBean.getCatalog().getIdSubMenu(),
						flowBean.getCatalog().getBrand(),
						new BigDecimal(flowBean.getCatalog().getPriceMin()),
						new BigDecimal(flowBean.getCatalog().getPriceMax()),
						flowBean.getCatalog().getSize(),
						flowBean.getCatalog().getColor(),
						flowBean.getCatalog().getFgNewArrivals(),
						flowBean.getCatalog().getOrderPrice() == 1 ? OrderByCartFlow.PREZZODESC
								: OrderByCartFlow.PREZZOASC,
						flowBean.getCatalog().getIdCampaign() == 0 ? null : flowBean.getCatalog().getIdCampaign(),
						flowBean.getCatalog().isIncludePromo()));
		initPaginator(page);
	}

	public void updateBreadCrumb() {
		flowBean.getBreadCrumb().clear();
		if (flowBean.getCatalog().getIdMenu() != null && flowBean.getCatalog().getIdSubMenu() != null) {
			Integer idMenu = flowBean.getCatalog().getIdMenu();
			Integer idSubMenu = flowBean.getCatalog().getIdSubMenu();

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
		} else if (flowBean.getCatalog().getIdMenu() != null && flowBean.getCatalog().getFgNewArrivals() == true) {
			flowBean.getBreadCrumb().add("");
			Integer idMenu = flowBean.getCatalog().getIdMenu();
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
