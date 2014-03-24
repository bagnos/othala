package it.othala.model;

import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.web.utils.OthalaUtil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ApplicationScoped;
import javax.faces.model.SelectItem;
import javax.inject.Named;

@Named
@ApplicationScoped
public class ApplicationBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<SelectItem> sizes=new ArrayList<>();
	private List<SelectItem> colors=new ArrayList<>();
	private List<SelectItem> brands=new ArrayList<>();
	private List<MenuDTO> menu=new ArrayList<>();

	public List<MenuDTO> getMenu() {
		if (menu.isEmpty())
		{
			menu=OthalaFactory.getProductServiceInstance().getMenu(OthalaUtil.getLang());
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

}
