package it.othala.dao;

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
	public int getIdTransaction(long idOrder, String idTransaction) {
		// TODO Auto-generated method stub
		return 0;
	}

}
