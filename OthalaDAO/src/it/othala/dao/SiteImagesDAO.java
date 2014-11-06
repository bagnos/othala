package it.othala.dao;

import it.othala.dao.interfaces.ISiteImagesDAO;
import it.othala.dto.MenuDTO;
import it.othala.dto.SiteImagesDTO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class SiteImagesDAO extends SqlSessionDaoSupport implements
		ISiteImagesDAO {

	@Override
	public List<SiteImagesDTO> listSiteImages() {

		// recupero prodotti
		List<SiteImagesDTO> listSiteImages = getSqlSession().selectList(
				"it.othala.images.queries.listSiteImages");

		return listSiteImages;

	}

	@Override
	public void deleteGroupSiteImages(String groupImage) {
		getSqlSession().delete(
				"it.othala.images.queries.deleteSiteImages", groupImage);
		
	}

	@Override
	public void InsertSiteImage(SiteImagesDTO newSiteImage) {
		
		
		getSqlSession().insert(
				"it.othala.images.queries.insertSiteImages", newSiteImage);
		
	}





}
