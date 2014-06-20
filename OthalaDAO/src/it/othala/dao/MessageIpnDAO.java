package it.othala.dao;

import java.util.HashMap;

import it.othala.dao.interfaces.IMessagelIpnDAO;
import it.othala.dto.MessageIpnDTO;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class MessageIpnDAO extends SqlSessionDaoSupport implements
		IMessagelIpnDAO {

	@Override
	public void insertMessageIpn(MessageIpnDTO messageIpn) {

		getSqlSession().insert("it.othala.messageIpn.queries.insertMessageIpn",
				messageIpn);

	}

	@Override
	public int getIdTransaction(long idOrder, String idTransaction,String status) {
		
		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("idOrder", idOrder);
		mapProduct.put("idTransaction", idTransaction);
		mapProduct.put("status", status);

		Integer qtIdTransaction = getSqlSession().selectOne(
				"it.othala.messageIpn.queries.getIdTransaction", mapProduct);

		return qtIdTransaction;
	}

}
