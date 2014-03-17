package it.othala.dao.interfaces;

import java.util.List;

import it.othala.dto.ArticleDTO;

public interface IArticleDAO {

	public List<ArticleDTO> getListArticle(Integer languages);

}
