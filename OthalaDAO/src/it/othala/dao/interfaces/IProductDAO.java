package it.othala.dao.interfaces;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.SubMenuDTO;

import java.math.BigDecimal;
import java.util.List;

public interface IProductDAO {


	public ProductFullDTO getProductFull(String languages, Integer idProduct);

	public Integer insertProduct(ProductFullDTO productFull);
	
	
	
	
	
	public List<ProductDTO> listProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals);
	
	public List<AttributeDTO> listProductAttribute(String languages, Integer idProduct);

	public List<String> listDistinctArticleAttribute(String languages, Integer idProduct, Integer idProductAttribute);
	
	public List<AttributeDTO> listDomain(String languages, Integer idProductAttribute);
	
	public List<MenuDTO> listMenu(String languages);
	
	public List<SubMenuDTO> listSubMenu(Integer idMenu, String languages);

	public List<String> listProductImages(Integer idProduct);

	List<ArticleFullDTO> listArticleFull(Integer idProduct, String languages);
	

	
}
