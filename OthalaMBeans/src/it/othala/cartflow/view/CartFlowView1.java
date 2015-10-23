package it.othala.cartflow.view;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.AttributeDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.SubMenuBrandDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.dto.VetrinaDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.OthalaUtil;

import java.io.IOException;
import java.math.BigDecimal;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;

import org.apache.commons.lang3.StringUtils;

import com.ocpsoft.pretty.PrettyContext;

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
	private String category;
	private int idMenu;
	private int idSubMenu;
	private int idCampaign;
	private boolean fgNewArrivals;
	private int brand;
	private String brands;
	private String gender;
	private String type;
	private String campaign;
	private String manualCanonicalUrlIT;
	private String manualCanonicalUrlEN;
	private String titleSEO;

	private String searchProduct;

	

	public String getSearchProduct() {
		return searchProduct;
	}

	public void setSearchProduct(String searchProduct) {
		this.searchProduct = searchProduct;
	}

	public String getTitleSEO() {
		return titleSEO;
	}

	public String getManualCanonicalUrlEN() {
		return manualCanonicalUrlEN;
	}

	public String getManualCanonicalUrlIT() {
		return manualCanonicalUrlIT;
	}

	public String getCartChoice(String idPrd, String brand, String type, Integer idProdType) {

		String url = null;
		if (idProdType == null || idProdType == 0) {
			url = getCartChoice2(idPrd, brand, type, null);
			return url;
		}
		switch (idProdType) {
		case 1:
			url = getCartChoice3(idPrd, brand, type, null);
			break;
		case 2:
			url = getCartChoice4(idPrd, brand, type, null);
			break;
		default:
			break;
		}
		return url;
	}

	public String getCartChoice(String idPrd, String brand, String type, Integer idProdType, String lang) {

		String url = null;
		if (idProdType == null || idProdType == 0) {
			url = getCartChoice2(idPrd, brand, type, lang);
			return url;
		}
		switch (idProdType) {
		case 1:
			url = getCartChoice3(idPrd, brand, type, lang);
			break;
		case 2:
			url = getCartChoice4(idPrd, brand, type, lang);
			break;
		default:
			break;
		}
	
		return url;
	}

	private String getCartChoice2(String idPrd, String brand, String description, String lang) {
		String cartChoice2 = null;
		description = description.toLowerCase().replace("/", "").replace("%", "");
		brand=brand.toLowerCase().replace("/", "").replace("%", "");
		if (lang == null) {
			cartChoice2 = String.format("%s/%s/%s/%s/%s", getRequest().getContextPath(), "articolo",
					brand, description, idPrd);
		} else {
			cartChoice2 = String.format("%s/%s/%s/%s/%s/%s", getRequest().getContextPath(), lang, "article",
					brand, description, idPrd);
		}
	

		return cartChoice2;
	}

	private String getCartChoice3(String idPrd, String brand, String description, String lang) {
		String cartChoice3 = null;
		description = description.toLowerCase().replace("/", "").replace("%", "");
		brand=brand.toLowerCase().replace("/", "").replace("%", "");
		if (lang == null) {
			cartChoice3 = String.format("%s/%s/%s/%s/%s", getRequest().getContextPath(), "prodotto",
					brand, description, idPrd);
		} else {
			cartChoice3 = String.format("%s/%s/%s/%s/%s/%s", getRequest().getContextPath(), lang, "product",
					brand, description, idPrd);
		}
	

		return cartChoice3;
	}

	private String getCartChoice4(String idPrd, String brand, String description, String lang) {
		String cartChoice4 = null;
		description = description.toLowerCase().replace("/", "").replace("%", "");
		brand=brand.toLowerCase().replace("/", "").replace("%", "");
		if (lang == null) {
			cartChoice4 = String.format("%s/%s/%s/%s/%s", getRequest().getContextPath(), "articolo",
					brand, description, idPrd);
		} else {
			cartChoice4 = String.format("%s/%s/%s/%s/%s/%s", getRequest().getContextPath(), lang, "article",
					brand, description, idPrd);
		}
	

		return cartChoice4;
	}

	public String getCampaign() {
		return campaign;
	}

	public void setCampaign(String campaign) {
		this.campaign = campaign;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBrands() {
		return brands;
	}

	public void setBrands(String brands) {
		this.brands = brands;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getBrand() {
		return brand;
	}

	public void setBrand(int brand) {
		this.brand = brand;
	}

	public int getIdMenu() {
		return idMenu;
	}

	public void setIdMenu(int idMenu) {
		this.idMenu = idMenu;
	}

	public int getIdSubMenu() {
		return idSubMenu;
	}

	public void setIdSubMenu(int idSubMenu) {
		this.idSubMenu = idSubMenu;
	}

	public int getIdCampaign() {
		return idCampaign;
	}

	public void setIdCampaign(int idCampaign) {
		this.idCampaign = idCampaign;
	}

	public boolean isFgNewArrivals() {
		return fgNewArrivals;
	}

	public void setFgNewArrivals(boolean fgNewArrivals) {
		this.fgNewArrivals = fgNewArrivals;
	}

	public String getCategory() {
		return category;
	}

	public String getClassForw() {
		return classForw;
	}

	public String getClassBack() {
		return classBack;
	}

	@Override
	public String doInit() {
		try {
			// TODO Auto-generated method stub
			changeLocale();

			initBean();

			callServiceProduct(1);

			updateBreadCrumb();

			// reset querystring value
			/*
			 * getCartFlowBean().getCatalog().setIdMenu(0);
			 * getCartFlowBean().getCatalog().setIdSubMenu(0);
			 * getCartFlowBean().getCatalog().setIdCampaign(0);
			 * getCartFlowBean().getCatalog().setBrand(0);
			 * getCartFlowBean().getCatalog().setFgNewArrivals(false);
			 */

		} catch (Exception e) {
			addGenericError(e, "errore init catalog");
		}
		return null;
	}

	public String doInitBrand() {
		try {

			initBean();

			callServiceProductBrand(1);

			updateBreadCrumb();

			getCartFlowBean().setBrandFullDTO(
					OthalaFactory.getProductServiceInstance().listBrandFull(getLang(), null, null,
							getCartFlowBean().getCatalog().getBrand()));

		} catch (Exception e) {
			addGenericError(e, "errore init catalog");
		}
		return null;
	}

	private void initBean() {
		getCartFlowBean().getCatalog().setColor(null);
		getCartFlowBean().getCatalog().setSize(null);
		getCartFlowBean().getCatalog().setIncludePromo(false);

		StringBuilder buildeCanonicalUrlEN = new StringBuilder().append("http://").append(getRequest().getServerName())
				.append(getRequest().getContextPath()).append("/en");
		StringBuilder buildeCanonicalUrlIT = new StringBuilder().append("http://").append(getRequest().getServerName())
				.append(getRequest().getContextPath()).append("/it");
		StringBuilder buildTitleSEO = new StringBuilder().append("Shop");

		if (gender != null) {

			for (MenuDTO menu : getBeanApplication().getDomain(getLang()).getMenu()) {
				if (menu.getTxGender().equalsIgnoreCase(gender)) {
					buildeCanonicalUrlEN.append("/").append(menu.getTxGender());
					buildeCanonicalUrlIT.append("/").append(menu.getTxGender()).append("/");
					idMenu = menu.getIdGender();
					if (brands != null) {
						buildeCanonicalUrlEN.append("/brand");
						buildeCanonicalUrlIT.append("/brand");
						for (SubMenuBrandDTO sBrand : menu.getSubMenuBrand()) {
							if (sBrand.getTxBrand().equalsIgnoreCase(brands)) {
								brand = sBrand.getIdBrand();
								buildeCanonicalUrlEN.append("/").append(sBrand.getTxBrand().toLowerCase());
								buildeCanonicalUrlIT.append("/").append(sBrand.getTxBrand().toLowerCase());

								buildTitleSEO.append(sBrand.getTxBrand().trim());

								break;
							}
						}
					}
					if (type != null) {
						for (SubMenuDTO subMenu : menu.getSubMenu()) {
							if (subMenu.getTxType().equalsIgnoreCase(type)) {
								buildeCanonicalUrlEN.append("/").append(subMenu.getTxTypeEN().toLowerCase());
								buildeCanonicalUrlIT.append("/").append(subMenu.getTxTypeIT().toLowerCase());								
								buildTitleSEO.append(" "+subMenu.getTxType().trim());
								idSubMenu = subMenu.getIdType();
								break;
							}

						}
					}
					break;
				}
			}
		} else if (brands != null) {
			for (MenuDTO menu : getBeanApplication().getDomain(getLang()).getMenu()) {
				for (SubMenuBrandDTO sBrand : menu.getSubMenuBrand()) {
					if (sBrand.getTxBrand().equalsIgnoreCase(brands)) {
						buildeCanonicalUrlEN.append("/brand/").append(sBrand.getTxBrand().toLowerCase());
						buildeCanonicalUrlIT.append("/brand/").append(sBrand.getTxBrand().toLowerCase());
						buildTitleSEO.append(" "+sBrand.getTxBrand().trim());
						brand = sBrand.getIdBrand();
						break;
					}
				}
			}
		} else if (type != null) {
			for (MenuDTO menu : getBeanApplication().getDomain(getLang()).getMenu()) {
				for (SubMenuDTO subMenu : menu.getSubMenu()) {
					if (subMenu.getTxType().equalsIgnoreCase(type)) {
						buildeCanonicalUrlEN.append("/articles/").append(subMenu.getTxTypeEN().toLowerCase());
						buildeCanonicalUrlIT.append("/articoli/").append(subMenu.getTxTypeIT().toLowerCase());
						buildTitleSEO.append(" "+subMenu.getTxType().trim());
						idSubMenu = subMenu.getIdType();
						break;
					}

				}
			}

		} else if (campaign != null) {
			log.info("Campagna="+campaign.trim());
			for (CampaignDTO cam : getBeanApplication().getCampaigns()) {
				log.info("Campagna item="+cam.getTxCampaign().trim());
				if (cam.getTxCampaign().trim().equalsIgnoreCase(campaign.trim())) {
					buildeCanonicalUrlEN.append("/promotions/").append(cam.getTxCampaign().toLowerCase());
					buildeCanonicalUrlIT.append("/promozioni/").append(cam.getTxCampaign().toLowerCase());
					if (getLang().equalsIgnoreCase("it"))
					{
						buildTitleSEO.append(" promozioni ").append(cam.getTxCampaign().toLowerCase());
					}
					else
					{
						buildTitleSEO.append(" promotions ").append(cam.getTxCampaign().toLowerCase());
					}
					idCampaign = cam.getIdCampaign();
					log.info(" Id Campagna="+idCampaign);
					break;
				}
			}
		} else if (fgNewArrivals) {
			buildeCanonicalUrlEN.append("/newarrivals");
			buildeCanonicalUrlIT.append("/nuoviarrivi");
			buildTitleSEO.append(" newarrivals");
		}
		else if (searchProduct!=null && searchProduct.isEmpty()==false)
		{
			buildeCanonicalUrlEN.append("/"+getLocalManager().getWordBundle("catalog_searchProduct"));
			buildeCanonicalUrlIT.append("/"+getLocalManager().getWordBundle("catalog_searchProduct"));
			buildTitleSEO.append(getLocalManager().getWordBundle("catalog_searchProduct"));
		}


		manualCanonicalUrlEN = buildeCanonicalUrlEN.toString();
		manualCanonicalUrlIT = buildeCanonicalUrlIT.toString();
		titleSEO=buildTitleSEO.toString();

		getCartFlowBean().getCatalog().setIdMenu(idMenu);
		getCartFlowBean().getCatalog().setIdSubMenu(idSubMenu);
		getCartFlowBean().getCatalog().setIdCampaign(idCampaign);
		getCartFlowBean().getCatalog().setBrand(brand);
		getCartFlowBean().getCatalog().setFgNewArrivals(fgNewArrivals);
		getCartFlowBean().getCatalog().setSearchProduct(searchProduct);

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

		getCartFlowBean().setBrandFullDTO(null);

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

		if (p.getTyProduct() == null) {
			return "product";
		} else {
			if (p.getTyProduct() == 1) {
				return "cart-choice-3";
			} else {
				if (p.getTyProduct() == 2) {
					return "cart-choice-4";
				} else {
					return "";
				}
			}
		}

	}

	public void orderListener(AjaxBehaviorEvent event) {

		callServiceProduct(1);

	}

	private void callServiceProduct(int page) {

		callServiceProductBrand(page);

		redirectOneProduct();
	}

	private void callServiceProductBrand(int page) {

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
		VetrinaDTO vetrinaDTO=null;
		if (getCartFlowBean().getCatalog().getSearchProduct()!=null && getCartFlowBean().getCatalog().getSearchProduct().isEmpty()==false)
		{
			vetrinaDTO=OthalaFactory.getProductServiceInstance().getListProduct(getCartFlowBean().getCatalog().getSearchProduct().trim(), getLang());
		}
		else
		{
		vetrinaDTO = OthalaFactory.getProductServiceInstance().getListProduct(
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
						.getCatalog().getIdCampaign(), getCartFlowBean().getCatalog().isIncludePromo(), null);
		
		}
		getCartFlowBean().getCatalog().getArticles().addAll(vetrinaDTO.getProdotti());

		getCartFlowBean().setSizeDTO(vetrinaDTO.getSize());
		getCartFlowBean().setColorDTO(vetrinaDTO.getColor());
		getCartFlowBean().setBrandDTO(vetrinaDTO.getBrand());

		initPaginator(page);

	}

	private void redirectOneProduct() {
		getCartFlowBean().setSingleProductCatalog(false);
		if (getCartFlowBean().getCatalog().getArticles() != null
				&& getCartFlowBean().getCatalog().getArticles().size() == 1) {
			try {
				getCartFlowBean().setSingleProductCatalog(true);
				String pagDettaglio = "";
				if (getCartFlowBean().getCatalog().getArticles().get(0).getTyProduct() == null) {
					pagDettaglio = getCartChoice2(getCartFlowBean().getCatalog().getArticles().get(0).getIdProduct()
							.toString(), getCartFlowBean().getCatalog().getArticles().get(0).getTxBrand(),
							getCartFlowBean().getCatalog().getArticles().get(0).getTxType(), null);

				} else {
					if (getCartFlowBean().getCatalog().getArticles().get(0).getTyProduct() == 1) {
						pagDettaglio = getCartChoice3(getCartFlowBean().getCatalog().getArticles().get(0).getIdProduct()
								.toString(), getCartFlowBean().getCatalog().getArticles().get(0).getTxBrand(),
								getCartFlowBean().getCatalog().getArticles().get(0).getTxType(), null);

					} else {
						if (getCartFlowBean().getCatalog().getArticles().get(0).getTyProduct() == 2) {
							pagDettaglio = getCartChoice4(getCartFlowBean().getCatalog().getArticles().get(0).getIdProduct()
									.toString(), getCartFlowBean().getCatalog().getArticles().get(0).getTxBrand(),
									getCartFlowBean().getCatalog().getArticles().get(0).getTxType(), null);

						}
					}
				}
				FacesContext.getCurrentInstance().getExternalContext().redirect(pagDettaglio);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				log.error("errore redirect prodotto singolo", e);
			}
		}

	}

	public void updateBreadCrumb() {
		getCartFlowBean().getBreadCrumb().clear();

		getCartFlowBean().getBreadCrumb().add("");
		if (getCartFlowBean().getCatalog().getIdMenu() != null) {
			Integer idMenu = getCartFlowBean().getCatalog().getIdMenu();
			for (MenuDTO m : getBeanApplication().getDomain(getLang()).getMenu()) {
				if (m.getIdGender() == idMenu.intValue()) {
					getCartFlowBean().getBreadCrumb().add(m.getTxGender());
				}
			}

		}

		// aggiungo il submenu
		if (getCartFlowBean().getCatalog().getIdSubMenu() != null) {
			Integer idMenu = getCartFlowBean().getCatalog().getIdMenu();
			Integer idSubMenu = getCartFlowBean().getCatalog().getIdSubMenu();

			if (idMenu != null && idSubMenu != null) {
				// getCartFlowBean().getBreadCrumb().add("");
				for (MenuDTO m : getBeanApplication().getDomain(getLang()).getMenu()) {
					if (m.getIdGender() == idMenu.intValue()) {
						// getCartFlowBean().getBreadCrumb().add(m.getTxGender());
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

		} else if (getCartFlowBean().getCatalog().isIncludePromo()) {
			getCartFlowBean().getBreadCrumb().add(OthalaUtil.getWordBundle("catalog_promo"));
			for (CampaignDTO c : getBeanApplication().getCampaigns()) {
				if (c.getIdCampaign().intValue() == getCartFlowBean().getCatalog().getIdCampaign()) {
					getCartFlowBean().getBreadCrumb().add(c.getTxCampaign());
				}
			}
		}
		else if (searchProduct!=null || searchProduct.isEmpty()==false)
		{
			getCartFlowBean().getBreadCrumb().add(searchProduct);
		}	

		if (getCartFlowBean().getBreadCrumb().size() == 1) {
			getCartFlowBean().getBreadCrumb().clear();
		}

		if (getCartFlowBean().getBreadCrumb() != null && getCartFlowBean().getBreadCrumb().isEmpty() == false) {
			category = StringUtils.join(getCartFlowBean().getBreadCrumb(), " ");
			category = category.replace("Shop", "");
		}

	}

}
