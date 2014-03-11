package it.othala.dao;

import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dto.AccountDTO;

import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class AccountDAO extends SqlSessionDaoSupport implements IAccountDAO {

	@Override
	public int insertAccount(AccountDTO account) {
		// TODO Auto-generated method stub
		return getSqlSession().insert("it.othala.account.queries.insertAccount", account);
	}

	@Override
	public int existAccount(String email) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("idUser", email);
		return getSqlSession().selectOne("it.othala.account.queries.existAccount", map);
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

	@Override
	public int changeStateAccount(String email, int stato) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("stato", stato);
		return getSqlSession().update("it.othala.account.queries.changeStateAccount", map);
	}

	@Override
	public AccountDTO getAccount(String email) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		return getSqlSession().selectOne("it.othala.account.queries.getAccount", map);
	}

	@Override
	public int updatePassword(String email, String psw) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("psw", psw);
		return getSqlSession().update("it.othala.account.queries.updateAccountPsw", map);
	}

	@Override
	public int insertAccountRole(String email, String role) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("role", role);
		return getSqlSession().insert("it.othala.account.queries.insertAccountRole", map);
	}

	@Override
	public String verifyPassword(String email, String psw) {
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("psw", psw);
		return getSqlSession().selectOne("it.othala.account.queries.verifyPassword", map);
	}

}
