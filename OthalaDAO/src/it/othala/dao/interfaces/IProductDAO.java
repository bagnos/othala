package it.othala.dao.interfaces;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.OrderByCartFlow;

import java.math.BigDecimal;
import java.util.List;

public interface IProductDAO {

	public List<MenuDTO> listMenu(String languages);

	public List<SubMenuDTO> listSubMenu(Integer idMenu, String languages);

	public List<String> listDistinctArticleSize(Integer idProduct);

	public List<String> listDistinctArticleColor(Integer idProduct,
			String languages);

	public List<AttributeDTO> listSize();

	public List<AttributeDTO> listColor(String languages);

	public List<AttributeDTO> listBrand(String languages);

	public List<AttributeDTO> listType(String languages);

	public List<AttributeDTO> listGender(String languages);

	public List<String> listProductImages(Integer idProduct);

	public List<ProductDTO> listProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order);

	public ProductFullDTO getProductFull(String languages, Integer idProduct);

	public List<ArticleFullDTO> listArticleFull(Integer idProduct,
			String languages);

	public Integer insertProduct(ProductFullDTO productFull);

}
