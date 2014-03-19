package it.othala.service;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.service.interfaces.IProductService;

import java.math.BigDecimal;
import java.util.List;

public class ProductService implements IProductService {

	private IProductDAO productDAO;

	public void setArticleDAO(IProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public List<ProductDTO> getListProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals) {

		List<ProductDTO> productDTO = productDAO.getListProduct(languages,
				type, gender, brand, minPrice, maxPrice, size, color,
				newArrivals);

		return productDTO;

	}

	@Override
	public DomainDTO getDomain(String languages) {

		DomainDTO domainDTO = productDAO.getDomain(languages);

		return domainDTO;

	}

	@Override
	public List<MenuDTO> getMenu(String languages) {

		List<MenuDTO> menuDTO = productDAO.getMenu(languages);

		return menuDTO;

	}

	@Override
	public ProductFullDTO getProductFull(String languages, Integer idProduct) {
		// TODO Auto-generated method stub
		ProductFullDTO productFullDTO = productDAO.getProductFull(languages,
				idProduct);
		return productFullDTO;
	}
}
