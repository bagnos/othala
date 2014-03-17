package it.othala.dao;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ProductDTO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProductDAO extends SqlSessionDaoSupport implements IProductDAO {

	@Override
	public List<ProductDTO> getListProduct(Integer languages) {
		// TODO Auto-generated method stub

		List<ProductDTO> listProduct = getSqlSession().selectList(
				"it.othala.product.queries.listProduct", languages.toString());
		
		for (int i = 0; i <= listProduct.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(4);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			List<String> newString = getSqlSession().selectList("it.othala.product.queries.listArticleAttribute", map);
			listProduct.get(i).setSize(newString);			
			
		}
		
		for (int i = 0; i <= listProduct.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(3);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			List<String> newString = getSqlSession().selectList("it.othala.product.queries.listArticleAttribute", map);
			listProduct.get(i).setColor(newString);			
			
		}
		
		for (int i = 0; i <= listProduct.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(5);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			String newString = getSqlSession().selectOne("it.othala.product.queries.getProductAttribute", map);
			listProduct.get(i).setBrand(newString);			
			
		}
		
		for (int i = 0; i <= listProduct.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(1);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			String newString = getSqlSession().selectOne("it.othala.product.queries.getProductAttribute", map);
			listProduct.get(i).setGenere(newString);			
			
		}
		
		for (int i = 0; i <= listProduct.size() - 1; i++) { 
			Integer idProductAttribute = new Integer(2);
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			map.put("idProductAttribute", idProductAttribute.toString());
			map.put("languages", languages.toString());
			String newString = getSqlSession().selectOne("it.othala.product.queries.getProductAttribute", map);
			listProduct.get(i).setTipologia(newString);			
			
		}
		for (int i = 0; i <= listProduct.size() - 1; i++) { 
			HashMap<String, String> map = new HashMap<>();
			map.put("idProduct", listProduct.get(i).getIdProduct().toString());
			List<String> newString = getSqlSession().selectList("it.othala.product.queries.listProductImages", map);
			listProduct.get(i).setImagesUrl(newString.get(0));			
			
		}
		
		
		
		return listProduct;
	}

}
