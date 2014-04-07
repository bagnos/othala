package it.othala.dao;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.AttributeSizeDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.OrderByCartFlow;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProductDAO extends SqlSessionDaoSupport implements IProductDAO {

	@Override
	public List<MenuDTO> listMenu(String languages) {

		HashMap<String, Object> mapMenu = new HashMap<>();
		mapMenu.put("languages", languages);

		List<MenuDTO> listMenu = getSqlSession().selectList(
				"it.othala.product.queries.listMenu", mapMenu);

		return listMenu;

	}

	@Override
	public List<SubMenuDTO> listSubMenu(Integer idMenu, String languages) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("idMenu", idMenu);
		map.put("languages", languages);
		List<SubMenuDTO> listSubMenu = getSqlSession().selectList(
				"it.othala.product.queries.listSubMenu", map);

		return listSubMenu;

	}

	@Override
	public List<ProductDTO> listProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("languages", languages);
		mapProduct.put("type", type);
		mapProduct.put("gender", gender);
		mapProduct.put("brand", brand);
		mapProduct.put("minPrice", minPrice);
		mapProduct.put("maxPrice", maxPrice);
		mapProduct.put("size", size);
		mapProduct.put("color", color);
		mapProduct.put("newArrivals", newArrivals);
		if (order == null) {
			mapProduct.put("order", OrderByCartFlow.PREZZOASC.getState());
		}
		else
		{
			mapProduct.put("order", order.getState());
			
		}
		
		

		// recupero prodotti
		List<ProductDTO> listProduct = getSqlSession().selectList(
				"it.othala.product.queries.listProduct", mapProduct);

		return listProduct;
	}

	@Override
	public List<String> listDistinctArticleSize(Integer idProduct) {

		HashMap<String, String> map = new HashMap<>();
		map.put("idProduct", idProduct.toString());
		List<String> newString = getSqlSession().selectList(
				"it.othala.product.queries.listDistinctArticleSize", map);
		return newString;
	}

	@Override
	public List<String> listDistinctArticleColor(Integer idProduct,
			String languages) {

		HashMap<String, String> map = new HashMap<>();
		map.put("idProduct", idProduct.toString());
		map.put("languages", languages);
		List<String> newString = getSqlSession().selectList(
				"it.othala.product.queries.listDistinctArticleColor", map);
		return newString;
	}

	@Override
	public List<AttributeSizeDTO> listSize() {

		List<AttributeSizeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listSize");

		return listAttribute;

	}

	@Override
	public List<AttributeDTO> listColor(String languages) {

		HashMap<String, Object> mapAttribute = new HashMap<>();
		mapAttribute.put("languages", languages);

		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listColor", mapAttribute);

		return listAttribute;

	}

	@Override
	public List<AttributeDTO> listBrand(String languages) {

		HashMap<String, Object> mapAttribute = new HashMap<>();
		mapAttribute.put("languages", languages);

		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listBrand", mapAttribute);

		return listAttribute;

	}
	
	@Override
	public List<AttributeDTO> listType(String languages) {

		HashMap<String, Object> mapAttribute = new HashMap<>();
		mapAttribute.put("languages", languages);

		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listType", mapAttribute);

		return listAttribute;

	}
	
	@Override
	public List<AttributeDTO> listGender(String languages) {

		HashMap<String, Object> mapAttribute = new HashMap<>();
		mapAttribute.put("languages", languages);

		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listGender", mapAttribute);

		return listAttribute;

	}
	
	
	@Override
	public List<String> listProductImages(Integer idProduct) {

		HashMap<String, Object> map1 = new HashMap<>();
		map1.put("idProduct", idProduct);

		List<String> newString = getSqlSession().selectList(
				"it.othala.product.queries.listProductImages", map1);

		return newString;

	}
	

	@Override
	public ProductFullDTO getProductFull(String languages, Integer idProduct) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("languages", languages);
		mapProduct.put("idProduct", idProduct);

		ProductFullDTO productFull = getSqlSession().selectOne(
				"it.othala.product.queries.getProductFull", mapProduct);

		return productFull;

	}



	@Override
	public List<ArticleFullDTO> listArticleFull(Integer idProduct,
			String languages) {

		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("idProduct", idProduct);
		map2.put("languages", languages);

		List<ArticleFullDTO> listArticleFull = getSqlSession().selectList(
				"it.othala.product.queries.listArticleFull", map2);

		return listArticleFull;

	}
	
	
	
	@Override
	public Integer insertProduct(ProductFullDTO productFull) {

		getSqlSession().insert("it.othala.product.queries.insertProduct",
				productFull);

		HashMap<String, Object> map2 = new HashMap<>();

		for (int i = 0; i <= productFull.getLangDescription().size() - 1; i++) {
			map2.clear();
			map2.put("idProduct", productFull.getIdProduct());
			map2.put("idLanguages", productFull.getLangDescription().get(i)
					.getLanguages());
			map2.put("txDescription", productFull.getLangDescription().get(i)
					.getDescription());

			getSqlSession().insert(
					"it.othala.product.queries.insertProductDescription", map2);
		}

	
		HashMap<String, Object> map4 = new HashMap<>();

		for (int i = 0; i <= productFull.getArticles().size() - 1; i++) {
			map4.clear();
			map4.put("idProduct", productFull.getIdProduct());
			map4.put("pgArticle", productFull.getArticles().get(i)
					.getPgArticle());
			map4.put("idSize", productFull.getArticles().get(i)
					.getIdSize());
			map4.put("idColor", productFull.getArticles().get(i)
					.getIdColor());
			map4.put("qtStock", productFull.getArticles().get(i).getQtStock());
			map4.put("thumbnailsUrl", productFull.getArticles().get(i).getThumbnailsUrl());
			getSqlSession().insert("it.othala.product.queries.insertArticle",
					map4);

		}

		for (int i = 0; i <= productFull.getImagesUrl().size() - 1; i++) {
			map2.clear();
			map2.put("idProduct", productFull.getIdProduct());
			map2.put("pgImage", i + 1);
			map2.put("txImageUrl", productFull.getImagesUrl().get(i));

			getSqlSession().insert(
					"it.othala.product.queries.insertProductImage", map2);
		}

		return productFull.getIdProduct();

	}

	
	
	
	
	
	
	
	
	
	
	

}
