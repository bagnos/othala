package it.othala.dao.interfaces;

import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;

import java.math.BigDecimal;
import java.util.List;

public interface IProductDAO {

	public List<ProductDTO> getListProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals);

	public DomainDTO getDomain(String languages);

	public List<MenuDTO> getMenu(String languages);

}
