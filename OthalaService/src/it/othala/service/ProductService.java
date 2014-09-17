package it.othala.service;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFindDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.OrderByCartFlow;
import it.othala.service.interfaces.IProductService;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class ProductService implements IProductService {

	private IProductDAO productDAO;

	public void setArticleDAO(IProductDAO productDAO) {
		this.productDAO = productDAO;
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
	public List<ProductDTO> getListProduct(String languages, Integer gender,
			Integer type, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
			Boolean fgCampaign) {

		List<ProductDTO> listProduct = productDAO.listProduct(languages, type,
				gender, brand, minPrice, maxPrice, size, color, newArrivals,
				order, idCampaign, fgCampaign);

		// recupero attributo taglie degli articoli

		for (int i = 0; i <= listProduct.size() - 1; i++) {

			List<String> newString = productDAO
					.listDistinctArticleSize(listProduct.get(i).getIdProduct());

			listProduct.get(i).setSize(newString);

		}

		// recupero attributo colori degli articoli

		for (int i = 0; i <= listProduct.size() - 1; i++) {

			List<String> newString = productDAO.listDistinctArticleColor(
					listProduct.get(i).getIdProduct(), languages.toString());

			listProduct.get(i).setColor(newString);

		}

		return listProduct;

	}

	@Override
	public DomainDTO getDomain(String languages) {

		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize());
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand(languages));
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setMaterial(productDAO.listMaterial(languages));
		domainDTO.setType(productDAO.listType(languages));
		domainDTO.setShop(productDAO.listShop());
		domainDTO.setStatesOrder(productDAO.listStatesOrder());
		domainDTO.setStatesProduct(productDAO.listStatesProduct());

		return domainDTO;

	}

	/* */

	@Override
	public ProductFullDTO getProductFull(String languages, Integer idProduct) {

		ProductFullDTO productFull = productDAO.getProductFull(languages,
				idProduct);

		List<String> newString = productDAO.listProductImages(idProduct);

		productFull.setImagesUrl(newString);

		List<ArticleFullDTO> listArticleFull = productDAO.listArticleFull(
				idProduct, languages);

		for (int i = 0; i <= listArticleFull.size() - 1; i++) {

			ShopDTO shop = productDAO.getShop(idProduct, listArticleFull.get(i)
					.getPgArticle());

			listArticleFull.get(i).setShop(shop);
		}

		productFull.setArticles(listArticleFull);

		return productFull;
	}

	@Override
	public ProductFullDTO getProductArticleFull(String languages,
			Integer idProduct, Integer pgArticle) {

		ProductFullDTO productFull = productDAO.getProductArticleFull(
				languages, idProduct, pgArticle);

		return productFull;
	}

	@Override
	public Integer insertProduct(ProductFullDTO productFull,
			Boolean fgPubblicazione) {
		return productDAO.insertProduct(productFull, fgPubblicazione);

	}
	
	@Override
	public void updateProduct(ProductFullDTO productFull) {
		productDAO.updateProduct(productFull);

	}

	@Override
	public Integer insertCampaign(CampaignDTO campaign) {
		return productDAO.insertCampaign(campaign);

	}

	@Override
	public DomainDTO insertBrand(String languages, String txBrand) {

		productDAO.insertBrand("it", txBrand);
		productDAO.insertBrand("en", txBrand);
		
		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize());
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand(languages));
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setType(productDAO.listType(languages));

		return domainDTO;

	}

	@Override
	public DomainDTO insertColor(String languages, String txColorIT, String txColorEN) {

		Integer maxIdColor = productDAO.getMaxIdColor();
		maxIdColor = maxIdColor + 1;
		productDAO.insertColor(maxIdColor, "it", txColorIT);
		productDAO.insertColor(maxIdColor, "en", txColorEN);

		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize());
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand(languages));
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setType(productDAO.listType(languages));

		return domainDTO;

	}
	
	@Override
	public DomainDTO insertMaterial(String languages, String txMaterialIT, String txMaterialEN) {

		Integer maxIdMaterial = productDAO.getMaxIdMaterial();
		maxIdMaterial = maxIdMaterial + 1;
		
		productDAO.insertMaterial(maxIdMaterial, "it", txMaterialIT);
		productDAO.insertMaterial(maxIdMaterial, "en", txMaterialEN);

		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize());
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand(languages));
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setType(productDAO.listType(languages));
		domainDTO.setMaterial(productDAO.listMaterial(languages));

		return domainDTO;

	}
	

	@Override
	public DomainDTO insertType(String languages, String txType) {

		productDAO.insertType(languages, txType);

		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize());
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand(languages));
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setType(productDAO.listType(languages));

		return domainDTO;

	}

	@Override
	public List<ProductDTO> getListProductToPublish() {

		List<ProductDTO> listProduct = productDAO.listProductToPublish();

		return listProduct;

	}

	@Override
	public List<CampaignDTO> getListCampaign() {

		List<CampaignDTO> listCampaign = productDAO.getListCampaign();

		return listCampaign;
	}

	@Override
	public void publishProduct(List<Integer> listIdProduct) {
		productDAO.publishProduct(listIdProduct);

	}

	@Override
	public void addProductToCampaign(List<Integer> listIdProduct,
			Integer idCampaign) {
		productDAO.addProductToCampaign(listIdProduct, idCampaign);

	}

	@Override
	public List<ProductFindDTO> listFindProduct(String txBarcode,
			Integer state, Integer shop, Integer gender, Integer type,
			Integer brand, BigDecimal minPrice, BigDecimal maxPrice,
			String description, Date dtBegin, Date dtEnd) {

		List<ProductFindDTO> listProduct = productDAO.listFindProduct(
				txBarcode, state, shop, gender, type, brand, minPrice,
				maxPrice, description, dtBegin, dtEnd);

		if (listProduct.equals(null)) {

		} else {
			for (int i = 0; i <= listProduct.size() - 1; i++) {

				List<String> newString = productDAO
						.listDistinctTxBarcode(listProduct.get(i)
								.getIdProduct());

				listProduct.get(i).setListTxBarcode(newString);

			}

			for (int i = 0; i <= listProduct.size() - 1; i++) {

				List<ShopDTO> newList = productDAO.listDistinctShop(listProduct
						.get(i).getIdProduct());

				listProduct.get(i).setListShop(newList);

			}
		}
		;

		return listProduct;

	}

	@Override
	public List<String> deleteProduct(Integer idProduct) {

		productDAO.deleteProduct(idProduct);
		
		List<String> newString = productDAO.listProductImages(idProduct);
		
		return newString;
		
	}

	@Override
	public void downloadArticle(List<String> txBarcode) {
		
		for (int i = 0; i <= txBarcode.size() - 1; i++) {

			productDAO.downloadArticle(txBarcode
					.get(i));


		}
		
	}

}
