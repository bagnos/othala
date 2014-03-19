package it.othala.service.interfaces;

import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;

import java.math.BigDecimal;
import java.util.List;

public interface IProductService {

	public List<ProductDTO> getListProduct(Integer languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals);

	public DomainDTO getDomain(Integer languages);

	public List<MenuDTO> getMenu(Integer languages);

}
