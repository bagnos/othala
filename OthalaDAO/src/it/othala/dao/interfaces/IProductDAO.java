package it.othala.dao.interfaces;

import java.util.List;

import it.othala.dto.ProductDTO;

public interface IProductDAO {

	public List<ProductDTO> getListProduct(Integer languages);

}
