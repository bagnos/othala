package it.othala.service;

import it.othala.dao.interfaces.ISiteImagesDAO;
import it.othala.dto.SiteImagesDTO;
import it.othala.service.interfaces.ISiteImagesService;

import java.util.List;

public class SiteImagesService implements ISiteImagesService {

	private ISiteImagesDAO siteImagesDAO;

	public void setSiteImagesDAO(ISiteImagesDAO siteImagesDAO) {
		this.siteImagesDAO = siteImagesDAO;
	}

	@Override
	public List<SiteImagesDTO> listSiteImages() {

		List<SiteImagesDTO> listSiteImages = siteImagesDAO.listSiteImages();

		return listSiteImages;

	}

}
