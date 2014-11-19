package it.othala.service;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dao.interfaces.ISiteImagesDAO;
import it.othala.dto.ArticleDTO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.MenuFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.dto.VetrinaDTO;
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
	public MenuFullDTO getMenuFull(String languages) {

		MenuFullDTO menuFullDTO = new MenuFullDTO();

		List<MenuDTO> listMenu = getMenu(languages);
		menuFullDTO.setMenu(listMenu);

		menuFullDTO.setFgNuoviArrivi(productDAO.countNewArrivals());
		menuFullDTO.setFgPromozioni(productDAO.countPromozioni());
		menuFullDTO.setFgPrezzoSpeciale(productDAO.countSpecialPrice());

		SiteImagesDTO imgNew = productDAO.getImage("new");
		if (imgNew != null) {
			menuFullDTO.setImgNew(imgNew);
		}
		SiteImagesDTO imgPromo = productDAO.getImage("promo");
		if (imgPromo != null) {

			menuFullDTO.setImgPromo(imgPromo);
		}

		return menuFullDTO;

	}

	@Override
	public DomainDTO getDomain(String languages) {

		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize(languages));
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand());
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setMaterial(productDAO.listMaterial(languages));
		domainDTO.setType(productDAO.listType(languages));
		domainDTO.setShop(productDAO.listShop());
		domainDTO.setStatesOrder(productDAO.listStatesOrder());
		domainDTO.setStatesProduct(productDAO.listStatesProduct());
		domainDTO.setNazioni(productDAO.listNazioni());
		domainDTO.setConfiguration(productDAO.listConfiguration());

		return domainDTO;

	}

	@Override
	public List<CampaignDTO> getListCampaign() {

		List<CampaignDTO> listCampaign = productDAO.getListCampaign();

		return listCampaign;
	}

	@Override
	public Integer insertCampaign(CampaignDTO campaign) {
		return productDAO.insertCampaign(campaign);

	}

	@Override
	public DomainDTO insertBrand(String languages, String txBrand) {

		if (productDAO.checkEsistenza("brand", txBrand, null)) {
			productDAO.insertBrand(txBrand);
		}
		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize(languages));
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand());
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setType(productDAO.listType(languages));

		return domainDTO;

	}

	@Override
	public DomainDTO insertColor(String languages, String txColorIT,
			String txColorEN) {

		if (productDAO.checkEsistenza("color", txColorIT, "it")) {
			Integer maxIdColor = productDAO.getMaxIdColor();
			maxIdColor = maxIdColor + 1;
			productDAO.insertColor(maxIdColor, "it", txColorIT);
			productDAO.insertColor(maxIdColor, "en", txColorEN);
		}
		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize(languages));
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand());
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setType(productDAO.listType(languages));

		return domainDTO;

	}

	@Override
	public DomainDTO insertMaterial(String languages, String txMaterialIT,
			String txMaterialEN) {

		if (productDAO.checkEsistenza("material", txMaterialIT, "it")) {
			Integer maxIdMaterial = productDAO.getMaxIdMaterial();
			maxIdMaterial = maxIdMaterial + 1;

			productDAO.insertMaterial(maxIdMaterial, "it", txMaterialIT);
			productDAO.insertMaterial(maxIdMaterial, "en", txMaterialEN);
		}
		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize(languages));
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand());
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setType(productDAO.listType(languages));
		domainDTO.setMaterial(productDAO.listMaterial(languages));

		return domainDTO;

	}

	@Override
	public DomainDTO insertType(String languages, String txType, String txTypeEN) {

		if (productDAO.checkEsistenza("type", txType, "it")) {
			Integer maxIdType = productDAO.getMaxIdType();
			maxIdType = maxIdType + 1;

			productDAO.insertType(maxIdType, "it", txType);
			productDAO.insertType(maxIdType, "en", txTypeEN);
		}
		DomainDTO domainDTO = new DomainDTO();
		domainDTO.setSize(productDAO.listSize(languages));
		domainDTO.setColor(productDAO.listColor(languages));
		domainDTO.setBrand(productDAO.listBrand());
		domainDTO.setGender(productDAO.listGender(languages));
		domainDTO.setType(productDAO.listType(languages));

		return domainDTO;

	}

	@Override
	public VetrinaDTO getListProduct(String languages, Integer gender,
			Integer type, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
			Boolean fgCampaign) {

		List<ProductFullNewDTO> listProduct = productDAO.listProduct(languages,
				type, gender, brand, minPrice, maxPrice, size, color,
				newArrivals, order, idCampaign, fgCampaign);

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

		VetrinaDTO vetrinaDTO = new VetrinaDTO();
		vetrinaDTO.setProdotti(listProduct);
		vetrinaDTO.setSize(productDAO.listSizeProduct(languages, type, gender,
				brand, minPrice, maxPrice, size, color, newArrivals, order,
				idCampaign, fgCampaign));
		vetrinaDTO.setColor(productDAO.listColorProduct(languages, type,
				gender, brand, minPrice, maxPrice, size, color, newArrivals,
				order, idCampaign, fgCampaign));
		vetrinaDTO.setBrand(productDAO.listBrandProduct(languages, type,
				gender, brand, minPrice, maxPrice, size, color, newArrivals,
				order, idCampaign, fgCampaign));

		return vetrinaDTO;

	}

	@Override
	public ProductFullNewDTO getProductFull(String languages, Integer idProduct) {

		ProductFullNewDTO productFull = productDAO.getProductFull(languages,
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
	public ProductFullNewDTO getProductArticleFull(String languages,
			Integer idProduct, Integer pgArticle) {

		ProductFullNewDTO productFull = productDAO.getProductArticleFull(
				languages, idProduct, pgArticle);

		return productFull;
	}

	@Override
	public Integer insertProduct(ProductFullNewDTO productFull,
			Boolean fgPubblicazione) {
		return productDAO.insertProduct(productFull, fgPubblicazione);

	}

	@Override
	public void updateProduct(ProductFullNewDTO productFull) {
		productDAO.updateProduct(productFull);

	}

	@Override
	public List<ProductFullNewDTO> listFindProduct(String txBarcode,
			Integer state, Integer shop, Integer gender, Integer type,
			Integer brand, BigDecimal minPrice, BigDecimal maxPrice,
			String description, Date dtBegin, Date dtEnd) {

		List<ProductFullNewDTO> listProduct = productDAO.listFindProduct(
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
	public ProductFullNewDTO listFindBarcode(String txBarcode) {

		ProductFullNewDTO productFull = productDAO
				.getProductFullBarcode(txBarcode);

		List<String> newString = productDAO.listProductImages(productFull
				.getIdProduct());
		productFull.setImagesUrl(newString);

		List<ArticleFullDTO> listArticleFull = productDAO
				.listArticleFullBarcode(productFull.getIdProduct(), txBarcode);

		productFull.setArticles(listArticleFull);

		return productFull;

	}

	@Override
	public void publishProduct(List<Integer> listIdProduct) {
		productDAO.publishProduct(listIdProduct);

	}

	@Override
	public Integer insertCampaign(CampaignDTO campaign,
			List<Integer> listIdProduct) {
		Integer idCampaign = productDAO.insertCampaign(campaign);

		productDAO.addProductToCampaign(listIdProduct, idCampaign);

		return idCampaign;
	}

	@Override
	public void addProductToCampaign(List<Integer> listIdProduct,
			Integer idCampaign) {
		productDAO.addProductToCampaign(listIdProduct, idCampaign);

	}

	@Override
	public List<String> deleteProduct(Integer idProduct) {

		productDAO.deleteProduct(idProduct);

		List<String> newString = productDAO.listProductImages(idProduct);

		return newString;

	}

	@Override
	public void downloadArticle(List<ArticleDTO> articles, Boolean fgScarico) {

		if (fgScarico == true) {
			for (int i = 0; i <= articles.size() - 1; i++) {

				productDAO.downloadArticle(articles.get(i).getIdProduct(),
						articles.get(i).getPgArticle());

			}
		} else {
			for (int i = 0; i <= articles.size() - 1; i++) {

				productDAO.uploadArticle(articles.get(i).getIdProduct(),
						articles.get(i).getPgArticle());

			}
		}

	}

	@Override
	public void removeProductFromCampaign(List<Integer> listIdProduct,
			CampaignDTO campaign) {
		productDAO.removeProductFromCampaign(listIdProduct,
				campaign.getIdCampaign());

	}

	@Override
	public void deleteCampaign(CampaignDTO campaign) {
		productDAO.deleteCampaign(campaign.getIdCampaign());
	}

	@Override
	public void updateCampaign(CampaignDTO campaign, List<Integer> listIdProduct) {
		productDAO.updateCampaign(campaign);
		productDAO.removeProductFromCampaign(listIdProduct,
				campaign.getIdCampaign());
	}

}