package it.othala.model;

import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.web.utils.OthalaUtil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.model.SelectItem;
import javax.inject.Named;

@Named
@javax.enterprise.context.ApplicationScoped
/*
@ManagedBean
@ApplicationScoped*/
public class ApplicationBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<SelectItem> sizes = new ArrayList<>();
	private List<SelectItem> colors = new ArrayList<>();
	private List<SelectItem> brands = new ArrayList<>();
	private List<MenuDTO> menu = new ArrayList<>();
	private List<SiteImagesDTO> imgsCarousel = new ArrayList<>();;
	private List<SiteImagesDTO> imgs = null;
	private List<SiteImagesDTO> imgsNewArrival = new ArrayList<>();;

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
			menu = OthalaFactory.getProductServiceInstance().getMenu(OthalaUtil.getLang());
		}

		return menu;
	}

	public List<SelectItem> getBrands() {
		if (brands.isEmpty()) {

			updateSelectItem();

		}
		return brands;
	}

	public List<SelectItem> getSizes() {
		if (sizes.isEmpty()) {

			updateSelectItem();

		}
		return sizes;
	}

	public List<SelectItem> getColors() {
		if (colors.isEmpty()) {

			updateSelectItem();

		}
		return colors;
	}

	private void updateSelectItem() {

		DomainDTO domain = OthalaFactory.getProductServiceInstance().getDomain("it");
		colors.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseColor")));
		for (AttributeDTO att : domain.getColor()) {
			colors.add(new SelectItem(att.getAttributo(), att.getValore()));
		}
		sizes.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseSize")));
		for (AttributeDTO att : domain.getSize()) {
			sizes.add(new SelectItem(att.getAttributo(), att.getValore()));
		}

		brands.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseBrand")));
		for (AttributeDTO att : domain.getBrand()) {
			brands.add(new SelectItem(att.getAttributo(), att.getValore()));
		}
	}

	private void updateImgHome() {
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
