package it.othala.service;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.DomainDTO;
import it.othala.dto.ProductDTO;
import it.othala.service.interfaces.IProductService;

import java.math.BigDecimal;
import java.util.List;

public class ProductService implements IProductService {

	private IProductDAO productDAO;

	public void setArticleDAO(IProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public List<ProductDTO> getListProduct(Integer languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals) {

		List<ProductDTO> productDTO = productDAO.getListProduct(languages,type, gender, brand, minPrice, maxPrice, size, color, newArrivals);

		return productDTO;

	}

	@Override
	public DomainDTO getDomain(Integer languages) {

		DomainDTO domainDTO = productDAO.getDomain(languages);

		return domainDTO;

	}
	
}
