package it.othala.service;

import it.othala.dao.interfaces.ISiteImagesDAO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.service.interfaces.ISiteImagesService;

import java.util.Iterator;
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

	@Override
	public void updateSiteImages(List<SiteImagesDTO> newImages) {
		
		int i=0;
		while(i < newImages.size()){
			String gruppo = newImages.get(i).getTxGroupImages();
			siteImagesDAO.deleteGroupSiteImages(gruppo);
			while(gruppo.equals(newImages.get(i).getTxGroupImages())){
				siteImagesDAO.InsertSiteImage(newImages.get(i));
				i++;
			}
		}

	}

}
