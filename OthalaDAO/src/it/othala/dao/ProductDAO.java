package it.othala.dao;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.SubMenuDTO;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProductDAO extends SqlSessionDaoSupport implements IProductDAO {

	@Override
	public ProductFullDTO getProductFull(String languages, Integer idProduct) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("languages", languages);
		mapProduct.put("idProduct", idProduct);

		ProductFullDTO productFull = getSqlSession().selectOne(
				"it.othala.product.queries.getProductFull", mapProduct);

		HashMap<String, Object> map1 = new HashMap<>();
		map1.put("idProduct", idProduct);

		List<String> newString = getSqlSession().selectList(
				"it.othala.product.queries.listProductImages", map1);
		productFull.setImagesUrl(newString);

		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("idProduct", idProduct);
		map2.put("languages", languages);

		List<ArticleFullDTO> listArticleFull = getSqlSession().selectList(
				"it.othala.product.queries.listArticleFull", map2);

		productFull.setArticles(listArticleFull);

		return productFull;

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

		HashMap<String, Object> map3 = new HashMap<>();
		map3.put("idProduct", productFull.getIdProduct());
		map3.put("idProductAttribute", productFull.getIdGender());
		map3.put("pgProductAttribute", productFull.getPgGender());

		getSqlSession().insert(
				"it.othala.product.queries.insertProductAttribute", map3);

		map3.clear();
		map3.put("idProduct", productFull.getIdProduct());
		map3.put("idProductAttribute", productFull.getIdType());
		map3.put("pgProductAttribute", productFull.getPgType());

		getSqlSession().insert(
				"it.othala.product.queries.insertProductAttribute", map3);

		map3.clear();
		map3.put("idProduct", productFull.getIdProduct());
		map3.put("idProductAttribute", productFull.getIdBrand());
		map3.put("pgProductAttribute", productFull.getPgBrand());

		getSqlSession().insert(
				"it.othala.product.queries.insertProductAttribute", map3);

		HashMap<String, Object> map4 = new HashMap<>();

		for (int i = 0; i <= productFull.getArticles().size() - 1; i++) {
			map4.clear();
			map4.put("idProduct", productFull.getIdProduct());
			map4.put("pgArticle", productFull.getArticles().get(i)
					.getPgArticle());
			map4.put("qtStock", productFull.getArticles().get(i).getQtStock());

			getSqlSession().insert("it.othala.product.queries.insertArticle",
					map4);

			map4.clear();

			map4.put("idProduct", productFull.getIdProduct());
			map4.put("pgArticle", productFull.getArticles().get(i)
					.getPgArticle());
			map4.put("idProductAttribute", productFull.getArticles().get(i)
					.getIdSize());
			map4.put("pgProductAttribute", productFull.getArticles().get(i)
					.getPgSize());

			getSqlSession().insert(
					"it.othala.product.queries.insertArticleAttribute", map4);

			map4.clear();

			map4.put("idProduct", productFull.getIdProduct());
			map4.put("pgArticle", productFull.getArticles().get(i)
					.getPgArticle());
			map4.put("idProductAttribute", productFull.getArticles().get(i)
					.getIdColor());
			map4.put("pgProductAttribute", productFull.getArticles().get(i)
					.getPgColor());

			getSqlSession().insert(
					"it.othala.product.queries.insertArticleAttribute", map4);

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

	@Override
	public List<ProductDTO> listProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals) {

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

		// recupero prodotti
		List<ProductDTO> listProduct = getSqlSession().selectList(
				"it.othala.product.queries.listProduct", mapProduct);

		return listProduct;
	}

	@Override
	public List<AttributeDTO> listProductAttribute(String languages,
			Integer idProduct) {

		HashMap<String, String> map = new HashMap<>();
		map.put("idProduct", idProduct.toString());
		map.put("languages", languages.toString());
		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listProductAttribute", map);
		return listAttribute;
	}

	@Override
	public List<String> listDistinctArticleAttribute(String languages,
			Integer idProduct, Integer idProductAttribute) {

		HashMap<String, String> map = new HashMap<>();
		map.put("idProduct", idProduct.toString());
		map.put("idProductAttribute", idProductAttribute.toString());
		map.put("languages", languages.toString());
		List<String> newString = getSqlSession().selectList(
				"it.othala.product.queries.listDistinctArticleAttribute", map);
		return newString;
	}

	@Override
	public List<AttributeDTO> listDomain(String languages,
			Integer idProductAttribute) {

		HashMap<String, Object> mapAttribute = new HashMap<>();
		mapAttribute.put("languages", languages);
		mapAttribute.put("idProductAttribute", idProductAttribute);

		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listDomain", mapAttribute);

		return listAttribute;

	}

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

}
