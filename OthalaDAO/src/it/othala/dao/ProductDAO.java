package it.othala.dao;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
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
	public List<ProductDTO> getListProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals) {
		// TODO Auto-generated method stub

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

		
		// recupero attributi del prodotto
		for (int i = 0; i <= listProduct.size() - 1; i++) {
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			map.put("languages", languages.toString());
			List<AttributeDTO> listAttribute = getSqlSession().selectList(
					"it.othala.product.queries.listProductAttribute", map);
			for (int y = 0; y <= listAttribute.size() - 1; y++) {

				if (listAttribute.get(y).getAttributo() == 1) {
					listProduct.get(i).setGender(
							listAttribute.get(y).getValore());
				}

				if (listAttribute.get(y).getAttributo() == 5) {
					listProduct.get(i).setBrand(
							listAttribute.get(y).getValore());
				}

				if (listAttribute.get(y).getAttributo() == 2) {
					listProduct.get(i)
							.setType(listAttribute.get(y).getValore());
				}
			}

		}

		// recupero attributo taglie degli articoli
		for (int i = 0; i <= listProduct.size() - 1; i++) {
			Integer idProductAttribute = new Integer(4);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			List<String> newString = getSqlSession().selectList(
					"it.othala.product.queries.listDistinctArticleAttribute",
					map);
			listProduct.get(i).setSize(newString);

		}

		// recupero attributo colori degli articoli
		for (int i = 0; i <= listProduct.size() - 1; i++) {
			Integer idProductAttribute = new Integer(3);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			List<String> newString = getSqlSession().selectList(
					"it.othala.product.queries.listDistinctArticleAttribute",
					map);
			listProduct.get(i).setColor(newString);

		}

		return listProduct;
	}

	@Override
	public DomainDTO getDomain(String languages) {
		// TODO Auto-generated method stub
		HashMap<String, Object> mapSize = new HashMap<>();
		mapSize.put("languages", languages);
		mapSize.put("idProductAttribute", 4);

		List<AttributeDTO> listSize = getSqlSession().selectList(
				"it.othala.product.queries.listDomain", mapSize);

		HashMap<String, Object> mapColor = new HashMap<>();
		mapColor.put("languages", languages);
		mapColor.put("idProductAttribute", 3);

		List<AttributeDTO> listColor = getSqlSession().selectList(
				"it.othala.product.queries.listDomain", mapColor);

		HashMap<String, Object> mapBrand = new HashMap<>();
		mapBrand.put("languages", languages);
		mapBrand.put("idProductAttribute", 5);

		List<AttributeDTO> listBrand = getSqlSession().selectList(
				"it.othala.product.queries.listDomain", mapBrand);
		
		HashMap<String, Object> mapType = new HashMap<>();
		mapType.put("languages", languages);
		mapType.put("idProductAttribute", 2);

		List<AttributeDTO> listType = getSqlSession().selectList(
				"it.othala.product.queries.listDomain", mapType);
		
		HashMap<String, Object> mapGender = new HashMap<>();
		mapGender.put("languages", languages);
		mapGender.put("idProductAttribute", 1);

		List<AttributeDTO> listGender = getSqlSession().selectList(
				"it.othala.product.queries.listDomain", mapGender);

		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(listSize);
		domainDTO.setColor(listColor);
		domainDTO.setBrand(listBrand);
		domainDTO.setGender(listGender);
		domainDTO.setType(listType);

		return domainDTO;
	}

	@Override
	public List<MenuDTO> getMenu(String languages) {
		// TODO Auto-generated method stub
		HashMap<String, Object> mapMenu = new HashMap<>();
		mapMenu.put("languages", languages);

		List<MenuDTO> listMenu = getSqlSession().selectList(
				"it.othala.product.queries.listMenu", mapMenu);

		for (int i = 0; i <= listMenu.size() - 1; i++) {

			HashMap<String, Object> map = new HashMap<>();
			map.put("idMenu", listMenu.get(i).getIdGender());
			map.put("languages", languages);
			List<SubMenuDTO> listSubMenu = getSqlSession().selectList(
					"it.othala.product.queries.listSubMenu", map);
			listMenu.get(i).setSubMenu(listSubMenu);

		}

		return listMenu;
	}

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
		
		HashMap<String, Object> map1 = new HashMap<>();
		
		getSqlSession().insert("it.othala.product.queries.insertProduct", map1);
		
		HashMap<String, Object> map2 = new HashMap<>();
		
		getSqlSession().insert("it.othala.product.queries.insertProductDescription", map2);
		
		HashMap<String, Object> map3 = new HashMap<>();
		
		getSqlSession().insert("it.othala.product.queries.insertProductAttribute", map3);
		
		HashMap<String, Object> map4 = new HashMap<>();
		
		getSqlSession().insert("it.othala.product.queries.insertArticle", map4);
		
		HashMap<String, Object> map5 = new HashMap<>();
		
		getSqlSession().insert("it.othala.product.queries.insertArticleAttribute", map5);
	
		HashMap<String, Object> map6 = new HashMap<>();
		
		getSqlSession().insert("it.othala.product.queries.insertProductImage", map6);
	
		return null;
		
	}
}
