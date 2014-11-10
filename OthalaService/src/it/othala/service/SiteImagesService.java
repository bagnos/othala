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
	public void updateSiteImages(List<SiteImagesDTO> newImages) {

		int i = 0;
		while (i < newImages.size()) {
			String gruppo = newImages.get(i).getTxGroupImages();
			siteImagesDAO.deleteGroupSiteImages(gruppo);
			while (i < newImages.size()
					&& gruppo.equals(newImages.get(i).getTxGroupImages())) {
				newImages.get(i).setTxLibrary(
						newImages
								.get(i)
								.getTxLibrary()
								.concat("/"
										+ newImages.get(i).getTxGroupImages()));
				siteImagesDAO.InsertSiteImage(newImages.get(i));
				i++;
			}
		}

	}

	@Override
	public List<String> listGruppiSiteImages() {

		List<String> lsGruppi = new ArrayList<>();
		for (TypeGroupSiteImages g : TypeGroupSiteImages.values()) {

			lsGruppi.add(g.name());
		}

		return lsGruppi;
	}

	@Override
	public List<GroupImagesDTO> getSiteImagesForUpdate() {

		List<GroupImagesDTO> listGroupImages = siteImagesDAO.getGroupImages();

		for (int i = 0; i <= listGroupImages.size() - 1; i++) {

			List<SiteImagesDTO> listSiteImages = siteImagesDAO
					.getSiteImages(listGroupImages.get(i).getTxGroupImages());

			if (listGroupImages.get(i).getTxGroupImages() != "tabNav") {
				for (int j = 0; j <= listSiteImages.size() - 1; j++) {
					listSiteImages.get(i).setTxGender(null);
				}
			}
			listGroupImages.get(i).setListImages(listSiteImages);

		}

		return listGroupImages;

	}

	@Override
	public void updateGroupImages(GroupImagesDTO groupImages) {

		siteImagesDAO.deleteGroupSiteImages(groupImages.getTxGroupImages());

		for (int i = 0; i <= groupImages.getListImages().size() - 1; i++) {

			if (groupImages.getTxGroupImages() != "tabNav")
			{
				groupImages.getListImages().get(i).setPgGroupImages(i + 1);
			}
			siteImagesDAO.InsertSiteImage(groupImages.getListImages().get(i));

		}

	}

}
