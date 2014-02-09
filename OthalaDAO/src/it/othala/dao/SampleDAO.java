package it.othala.dao;

import it.othala.dao.interfaces.ISampleDAO;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class SampleDAO extends SqlSessionDaoSupport implements ISampleDAO {

	@Override
	public Integer getId() {
		// TODO Auto-generated method stub
		return (Integer) getSqlSession().selectOne("it.othala.sample.queries.getId");
	}

}
