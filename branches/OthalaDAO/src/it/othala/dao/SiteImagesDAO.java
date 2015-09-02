package it.othala.dao;

import it.othala.dao.interfaces.ISiteImagesDAO;
import it.othala.dto.GroupImagesDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.SiteImagesDTO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class SiteImagesDAO extends SqlSessionDaoSupport implements
		ISiteImagesDAO {

	@Override
	public List<SiteImagesDTO> listSiteImages() {


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

	@Override
	public List<GroupImagesDTO> getGroupImages() {

		List<GroupImagesDTO> listGroupImages = getSqlSession().selectList(
				"it.othala.images.queries.listGroupImages");

		return listGroupImages;
	}

	@Override
	public List<SiteImagesDTO> getSiteImages(String txGroupImages) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("txGroupImages", txGroupImages);
		
		List<SiteImagesDTO> listSiteImages = getSqlSession().selectList(
				"it.othala.images.queries.getSiteImages", map);

		return listSiteImages;
	}





}
