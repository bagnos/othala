package it.othala.dao;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.ProductDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProductDAO extends SqlSessionDaoSupport implements IProductDAO {

	@Override
	public List<ProductDTO> getListProduct(Integer languages) {
		// TODO Auto-generated method stub

		
		// recupero prodotti
		List<ProductDTO> listProduct = getSqlSession().selectList(
				"it.othala.product.queries.listProduct", languages.toString());

		// recupero immagini per ogni prodotto
		for (int i = 0; i <= listProduct.size() - 1; i++) {
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			List<String> newString = getSqlSession().selectList(
					"it.othala.product.queries.listProductImages", map);
			listProduct.get(i).setImagesUrl(newString.get(0));

		}
		
		// recupero attributi del prodotto
		for (int i = 0; i <= listProduct.size() - 1; i++) {
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			map.put("languages", languages.toString());
			List<AttributeDTO> listAttribute = getSqlSession().selectList(
					"it.othala.product.queries.listProductAttribute", map);
			for (int y = 0; y <= listAttribute.size() - 1; y++) {

				if (listAttribute.get(y).getAttributo() == 1) {
					listProduct.get(i).setGender(listAttribute.get(y).getValore());
				}
				
				if (listAttribute.get(y).getAttributo() == 5) {
					listProduct.get(i).setBrand(listAttribute.get(y).getValore());
				}
				
				if (listAttribute.get(y).getAttributo() == 2) {
					listProduct.get(i).setType(listAttribute.get(y).getValore());
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
					"it.othala.product.queries.listArticleAttribute", map);
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
					"it.othala.product.queries.listArticleAttribute", map);
			listProduct.get(i).setColor(newString);

		}

	
		return listProduct;
	}
}
