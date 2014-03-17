package it.othala.service.interfaces;

import java.util.List;

import it.othala.dto.ProductDTO;

public interface IProductService {

	public List<ProductDTO> getListProduct(int languages);
	
}
