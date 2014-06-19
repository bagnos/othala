package it.othala.cartflow.view;

import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.OrderByCartFlow;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.OthalaUtil;

import java.math.BigDecimal;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;

/*@Named
 @javax.faces.view.ViewScoped*/
// @javax.faces.flow.FlowScoped("cartFlow")

@ManagedBean
@ViewScoped
public class CartFlowView1 extends BaseView {

	private final Integer ITEMS_PAGE = 20;

	private int starIndex = 0;
	private int endIndex = 0;
	private String classForw;
	private String classBack;

	public String getClassForw() {
		return classForw;
	}

	public String getClassBack() {
		return classBack;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		getCartFlowBean().getCatalog().setBrand(null);
		getCartFlowBean().getCatalog().setColor(null);		
		getCartFlowBean().getCatalog().setSize(null);
		getCartFlowBean().getCatalog().setIncludePromo(false);
		
		getCartFlowBean().setCheckoutCart(false);
		getCartFlowBean().getCatalog().setPriceMin(Integer.valueOf(ConfigurationUtil.getProperty("catalogPriceMin")));
		getCartFlowBean().getCatalog().setPriceMax(Integer.valueOf(ConfigurationUtil.getProperty("catalogPriceMax")));
		if (getCartFlowBean().getCatalog().getIdCampaign() != null
				&& getCartFlowBean().getCatalog().getIdCampaign() != 0) {
			getCartFlowBean().getCatalog().setIncludePromo(true);
			getCartFlowBean().getCatalog().setDisabledNewCampaign(true);
		} else {
			getCartFlowBean().getCatalog().setIncludePromo(false);
			getCartFlowBean().getCatalog().setDisabledNewCampaign(false);
		}

		// appBean.updateSizes(getCartFlowBean().getCatalog().getIdSubMenu());

		callServiceProduct(getCartFlowBean().getCatalog().getCurrentPage() == null ? 1 : getCartFlowBean().getCatalog()
				.getCurrentPage());

		updateBreadCrumb();

		return null;
	}

	public void forward(ActionEvent e) {
		getCartFlowBean().getCatalog().setCurrentPage(getCartFlowBean().getCatalog().getCurrentPage() + 1);

		starIndex = endIndex;
		endIndex += ITEMS_PAGE;
		changePage();
	}

	public void backword(ActionEvent e) {
		getCartFlowBean().getCatalog().setCurrentPage(getCartFlowBean().getCatalog().getCurrentPage() - 1);
		endIndex = starIndex;
		starIndex = endIndex - ITEMS_PAGE;
		changePage();
	}

	private void changePage() {

		getCartFlowBean().getCatalog().getArticlesPage().clear();

		if (endIndex > getCartFlowBean().getCatalog().getArticles().size()) {
			endIndex = getCartFlowBean().getCatalog().getArticles().size();
		}
		getCartFlowBean().getCatalog().getArticlesPage()
				.addAll(getCartFlowBean().getCatalog().getArticles().subList(starIndex, endIndex));
		classBack = "";
		if (getCartFlowBean().getCatalog().getCurrentPage().intValue() == 1) {
			classBack = "disabled";
		}
		classForw = "";
		if (getCartFlowBean().getCatalog().getCurrentPage().intValue() == getCartFlowBean().getCatalog().getTotPages()
				.intValue()) {
			classForw = "disabled";
		}

	}

