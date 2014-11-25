package it.othala.service;

import it.othala.dao.interfaces.ISiteImagesDAO;
import it.othala.dto.GroupImagesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.TypeGroupSiteImages;
import it.othala.service.interfaces.ISiteImagesService;

import java.util.ArrayList;
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
	public List<GroupImagesDTO> getSiteImagesForUpdate() {

		List<GroupImagesDTO> listGroupImages = siteImagesDAO.getGroupImages();

		for (int i = 0; i <= listGroupImages.size() - 1; i++) {

			List<SiteImagesDTO> listSiteImages = siteImagesDAO
					.getSiteImages(listGroupImages.get(i).getTxGroupImages());

			listGroupImages.get(i).setListImages(listSiteImages);

		}

		return listGroupImages;

	}

	@Override
	public void updateGroupImages(GroupImagesDTO groupImages) {

		siteImagesDAO.deleteGroupSiteImages(groupImages.getTxGroupImages());

		for (int i = 0; i <= groupImages.getListImages().size() - 1; i++) {

			groupImages.getListImages().get(i).setPgGroupImages(i + 1);
			
			if (groupImages.getTxGroupImages().equals("newArrivals"))
			{
			String newUrl = "/cart/cart-catalog.xhtml?idMenu="
					+ groupImages.getListImages().get(i).getIdGender().toString() + "&fgNewArrivals=true&idSubMenu=0&idCampaign=0";
			groupImages.getListImages().get(i).setUrlRedirect(newUrl);
			}
			siteImagesDAO.InsertSiteImage(groupImages.getListImages().get(i));

		}

	}

}
