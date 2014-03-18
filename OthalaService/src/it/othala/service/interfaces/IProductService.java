package it.othala.service.interfaces;

import java.math.BigDecimal;
import java.util.List;

import it.othala.dto.ProductDTO;

public interface IProductService {

	public List<ProductDTO> getListProduct(Integer languages, Integer type, Integer gender, Integer brand, BigDecimal minPrice, BigDecimal maxPrice, Integer size, Integer color, Boolean newArrivals);

	
}
