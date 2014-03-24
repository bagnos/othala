package it.othala.service;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.service.interfaces.IProductService;

import java.math.BigDecimal;
import java.util.List;

public class ProductService implements IProductService {

	private IProductDAO productDAO;

	public void setArticleDAO(IProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public List<ProductDTO> getListProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals) {

		List<ProductDTO> listProduct = productDAO.listProduct(languages, type,
				gender, brand, minPrice, maxPrice, size, color, newArrivals);

		// recupero attributi del prodotto
		for (int i = 0; i <= listProduct.size() - 1; i++) {

			List<AttributeDTO> listAttribute = productDAO.listProductAttribute(
					languages.toString(), listProduct.get(i).getIdProduct());

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

			List<String> newString = productDAO.listDistinctArticleAttribute(
					languages.toString(), listProduct.get(i).getIdProduct(),
					new Integer(4));

			listProduct.get(i).setSize(newString);

		}

		// recupero attributo colori degli articoli
		for (int i = 0; i <= listProduct.size() - 1; i++) {

			List<String> newString = productDAO.listDistinctArticleAttribute(
					languages.toString(), listProduct.get(i).getIdProduct(),
					new Integer(3));

			listProduct.get(i).setColor(newString);

		}

		return listProduct;

	}

	@Override
	public DomainDTO getDomain(String languages) {

		List<AttributeDTO> listSize = productDAO.listDomain(languages, 4);
		List<AttributeDTO> listColor = productDAO.listDomain(languages, 3);
		List<AttributeDTO> listBrand = productDAO.listDomain(languages, 5);
		List<AttributeDTO> listType = productDAO.listDomain(languages, 2);
		List<AttributeDTO> listGender = productDAO.listDomain(languages, 1);

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

		List<MenuDTO> listMenu = productDAO.listMenu(languages);

		for (int i = 0; i <= listMenu.size() - 1; i++) {

			List<SubMenuDTO> listSubMenu = productDAO.listSubMenu(
					listMenu.get(i).getIdGender(), languages);

			listMenu.get(i).setSubMenu(listSubMenu);

		}

		return listMenu;

	}

	@Override
	public ProductFullDTO getProductFull(String languages, Integer idProduct) {
		// TODO Auto-generated method stub
		ProductFullDTO productFull = productDAO.getProductFull(languages,
				idProduct);

		List<String> newString = productDAO.listProductImages(idProduct);

		productFull.setImagesUrl(newString);

		List<ArticleFullDTO> listArticleFull = productDAO.listArticleFull(
				idProduct, languages);

		productFull.setArticles(listArticleFull);

		return productFull;
	}

	@Override
	public Integer insertProduct(ProductFullDTO productFull) {
		return productDAO.insertProduct(productFull);

	}
}
