package it.othala.service.interfaces;


import java.util.List;

import it.othala.dto.ArticleDTO;

public interface IArticleService {

	public List<ArticleDTO> getListArticle(int languages);

	
}
