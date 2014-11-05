package it.othala.dao.interfaces;

import it.othala.dto.SiteImagesDTO;

import java.util.List;

public interface ISiteImagesDAO {


	public List<SiteImagesDTO> listSiteImages();

	public void deleteGroupSiteImages(String groupImage);
	
	public void InsertSiteImage(SiteImagesDTO newSiteImage);
	
}
