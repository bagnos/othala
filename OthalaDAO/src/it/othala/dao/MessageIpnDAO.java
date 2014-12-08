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
	public int getIdTransaction(String idTransaction,String txStato) {
		
		HashMap<String, Object> mapProduct = new HashMap<>();
		
		mapProduct.put("idTransaction", idTransaction);
		mapProduct.put("txStato", txStato);
		

		Integer qtIdTransaction = getSqlSession().selectOne(
				"it.othala.messageIpn.queries.getIdTransaction", mapProduct);

		return qtIdTransaction;
	}

}
