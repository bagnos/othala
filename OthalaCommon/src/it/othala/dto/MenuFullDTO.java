package it.othala.dto;

import java.io.Serializable;
import java.util.List;

public class MenuFullDTO implements Serializable {


	private static final long serialVersionUID = 1L;

	private List<MenuDTO> menu = null;
	
	private boolean fgNuoviArrivi;
	private boolean fgPromozioni;
	private boolean fgPrezzoSpeciale; 
	private SiteImagesDTO imgNew;
	
	private SiteImagesDTO imgPromo;
	
	

	public boolean isFgNuoviArrivi() {
		return fgNuoviArrivi;
	}

	public void setFgNuoviArrivi(boolean fgNuoviArrivi) {
		this.fgNuoviArrivi = fgNuoviArrivi;
	}

	public boolean isFgPromozioni() {
		return fgPromozioni;
	}

	public void setFgPromozioni(boolean fgPromozioni) {
		this.fgPromozioni = fgPromozioni;
	}

	public boolean isFgPrezzoSpeciale() {
		return fgPrezzoSpeciale;
	}

	public void setFgPrezzoSpeciale(boolean fgPrezzoSpeciale) {
		this.fgPrezzoSpeciale = fgPrezzoSpeciale;
	}

		public List<MenuDTO> getMenu() {
		return menu;
	}

	public void setMenu(List<MenuDTO> menu) {
		this.menu = menu;
	}

	public SiteImagesDTO getImgNew() {
		return imgNew;
	}

	public void setImgNew(SiteImagesDTO imgNew) {
		this.imgNew = imgNew;
	}

	public SiteImagesDTO getImgPromo() {
		return imgPromo;
	}

	public void setImgPromo(SiteImagesDTO imgPromo) {
		this.imgPromo = imgPromo;
	}

}
