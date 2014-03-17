package it.othala.service.interfaces;

import java.util.List;

import it.othala.dto.ArticleDTO;

public interface IProductService {

	public List<ArticleDTO> getListProduct(int languages);
	
}
