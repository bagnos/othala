package it.othala.dao;

import it.othala.dao.interfaces.IArticleDAO;
import it.othala.dto.ArticleDTO;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ArticleDAO extends SqlSessionDaoSupport implements IArticleDAO {

	@Override
	public List<ArticleDTO> getListArticle(int languages) {
		// TODO Auto-generated method stub

		return getSqlSession().selectList(
				"it.othala.article.queries.listArticle", languages);
	}

}
