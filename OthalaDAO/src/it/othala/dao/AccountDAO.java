package it.othala.dao;

import it.othala.dao.interfaces.IAccountDAO;
import it.othala.dto.AccountDTO;
import it.othala.dto.MailDTO;
import it.othala.dto.MailGroupDTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	public int changeStateAccount(List<String> email, int stato) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("stato", stato);
		return getSqlSession().update("it.othala.account.queries.changeStateAccount", map);
	}

	@Override
	public int changeStateAccount(String email, int stato) {

		List<String> listEmail = new ArrayList<String>();
		listEmail.add(email);

		return changeStateAccount(listEmail, stato);

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
	public AccountDTO verifyPassword(String email, String psw) {
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("psw", psw);
		return (AccountDTO) getSqlSession().selectOne("it.othala.account.queries.verifyPassword", map);
	}

	@Override
	public List<AccountDTO> getAccount() {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<>();
		return getSqlSession().selectList("it.othala.account.queries.getAccount", map);
	}

	@Override
	public List<AccountDTO> getAccount(String cognome, String nome) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<>();
		if (nome != null && !nome.isEmpty()) {
			map.put("name", nome);
		}
		if (cognome != null && !cognome.isEmpty()) {
			map.put("surname", cognome + "%");
		}
		return getSqlSession().selectList("it.othala.account.queries.getAccount", map);
	}

	

	@Override
	public void insertMail(Integer idMailGroup, String txUser, String txNome) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idMailGroup", idMailGroup);
		map.put("txUser", txUser);
		map.put("txNome", txNome);
		getSqlSession().insert("it.othala.account.queries.insertMail", map);

	}

	@Override
	public void updateMail(Integer idMail, Integer idMailGroup, String txUser, String txNome) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idMail", idMail);
		map.put("idMailGroup", idMailGroup);
		map.put("txUser", txUser);
		map.put("txNome", txNome);
		getSqlSession().update("it.othala.account.queries.updateMail", map);

	}

	@Override
	public void deleteMail(Integer idMail) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idMail", idMail);

		getSqlSession().delete("it.othala.account.queries.deleteMail", map);

	}

	@Override
	public void insertMailGroup(String txMailGroup) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("txMailGroup", txMailGroup);

		getSqlSession().insert("it.othala.account.queries.insertMailGroup", map);

	}

	@Override
	public void updateMailGroup(Integer idMailGroup, String txMailGroup) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idMailGroup", idMailGroup);
		map.put("txMailGroup", txMailGroup);
		getSqlSession().update("it.othala.account.queries.updateMailGroup", map);

	}

	@Override
	public void deleteMailGroup(Integer idMailGroup) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idMailGroup", idMailGroup);

		getSqlSession().delete("it.othala.account.queries.deleteMailGroup", map);

	}

	@Override
	public List<MailGroupDTO> listMailGroup(Integer idMailGroup) {
		HashMap<String, Object> map = new HashMap<>();
		if (idMailGroup != null && idMailGroup != 0) {
			map.put("idMailGroup", idMailGroup);
		}

		List<MailGroupDTO> outList = getSqlSession().selectList("it.othala.account.queries.listMailGroup", map);
		
		if (idMailGroup == null || idMailGroup == 0) {
			MailGroupDTO globalList = new MailGroupDTO();
			globalList.setIdMailGroup(0);
			globalList.setTxMailGroup("Globale");
			outList.add(globalList);
		}
		
		return outList;
		

		
		

	}

	@Override
	public List<MailDTO> listMail(Integer idMailGroup, String txUser) {
		HashMap<String, Object> map = new HashMap<>();
		if (idMailGroup != null && idMailGroup != 0) {
			map.put("idMailGroup", idMailGroup);
		}
		if (txUser != null && !txUser.isEmpty()) {
			map.put("txUser", txUser);
		}

		return getSqlSession().selectList("it.othala.account.queries.listMail", map);

	}

}
