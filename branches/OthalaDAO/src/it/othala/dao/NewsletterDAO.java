package it.othala.dao;

import it.othala.dao.interfaces.INewsletterDAO;

import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class NewsletterDAO extends SqlSessionDaoSupport implements INewsletterDAO {

	@Override
	public int insertNewsletter(String email) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		return getSqlSession().insert("it.othala.newsletter.queries.insertMailNewsLetter", map);
	}

	@Override
	public int existNewsletter(String email) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		return getSqlSession().selectOne("it.othala.newsletter.queries.getMailNewsLetter", map);
	}

}
