package it.othala.dao;

import it.othala.dao.interfaces.IArticleDAO;
import it.othala.dto.ArticleDTO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ArticleDAO extends SqlSessionDaoSupport implements IArticleDAO {

	@Override
	public List<ArticleDTO> getListArticle(Integer languages) {
		// TODO Auto-generated method stub

		List<ArticleDTO> newArticle = getSqlSession().selectList(
				"it.othala.article.queries.listArticle", languages.toString());
		
		for (int i = 0; i <= newArticle.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(4);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", newArticle.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			List<String> newString = getSqlSession().selectList("it.othala.article.queries.listArticleAttribute", map);
			newArticle.get(i).setSize(newString);			
			
		}
		
		for (int i = 0; i <= newArticle.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(3);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", newArticle.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			List<String> newString = getSqlSession().selectList("it.othala.article.queries.listArticleAttribute", map);
			newArticle.get(i).setColor(newString);			
			
		}
		
		for (int i = 0; i <= newArticle.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(5);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", newArticle.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			String newString = getSqlSession().selectOne("it.othala.article.queries.getProductAttribute", map);
			newArticle.get(i).setBrand(newString);			
			
		}
		
		for (int i = 0; i <= newArticle.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(1);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", newArticle.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			String newString = getSqlSession().selectOne("it.othala.article.queries.getProductAttribute", map);
			newArticle.get(i).setGenere(newString);			
			
		}
		
		for (int i = 0; i <= newArticle.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(2);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", newArticle.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			String newString = getSqlSession().selectOne("it.othala.article.queries.getProductAttribute", map);
			newArticle.get(i).setTipologia(newString);			
			
		}
		for (int i = 0; i <= newArticle.size() - 1; i++) { 
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", newArticle.get(i).getIdProduct().toString());
			List<String> newString = getSqlSession().selectList("it.othala.article.queries.listProductImages", map);
			newArticle.get(i).setImagesUrl(newString.get(0));			
			
		}
		
		
		
		return newArticle;
	}

}
