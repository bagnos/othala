package it.othala.dao;

import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dto.AccountDTO;

import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class AccountDAO extends SqlSessionDaoSupport implements IAccountDAO {

	@Override
	public int insertAccount(AccountDTO account) {
		// TODO Auto-generated method stub
		return getSqlSession().insert(
				"it.othala.account.queries.insertAccount", account);
	}

	@Override
	public int existAccount(String email) {
		// TODO Auto-generated method stub
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("idUser", email);
		return getSqlSession().selectOne(
				"it.othala.account.queries.getAccount", map);
	}

	@Override
	public int deleteAccount(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAccount(String email, AccountDTO account) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePsw(String email, String psw) {
		// TODO Auto-generated method stub
		return 0;
	}

}
