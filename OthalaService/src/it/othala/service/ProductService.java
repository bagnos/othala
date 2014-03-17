package it.othala.service;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ProductDTO;
import it.othala.service.interfaces.IProductService;

import java.util.List;

public class ProductService implements IProductService {

	private IProductDAO productDAO;

	public void setArticleDAO(IProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public List<ProductDTO> getListProduct(int languages) {

		List<ProductDTO> productDTO = productDAO.getListProduct(languages);

		return productDTO;

	}

}
