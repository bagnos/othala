package it.othala.service.interfaces;

import it.othala.dto.GroupImagesDTO;
import it.othala.dto.SiteImagesDTO;

import java.util.List;

public interface ISiteImagesService {

	public List<SiteImagesDTO> listSiteImages();
	
	public List<GroupImagesDTO> getSiteImagesForUpdate();

	public void updateGroupImages(GroupImagesDTO groupImages);


}
