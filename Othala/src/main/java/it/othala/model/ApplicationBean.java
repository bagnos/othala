package it.othala.model;

import it.othala.dto.AttributeDTO;
import it.othala.dto.AttributeSizeDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.web.utils.OthalaUtil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;
import javax.inject.Named;

@Named
@javax.enterprise.context.ApplicationScoped
/*
 * @ManagedBean
 * 
 * @ApplicationScoped
 */
public class ApplicationBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<SelectItem> colors = new ArrayList<>();
	private List<SelectItem> brands = new ArrayList<>();
	private List<MenuDTO> menu = new ArrayList<>();
	private List<SiteImagesDTO> imgsCarousel = new ArrayList<>();;
	private List<SiteImagesDTO> imgs = null;
	private List<SiteImagesDTO> imgsNewArrival = new ArrayList<>();;
	private DomainDTO domain;
	private List<CampaignDTO> campaigns = new ArrayList<>();;
	private List<AttributeDTO> brandDTO = new ArrayList<>();	
	private List<AttributeDTO> colorsDTO = new ArrayList<>();
	private List<AttributeSizeDTO> sizeDTO = new ArrayList<>();
	private List<ShopDTO> shopsDTO = new ArrayList<>();

	public List<ShopDTO> getShopsDTO() {
		if (shopsDTO.isEmpty())
		{
			ShopDTO s1=new ShopDTO();
			s1.setIdShop(1);
			s1.setTxShop("SIENA");
			shopsDTO.add(s1);
			s1=new ShopDTO();
			s1.setIdShop(2);
			s1.setTxShop("FOLLONICA");
			shopsDTO.add(s1);
			s1=new ShopDTO();
			s1.setIdShop(3);
			s1.setTxShop("AREZZO");
			shopsDTO.add(s1);
		}
		return shopsDTO;
	}

	public List<AttributeSizeDTO> getSizeDTO() {
		if (sizeDTO.isEmpty())
		{
			sizeDTO=getDomain().getSize();
		}
		return sizeDTO;
	}

	public List<AttributeDTO> getColorsDTO() {
		getColors();
		return colorsDTO;
	}

	public void setColors(List<SelectItem> colors) {
		this.colors = colors;
	}

	public List<AttributeDTO> getBrandDTO() {
		getBrands();
		return brandDTO;
	}

	public List<CampaignDTO> getCampaigns() {
		if (campaigns.isEmpty()) {
			campaigns = OthalaFactory.getProductServiceInstance().getListCampaign();
		}
		return campaigns;
	}

	private DomainDTO getDomain() {

		if (domain == null) {
			domain = OthalaFactory.getProductServiceInstance().getDomain("it");
		}

		return domain;
	}

	public List<SiteImagesDTO> getImgsCarousel() {
		if (imgsCarousel.isEmpty()) {
			updateImgHome();
		}
		return imgsCarousel;
	}

	public List<SiteImagesDTO> getImgsNewArrival() {
		if (imgsNewArrival.isEmpty()) {
			updateImgHome();
		}
		return imgsNewArrival;

	}

	private final String IMG_NEW_ARRIVALS = "newArrivals";
	private final String IMG_CAROUSEL = "carousel";

	public List<MenuDTO> getMenu() {
		if (menu.isEmpty()) {
			menu = OthalaFactory.getProductServiceInstance().getMenu(OthalaUtil.getLangFromContextJSF());
		}

		return menu;
	}

	public List<SelectItem> getBrands() {
		if (brands.isEmpty()) {

			brands.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseBrand")));
			brandDTO = getDomain().getBrand();
			for (AttributeDTO att : getDomain().getBrand()) {
				brands.add(new SelectItem(att.getAttributo(), att.getValore()));
			}

		}
		return brands;
	}

	public List<SelectItem> getSizes(Integer idSubMenu) {

		List<SelectItem> sizes = new ArrayList<SelectItem>();
		sizes.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseSize")));
		if (idSubMenu != null && idSubMenu.intValue() != -1) {
			for (AttributeSizeDTO att : getDomain().getSize()) {
				if (att.getIdType().intValue() == idSubMenu.intValue() || idSubMenu == 0) {
				
					sizes.add(new SelectItem(att.getAttributo(), att.getValore()));
				}
			}
		}
		return sizes;
	}

	public List<AttributeDTO> getSizesDTO(Integer idSubMenu) {
		List<AttributeDTO> sizesDTO = new ArrayList<AttributeDTO>();

		if (idSubMenu != null && idSubMenu.intValue() != -1) {
			for (AttributeSizeDTO att : getDomain().getSize()) {
				if (att.getIdType().intValue() == idSubMenu.intValue() || idSubMenu == 0) {
					sizesDTO.add(att);

				}
			}
		}
		return sizesDTO;
	}

	public List<SelectItem> getColors() {
		if (colors.isEmpty()) {

			colors.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseColor")));
			for (AttributeDTO att : getDomain().getColor()) {
				colorsDTO.add(att);
				colors.add(new SelectItem(att.getAttributo(), att.getValore()));
			}

		}
		return colors;
	}

	private void updateImgHome() {
		imgsNewArrival.clear();
		imgsCarousel.clear();
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
