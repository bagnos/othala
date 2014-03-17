package it.othala.service;

import it.othala.dao.interfaces.IArticleDAO;
import it.othala.dto.ArticleDTO;
import it.othala.service.interfaces.IArticleService;

import java.util.List;

public class ArticleService implements IArticleService {

	private IArticleDAO articleDAO;

	public void setArticleDAO(IArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}

	@Override
	public List<ArticleDTO> getListArticle(int languages) {

		List<ArticleDTO> articleDTO = articleDAO.getListArticle(languages);

		return articleDTO;

	}

}
