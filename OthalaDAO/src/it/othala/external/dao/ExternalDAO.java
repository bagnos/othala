package it.othala.external.dao;

import it.othala.dto.FidelityCardDTO;
import it.othala.external.dao.interfaces.IExternalDAO;
import it.othala.external.dto.ShopDegortesDTO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ExternalDAO extends SqlSessionDaoSupport implements IExternalDAO {
	
	@Override
	public Integer getQtStock(String barcode) {

		Integer qtStock = getSqlSession().selectOne(
				"it.othala.external.queries.getQtStock", barcode);

		return qtStock;

	}

	@Override
	public FidelityCardDTO getFidelityCard(String idFidelity) {
		
		return getSqlSession().selectOne(
				"it.othala.external.queries.getScontoFidelity", Integer.parseInt(idFidelity));
		
	}

	@Override
	public List<ShopDegortesDTO> getShopStock(String barCode) {
		
		return getSqlSession().selectList(
				"it.othala.external.queries.getShopStock", barCode);
		
	}

}