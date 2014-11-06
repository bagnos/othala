package it.othala.service.interfaces;

import it.othala.dto.SiteImagesDTO;

import java.util.List;

public interface ISiteImagesService {

	public List<SiteImagesDTO> listSiteImages();
	
	public void updateSiteImages(List<SiteImagesDTO> newImages);


}