	private void initPaginator(int page) {
		getCartFlowBean().getCatalog().setCurrentPage(page);
		starIndex = 0;
		classBack = "disabled";

		if (!getCartFlowBean().getCatalog().getArticles().isEmpty()) {

			endIndex = ITEMS_PAGE > getCartFlowBean().getCatalog().getArticles().size() ? getCartFlowBean()
					.getCatalog().getArticles().size() : ITEMS_PAGE;
			double dblPages = (double) getCartFlowBean().getCatalog().getArticles().size() / (double) ITEMS_PAGE;
			getCartFlowBean().getCatalog().setTotPages((int) Math.ceil(dblPages));
			getCartFlowBean().getCatalog().getArticlesPage().clear();
			getCartFlowBean().getCatalog().getArticlesPage()
					.addAll(getCartFlowBean().getCatalog().getArticles().subList(starIndex, endIndex));
			if (getCartFlowBean().getCatalog().getCurrentPage().intValue() == getCartFlowBean().getCatalog()
					.getTotPages().intValue()) {
				classForw = "disabled";
			}
			getCartFlowBean().getCatalog().setRenderPaginator(true);
		} else {
			getCartFlowBean().getCatalog().getArticlesPage().clear();
			getCartFlowBean().getCatalog().setRenderPaginator(false);
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

		getCartFlowBean().getCatalog().setSize(
				getCartFlowBean().getCatalog().getSize() == null
						|| getCartFlowBean().getCatalog().getSize().intValue() == -1 ? null : getCartFlowBean()
						.getCatalog().getSize());
		getCartFlowBean().getCatalog().setColor(
				getCartFlowBean().getCatalog().getColor() == null
						|| getCartFlowBean().getCatalog().getColor().intValue() == -1 ? null : getCartFlowBean()
						.getCatalog().getColor());
		getCartFlowBean().getCatalog().setBrand(
				getCartFlowBean().getCatalog().getBrand() == null
						|| getCartFlowBean().getCatalog().getBrand().intValue() == -1 ? null : getCartFlowBean()
						.getCatalog().getBrand());

		getCartFlowBean().getCatalog().getArticles().clear();
		getCartFlowBean()
				.getCatalog()
				.getArticles()
				.addAll(OthalaFactory.getProductServiceInstance().getListProduct(
						getLang(),
						getCartFlowBean().getCatalog().getIdMenu() == null
								|| getCartFlowBean().getCatalog().getIdMenu() == 0 ? null : getCartFlowBean()
								.getCatalog().getIdMenu(),
						getCartFlowBean().getCatalog().getIdSubMenu() == null
								|| getCartFlowBean().getCatalog().getIdSubMenu() == 0 ? null : getCartFlowBean()
								.getCatalog().getIdSubMenu(),
						getCartFlowBean().getCatalog().getBrand(),
						new BigDecimal(getCartFlowBean().getCatalog().getPriceMin()),
						new BigDecimal(getCartFlowBean().getCatalog().getPriceMax()),
						getCartFlowBean().getCatalog().getSize(),
						getCartFlowBean().getCatalog().getColor(),
						getCartFlowBean().getCatalog().getFgNewArrivals(),
						getCartFlowBean().getCatalog().getOrderPrice() == 1 ? OrderByCartFlow.PREZZODESC
								: OrderByCartFlow.PREZZOASC,
						getCartFlowBean().getCatalog().getIdCampaign() == null
								|| getCartFlowBean().getCatalog().getIdCampaign() == 0 ? null : getCartFlowBean()
								.getCatalog().getIdCampaign(), getCartFlowBean().getCatalog().isIncludePromo()));
		initPaginator(page);
	}

	public void updateBreadCrumb() {
		getCartFlowBean().getBreadCrumb().clear();
		if (getCartFlowBean().getCatalog().getIdMenu() != null && getCartFlowBean().getCatalog().getIdSubMenu() != null) {
			Integer idMenu = getCartFlowBean().getCatalog().getIdMenu();
			Integer idSubMenu = getCartFlowBean().getCatalog().getIdSubMenu();

			if (idMenu != null && idSubMenu != null) {
				getCartFlowBean().getBreadCrumb().add("");
				for (MenuDTO m : getBeanApplication().getMenu()) {
					if (m.getIdGender() == idMenu.intValue()) {
						getCartFlowBean().getBreadCrumb().add(m.getTxGender());
						for (SubMenuDTO sm : m.getSubMenu()) {
							if (sm.getIdType() == idSubMenu.intValue()) {
								getCartFlowBean().getBreadCrumb().add(sm.getTxType());

							}
						}
					}
				}
			}
		} else if (getCartFlowBean().getCatalog().getIdMenu() != null
				&& getCartFlowBean().getCatalog().getFgNewArrivals() == true) {
			getCartFlowBean().getBreadCrumb().add("");
			Integer idMenu = getCartFlowBean().getCatalog().getIdMenu();
			for (MenuDTO m : getBeanApplication().getMenu()) {
				if (m.getIdGender() == idMenu.intValue()) {
					getCartFlowBean().getBreadCrumb().add(m.getTxGender());
					break;
				}

			}
			getCartFlowBean().getBreadCrumb().add(OthalaUtil.getWordBundle("catalog_newArrival"));
		}
	}

}
