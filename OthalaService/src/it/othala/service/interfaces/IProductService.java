package it.othala.service.interfaces;

import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.enums.OrderByCartFlow;

import java.math.BigDecimal;
import java.util.List;

public interface IProductService {

	public List<ProductDTO> getListProduct(String languages, Integer gender,
			Integer type, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order);

	public DomainDTO getDomain(String languages);

	public List<MenuDTO> getMenu(String languages);

	public ProductFullDTO getProductFull(String languages, Integer idProduct);

	
	 public Integer insertProduct(ProductFullDTO productFull);
	
}
