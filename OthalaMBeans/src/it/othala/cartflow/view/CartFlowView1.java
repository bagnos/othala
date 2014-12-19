package it.othala.cartflow.view;

import it.othala.dto.AttributeDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.dto.VetrinaDTO;
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

	private final Integer ITEMS_PAGE = 21;

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
		initBean();
		
		callServiceProduct(1);

		updateBreadCrumb();

		return null;
	}
	
	private void initBean()
	{
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
		if (getCartFlowBean().getCatalog().getIdSubMenu() != null
				&& getCartFlowBean().getCatalog().getIdSubMenu().intValue() == 0) {
			getCartFlowBean().getCatalog().setIdSubMenu(null);
		}
		if (getCartFlowBean().getCatalog().getIdMenu() != null
				&& getCartFlowBean().getCatalog().getIdMenu().intValue() == 0) {
			getCartFlowBean().getCatalog().setIdMenu(null);
		}
		if (getCartFlowBean().getCatalog().getBrand() != null
				&& getCartFlowBean().getCatalog().getBrand().intValue() == 0) {
			getCartFlowBean().getCatalog().setBrand(null);
		}

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

	public String detailProduct(ProductFullNewDTO p) {

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
		VetrinaDTO vetrinaDTO = OthalaFactory.getProductServiceInstance().getListProduct(
				getLang(),
				getCartFlowBean().getCatalog().getIdMenu() == null
						|| getCartFlowBean().getCatalog().getIdMenu().intValue() == 0 ? null : getCartFlowBean()
						.getCatalog().getIdMenu(),
				getCartFlowBean().getCatalog().getIdSubMenu() == null
						|| getCartFlowBean().getCatalog().getIdSubMenu().intValue() == 0 ? null : getCartFlowBean()
						.getCatalog().getIdSubMenu(),
				getCartFlowBean().getCatalog().getBrand() == null
						|| getCartFlowBean().getCatalog().getBrand().intValue() == 0 ? null : getCartFlowBean()
						.getCatalog().getBrand(),
				new BigDecimal(getCartFlowBean().getCatalog().getPriceMin()),
				new BigDecimal(getCartFlowBean().getCatalog().getPriceMax()),
				getCartFlowBean().getCatalog().getSize(),
				getCartFlowBean().getCatalog().getColor(),
				getCartFlowBean().getCatalog().getFgNewArrivals(),
				getCartFlowBean().getCatalog().getOrderPrice(),
				getCartFlowBean().getCatalog().getIdCampaign() == null
						|| getCartFlowBean().getCatalog().getIdCampaign().intValue() == 0 ? null : getCartFlowBean()
						.getCatalog().getIdCampaign(), getCartFlowBean().getCatalog().isIncludePromo());
		getCartFlowBean().getCatalog().getArticles().addAll(vetrinaDTO.getProdotti());

		getCartFlowBean().setSizeDTO(vetrinaDTO.getSize());
		getCartFlowBean().setColorDTO(vetrinaDTO.getColor());
		getCartFlowBean().setBrandDTO(vetrinaDTO.getBrand());
		initPaginator(page);
	}

	public void updateBreadCrumb() {
		getCartFlowBean().getBreadCrumb().clear();

		getCartFlowBean().getBreadCrumb().add("");
		if (getCartFlowBean().getCatalog().getIdMenu() != null) {
			Integer idMenu = getCartFlowBean().getCatalog().getIdMenu();
			for (MenuDTO m : getBeanApplication().getMenu()) {
				if (m.getIdGender() == idMenu.intValue()) {
					getCartFlowBean().getBreadCrumb().add(m.getTxGender());
				}
			}

		}

		//aggiungo il submenu
		if (getCartFlowBean().getCatalog().getIdSubMenu() != null) {
			Integer idMenu = getCartFlowBean().getCatalog().getIdMenu();
			Integer idSubMenu = getCartFlowBean().getCatalog().getIdSubMenu();

			if (idMenu != null && idSubMenu != null) {
				//getCartFlowBean().getBreadCrumb().add("");
				for (MenuDTO m : getBeanApplication().getMenu()) {
					if (m.getIdGender() == idMenu.intValue()) {
						//getCartFlowBean().getBreadCrumb().add(m.getTxGender());
						for (SubMenuDTO sm : m.getSubMenu()) {
							if (sm.getIdType() == idSubMenu.intValue()) {
								getCartFlowBean().getBreadCrumb().add(sm.getTxType());
								break;	
							}
						}
					}
				}
			}

		} else if (getCartFlowBean().getCatalog().getFgNewArrivals() == true) {			
			
			getCartFlowBean().getBreadCrumb().add(OthalaUtil.getWordBundle("catalog_newArrival"));
		} else if (getCartFlowBean().getCatalog().getBrand() != null) { // brand
			for (AttributeDTO attr : getBeanApplication().getBrandDTO()) {
				if (attr.getAttributo().intValue() == getCartFlowBean().getCatalog().getBrand().intValue()) {
					getCartFlowBean().getBreadCrumb().add(attr.getValore());
					break;
				}
			}

		}
		else if(getCartFlowBean().getCatalog().isIncludePromo())
		{
			getCartFlowBean().getBreadCrumb().add(OthalaUtil.getWordBundle("catalog_promo"));
			for (CampaignDTO c: getBeanApplication().getCampaigns())
			{
				if (c.getIdCampaign().intValue()==getCartFlowBean().getCatalog().getIdCampaign())
				{
					getCartFlowBean().getBreadCrumb().add(c.getTxCampaign());
				}
			}
		}
	}

}
