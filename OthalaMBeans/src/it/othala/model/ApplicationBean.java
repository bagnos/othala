package it.othala.model;

import it.othala.dto.AttributeDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.MenuFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.OthalaUtil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.model.SelectItem;

/*@Named
 @javax.enterprise.context.ApplicationScoped*/

@ManagedBean
@ApplicationScoped
public class ApplicationBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<SelectItem> colors = null;
	private List<SelectItem> brands = null;
	private List<SelectItem> materials = null;
	private List<SelectItem> sizes = null;
	private List<MenuDTO> menu = null;
	private MenuFullDTO menuFull = null;
	private List<SiteImagesDTO> imgsCarousel = null;
	private List<SiteImagesDTO> imgs = null;
	private List<SiteImagesDTO> imgsNewArrival = null;
	private DomainDTO domain;
	private List<CampaignDTO> campaigns = null;;
	private List<AttributeDTO> brandDTO = null;
	private List<AttributeDTO> materialDTO = null;
	private List<AttributeDTO> colorsDTO = null;
	private List<AttributeDTO> sizeDTO = null;
	private List<ShopDTO> shopsDTO = null;
	private List<AttributeDTO> genderDTO = null;
	private List<AttributeDTO> typeDTO = null;
	private List<AttributeDTO> statesOrder = null;
	private List<AttributeDTO> statesProduct = null;
	private Boolean configuredBarcodeProduct;
	private Boolean discountTabEnabled;
	
	public Boolean getDiscountTabEnabled() {
		return discountTabEnabled;
	}

	public boolean isConfiguredBarcodeProduct() {
		if (configuredBarcodeProduct == null) {
			if (getDomain().getConfiguration() == null || getDomain().getConfiguration().isEmpty()) {
				return false;
			}
			configuredBarcodeProduct = getDomain().getConfiguration().get(0).getNrConfiguration().intValue() != 1;
		}
		return configuredBarcodeProduct;
	}

	public List<AttributeDTO> getStatesProduct() {
		if (statesProduct == null) {
			statesProduct = getDomain().getStatesProduct();
		}
		return statesProduct;
	}

	public List<AttributeDTO> getStatesOrder() {
		if (statesOrder == null) {
			statesOrder = getDomain().getStatesOrder();
		}
		return statesOrder;
	}

	public List<AttributeDTO> getGenderDTO() {
		if (genderDTO == null) {
			genderDTO = getDomain().getGender();
		}
		return genderDTO;
	}

	public List<AttributeDTO> getMaterialDTO() {
		if (materialDTO == null) {
			materialDTO = getDomain().getMaterial();
		}
		return materialDTO;
	}

	public List<AttributeDTO> getTypeDTO() {
		if (typeDTO == null) {
			typeDTO = getDomain().getType();
		}
		return typeDTO;
	}

	public List<ShopDTO> getShopsDTO() {
		if (shopsDTO == null) {
			shopsDTO = getDomain().getShop();
		}
		return shopsDTO;
	}

	public List<AttributeDTO> getSizeDTO() {
		if (sizeDTO == null) {
			sizeDTO = getDomain().getSize();
		}
		return sizeDTO;
	}

	public List<AttributeDTO> getColorsDTO() {
		if (colorsDTO == null) {
			colorsDTO = getDomain().getColor();
		}
		return colorsDTO;
	}

	public void setColors(List<SelectItem> colors) {
		this.colors = colors;
	}

	public List<AttributeDTO> getBrandDTO() {
		if (brandDTO == null) {
			brandDTO = getDomain().getBrand();
		}
		return brandDTO;
	}

	public List<CampaignDTO> getCampaigns() {
		if (campaigns == null) {
			campaigns = OthalaFactory.getProductServiceInstance().getListCampaign();
		}
		return campaigns;
	}

	public DomainDTO getDomain() {

		if (domain == null) {
			domain = OthalaFactory.getProductServiceInstance().getDomain(OthalaUtil.getLangFromContextJSF());
			String key=ConfigurationUtil.getProperty("DiscountTabEnabled");
			discountTabEnabled=(key==null?false:Boolean.parseBoolean(key));			
		}

		return domain;
	}

	public void resetDomain() {
		domain = null;
		brandDTO = null;
		colorsDTO = null;
		typeDTO = null;
		materialDTO = null;
		sizeDTO = null;
		campaigns = null;
	}

	public void resetImgHome() {
		imgsCarousel = null;
		imgs = null;
		imgsNewArrival = null;
	}

	public List<SiteImagesDTO> getImgsCarousel() {
		if (imgsCarousel == null) {
			updateImgHome();
		}
		return imgsCarousel;
	}

	public List<SiteImagesDTO> getImgsNewArrival() {
		if (imgsNewArrival == null) {
			updateImgHome();
		}
		return imgsNewArrival;

	}

	private final String IMG_NEW_ARRIVALS = "newArrivals";
	private final String IMG_CAROUSEL = "carousel";

	public void resetMenu() {
		menu = null;
		menuFull = null;

	}

	public MenuFullDTO getMenuFull() {
		if (menuFull == null) {
			menuFull = OthalaFactory.getProductServiceInstance().getMenuFull(OthalaUtil.getLangFromContextJSF());

		}

		return menuFull;
	}

	public List<MenuDTO> getMenu() {
		if (menu == null) {
			menuFull = OthalaFactory.getProductServiceInstance().getMenuFull(OthalaUtil.getLangFromContextJSF());
			menu = menuFull.getMenu();

			if (menuFull.getImgNew() == null) {
				SiteImagesDTO imgNewCom = new SiteImagesDTO();
				imgNewCom.setTxLibrary("images/home");
				imgNewCom.setTxName("new.png");

				menuFull.setImgNew(imgNewCom);

			}

			if (menuFull.getImgPromo() == null) {
				SiteImagesDTO imgNewPromo = new SiteImagesDTO();
				imgNewPromo.setTxLibrary("images/home");
				imgNewPromo.setTxName("promo.png");

				menuFull.setImgPromo(imgNewPromo);

			}

		}

		return menu;
	}

	public List<SelectItem> getMaterials() {
		if (materials == null) {
			materials = new ArrayList<>();
			materials.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseMaterial")));

			for (AttributeDTO att : getDomain().getMaterial()) {
				materials.add(new SelectItem(att.getAttributo(), att.getValore()));
			}

		}
		return materials;
	}

	public List<SelectItem> getBrands() {
		if (brands == null) {
			brands = new ArrayList<>();
			brands.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseBrand")));

			for (AttributeDTO att : getDomain().getBrand()) {
				brands.add(new SelectItem(att.getAttributo(), att.getValore()));
			}

		}
		return brands;
	}

	public List<SelectItem> getSizes() {

		if (sizes == null) {
			sizes = new ArrayList<>();
			sizes.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseSize")));

			for (AttributeDTO att : getDomain().getSize()) {
				sizes.add(new SelectItem(att.getAttributo(), att.getValore()));
			}

		}
		return sizes;
	}

	public List<AttributeDTO> getSizesDTO() {
		if (sizeDTO == null) {
			sizeDTO = getDomain().getSize();
		}
		return sizeDTO;
	}

	public List<SelectItem> getColors() {
		if (colors == null) {
			colors = new ArrayList<>();
			colorsDTO = new ArrayList<>();
			colors.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseColor")));
			for (AttributeDTO att : getDomain().getColor()) {
				colorsDTO.add(att);
				colors.add(new SelectItem(att.getAttributo(), att.getValore()));
			}

		}
		return colors;
	}

	private void updateImgHome() {
		imgsCarousel = new ArrayList<>();
		imgsNewArrival = new ArrayList<>();

		imgs = OthalaFactory.getSiteImagesServiceInstance().listSiteImages();
		for (SiteImagesDTO img : imgs) {
			if (img.getTxGroupImages().trim().equalsIgnoreCase(IMG_NEW_ARRIVALS)) {
				imgsNewArrival.add(img);
			} else if (img.getTxGroupImages().trim().equalsIgnoreCase(IMG_CAROUSEL)) {
				imgsCarousel.add(img);
			}
		}

	}

}
