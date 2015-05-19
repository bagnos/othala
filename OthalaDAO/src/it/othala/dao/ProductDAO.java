package it.othala.dao;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleCashedDTO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.BrandFullDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.ConfigurationDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DescriptionDTO;
import it.othala.dto.HashtagDTO;
import it.othala.dto.InfAggiuntiveDTO;
import it.othala.dto.LookBookDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.NazioniDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.RegioneDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.dto.SubMenuBrandDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.ArticleUpdate;
import it.othala.execption.BarcodeNotPresentException;
import it.othala.execption.OthalaException;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
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
	public List<ProductFullNewDTO> listProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, int order, Integer idCampaign,
			Boolean fgCampaign) {

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
		mapProduct.put("idCampaign", idCampaign);
		mapProduct.put("fgCampaign", fgCampaign);

		mapProduct.put("order", order);

		// recupero prodotti
		List<ProductFullNewDTO> listProduct = getSqlSession().selectList(
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
	public List<AttributeDTO> listSize(String languages) {
		HashMap<String, String> map = new HashMap<>();
		map.put("languages", languages);
		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listSize", map);

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
	public List<AttributeDTO> listInfAggiuntive(String languages) {

		HashMap<String, Object> mapAttribute = new HashMap<>();
		mapAttribute.put("languages", languages);

		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listInfAggiuntive", mapAttribute);

		return listAttribute;

	}

	@Override
	public List<AttributeDTO> listMaterial(String languages) {

		HashMap<String, Object> mapAttribute = new HashMap<>();
		mapAttribute.put("languages", languages);

		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listMaterial", mapAttribute);

		return listAttribute;

	}

	@Override
	public List<AttributeDTO> listBrand() {
		
		
		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listBrand");

		return listAttribute;

	}
	
	@Override
	public void clearCache()
	{
		getSqlSession().clearCache();
	}

	@Override
	public List<ShopDTO> listShop() {

		
		List<ShopDTO> listShop = getSqlSession().selectList(
				"it.othala.product.queries.listShop");

		return listShop;

	}
	
	@Override
	public List<HashtagDTO> listHashtag(String languages) {

		HashMap<String, Object> mapAttribute = new HashMap<>();
		mapAttribute.put("languages", languages);
		
		List<HashtagDTO> listHashtag = getSqlSession().selectList(
				"it.othala.product.queries.listHashtag", mapAttribute);

		return listHashtag;

	}
	
	

	@Override
	public List<RegioneDTO> listRegioni() {

		List<RegioneDTO> listRegioni = getSqlSession().selectList(
				"it.othala.product.queries.listRegioni");

		return listRegioni;

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
	public ProductFullNewDTO getProductFull(String languages, Integer idProduct) {

		 getSqlSession().clearCache();
		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("languages", languages);
		mapProduct.put("idProduct", idProduct);

		ProductFullNewDTO productFull = getSqlSession().selectOne(
				"it.othala.product.queries.getProductFull", mapProduct);

		return productFull;

	}

	@Override
	public List<ArticleFullDTO> listArticleFull(Integer idProduct,
			String languages, Boolean fgQtaZero) {
			
		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("idProduct", idProduct);
		map2.put("languages", languages);
		map2.put("fgQtaZero", fgQtaZero);

		List<ArticleFullDTO> listArticleFull = getSqlSession().selectList(
				"it.othala.product.queries.listArticleFull", map2);

		ShopDTO shop = new ShopDTO();

		for (int i = 0; i <= listArticleFull.size() - 1; i++) {

			shop = getShop(idProduct, listArticleFull.get(i).getPgArticle());
			listArticleFull.get(i).setShop(shop);

		}

		return listArticleFull;

	}

	private DeliveryAddressDTO getDeliveryAddressSede(Integer idAddress) {
		return getSqlSession().selectOne(
				"it.othala.product.queries.deliveryAddressesSede", idAddress);

	}

	@Override
	public void downloadArticle(Integer idProduct, Integer pgArticle) {

		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("idProduct", idProduct);
		map2.put("pgArticle", pgArticle);
		map2.put("languages", "it");

		ArticleFullDTO articleFull = getSqlSession().selectOne(
				"it.othala.product.queries.getArticleFull", map2);

		if (articleFull != null && articleFull.getQtStock() > 0) {

			HashMap<String, Object> mapProduct = new HashMap<>();
			mapProduct.put("idProduct", idProduct);
			mapProduct.put("pgArticle", pgArticle);

			getSqlSession().update("it.othala.product.queries.downloadArticle",
					mapProduct);

		}

	}

	@Override
	public void uploadArticle(Integer idProduct, Integer pgArticle) {

		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("idProduct", idProduct);
		map2.put("pgArticle", pgArticle);
		map2.put("languages", "it");

		ArticleFullDTO articleFull = getSqlSession().selectOne(
				"it.othala.product.queries.getArticleFull", map2);

		if (articleFull != null) {

			HashMap<String, Object> mapProduct = new HashMap<>();
			mapProduct.put("idProduct", idProduct);
			mapProduct.put("pgArticle", pgArticle);

			getSqlSession().update("it.othala.product.queries.uploadArticle",
					mapProduct);

		}

	}

	@Override
	public ArticleFullDTO getArticleFull(Integer idProduct, Integer pgArticle,
			String languages) {

		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("idProduct", idProduct);
		map2.put("pgArticle", pgArticle);
		map2.put("languages", languages);

		ArticleFullDTO articleFull = getSqlSession().selectOne(
				"it.othala.product.queries.getArticleFull", map2);

		return articleFull;

	}

	@Override
	public ProductFullNewDTO getProductArticleFull(String languages,
			Integer idProduct, Integer pgArticle) {

		ProductFullNewDTO productFull = getProductFull(languages, idProduct);

		List<String> newString = listProductImages(idProduct);

		productFull.setImagesUrl(newString);

		ArticleFullDTO articleFull = getArticleFull(idProduct, pgArticle,
				languages);

		ShopDTO shop = getShop(idProduct, pgArticle);

		articleFull.setShop(shop);

		List<ArticleFullDTO> ListArticleFull = new ArrayList<ArticleFullDTO>();
		ListArticleFull.add(articleFull);

		productFull.setArticles(ListArticleFull);

		return productFull;
	}

	@Override
	public ShopDTO getShop(Integer idProduct, Integer pgArticle) {

		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("idProduct", idProduct);
		map2.put("pgArticle", pgArticle);

		ShopDTO shop = getSqlSession().selectOne(
				"it.othala.product.queries.getShop", map2);

		return shop;

	}

	@Override
	public Integer insertProduct(ProductFullNewDTO productFull,
			Boolean fgPubblicazione) throws OthalaException {

		if (productFull.getSpecialPrice().intValue() == 0)

		{
			productFull.setSpecialPrice(null);
		}
		getSqlSession().insert("it.othala.product.queries.insertProduct",
				productFull);

		if (productFull.getLangDescription() == null
				|| productFull.getLangDescription().size() == 0)
			;
		{
			List<DescriptionDTO> listDescription = new ArrayList<DescriptionDTO>();

			DescriptionDTO descriptionIT = new DescriptionDTO();
			descriptionIT.setIdProduct(productFull.getIdProduct());

			if (productFull.getDescription() == null
					|| productFull.getDescription().length() == 0) {

				HashMap<String, Object> map = new HashMap<>();
				map.put("idBrand", productFull.getIdBrand());
				map.put("idType", productFull.getIdType());
				map.put("idGender", productFull.getIdGender());
				map.put("idMaterial", productFull.getIdMaterial());
				map.put("languages", "it");

				String txDescrizioneIT = getSqlSession().selectOne(
						"it.othala.product.queries.getDescrizione", map);

				descriptionIT.setDescription(txDescrizioneIT);

			} else {
				descriptionIT.setDescription(productFull.getDescription());
			}
			descriptionIT.setLanguages("it");
			listDescription.add(descriptionIT);

			DescriptionDTO descriptionEN = new DescriptionDTO();
			descriptionEN.setIdProduct(productFull.getIdProduct());

			if (productFull.getDescriptionEN() == null
					|| productFull.getDescriptionEN().length() == 0) {

				HashMap<String, Object> map = new HashMap<>();
				map.put("idBrand", productFull.getIdBrand());
				map.put("idType", productFull.getIdType());
				map.put("idGender", productFull.getIdGender());
				map.put("idMaterial", productFull.getIdMaterial());
				map.put("languages", "en");

				String txDescrizioneEN = getSqlSession().selectOne(
						"it.othala.product.queries.getDescrizione", map);

				descriptionEN.setDescription(txDescrizioneEN);

			} else {
				descriptionEN.setDescription(productFull.getDescriptionEN());
			}

			descriptionEN.setLanguages("en");
			listDescription.add(descriptionEN);

			productFull.setLangDescription(listDescription);
		}

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
			
			ProductFullNewDTO productFullCheck = getProductFullBarcode(productFull.getArticles().get(i)
					.getTxBarCode());

			if (productFullCheck != null) {
				throw new OthalaException("Barcode già presente su altro prodotto");
			}
			
			map4.clear();
			map4.put("idProduct", productFull.getIdProduct());
			map4.put("pgArticle", productFull.getArticles().get(i)
					.getPgArticle());
			map4.put("idSize", productFull.getArticles().get(i).getIdSize());
			map4.put("idColor", productFull.getArticles().get(i).getIdColor());
			map4.put("qtStock", productFull.getArticles().get(i).getQtStock());
			map4.put("thumbnailsUrl", productFull.getArticles().get(i)
					.getThumbnailsUrl());
			map4.put("idShop", productFull.getArticles().get(i).getShop()
					.getIdShop());
			map4.put("txBarCode", productFull.getArticles().get(i)
					.getTxBarCode());
			if (productFull.getArticles().get(i).getPrice() == null)
			{
				map4.put("imPrice", productFull.getPrice());
				map4.put("specialPrice", productFull
						.getSpecialPrice());
				map4.put("pcDiscount", productFull
						.getDiscount());
			}
			else
			{
			map4.put("imPrice", productFull.getArticles().get(i).getPrice());
			map4.put("specialPrice", productFull.getArticles().get(i)
					.getSpecialPrice());
			map4.put("pcDiscount", productFull.getArticles().get(i)
					.getDiscount());
			}
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

		if (productFull.getInfAggiuntive() != null) {
			for (int i = 0; i <= productFull.getInfAggiuntive().size() - 1; i++) {
				map2.clear();
				map2.put("idProduct", productFull.getIdProduct());
				map2.put("idInformazione", productFull.getInfAggiuntive()
						.get(i).getIdInformazione());
				map2.put("idLanguages", "it");
				map2.put("txDescrizione", productFull.getInfAggiuntive().get(i)
						.getTxDescrizioneIT());

				getSqlSession().insert(
						"it.othala.product.queries.insertInfAggiuntive", map2);

				map2.clear();
				map2.put("idProduct", productFull.getIdProduct());
				map2.put("idInformazione", productFull.getInfAggiuntive()
						.get(i).getIdInformazione());
				map2.put("idLanguages", "en");
				map2.put("txDescrizione", productFull.getInfAggiuntive().get(i)
						.getTxDescrizioneEN());

				getSqlSession().insert(
						"it.othala.product.queries.insertInfAggiuntive", map2);

			}
		}
		if (fgPubblicazione == true) {
			List<Integer> listIdProduct = new ArrayList<Integer>();
			listIdProduct.add(productFull.getIdProduct());
			publishProduct(listIdProduct);

		}
		return productFull.getIdProduct();

	}

	@Override
	public Integer getQtStock(Integer idProduct, Integer pgArticle) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("idProduct", idProduct);
		mapProduct.put("pgArticle", pgArticle);

		Integer qtStock = getSqlSession().selectOne(
				"it.othala.product.queries.getQtStock", mapProduct);

		return qtStock;

	}

	@Override
	public Integer getMaxIdColor() {

		return getSqlSession().selectOne(
				"it.othala.product.queries.getMaxIdColor");

	}

	@Override
	public Integer getMaxIdMaterial() {

		return getSqlSession().selectOne(
				"it.othala.product.queries.getMaxIdMaterial");

	}

	@Override
	public Integer getMaxIdType() {

		return getSqlSession().selectOne(
				"it.othala.product.queries.getMaxIdType");

	}

	@Override
	public Integer getQtStockLock(Integer idProduct, Integer pgArticle) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("idProduct", idProduct);
		mapProduct.put("pgArticle", pgArticle);

		Integer qtStock = getSqlSession().selectOne(
				"it.othala.product.queries.getQtStockLock", mapProduct);

		return qtStock;

	}

	@Override
	public Integer updateQtStock(Integer idProduct, Integer pgArticle,
			Integer qtArticles, Boolean fgVendita) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("idProduct", idProduct);
		mapProduct.put("pgArticle", pgArticle);
		mapProduct.put("qtArticles", qtArticles);
		mapProduct.put("fgVendita", fgVendita);

		Integer qtStock = getSqlSession().update(
				"it.othala.product.queries.updateQtStock", mapProduct);

		return qtStock;

	}

	@Override
	public Integer setNewQtStock(Integer idProduct, Integer pgArticle,
			Integer qtArticles) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("idProduct", idProduct);
		mapProduct.put("pgArticle", pgArticle);
		mapProduct.put("qtArticles", qtArticles);

		Integer qtStock = getSqlSession().update(
				"it.othala.product.queries.setNewQtStock", mapProduct);

		return qtStock;

	}

	@Override
	public void insertBrand(String txBrand, Integer idRegione,
			Integer idProvincia, String idUser, String urlFoto,
			String txDescrIT, String txDescrEN) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("idBrand", null);
		map.put("txBrand", txBrand);
		map.put("idRegione", idRegione);
		map.put("idProvincia", idProvincia);
		map.put("idUser", idUser);
		map.put("urlFoto", urlFoto);

		getSqlSession().insert("it.othala.product.queries.insertBrand", map);

		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("idBrand", map.get("idBrand"));
		map2.put("idLanguages", "it");
		map2.put("txDescrizione", txDescrIT);

		getSqlSession().insert("it.othala.product.queries.insertBrandDescr",
				map2);

		HashMap<String, Object> map3 = new HashMap<>();
		map3.put("idBrand", map.get("idBrand"));
		map3.put("idLanguages", "en");
		map3.put("txDescrizione", txDescrEN);

		getSqlSession().insert("it.othala.product.queries.insertBrandDescr",
				map3);

	}

	@Override
	public List<CampaignDTO> getListCampaign() {

		List<CampaignDTO> listCampaign = getSqlSession().selectList(
				"it.othala.product.queries.getListCampaign");

		return listCampaign;
	}

	@Override
	public void publishProduct(List<Integer> listIdProduct) {
		getSqlSession().update("it.othala.product.queries.publishProduct",
				listIdProduct);

	}

	@Override
	public Integer insertCampaign(CampaignDTO campaign) {

		getSqlSession().insert("it.othala.product.queries.insertCampaign",
				campaign);

		return campaign.getIdCampaign();
	}

	@Override
	public void addProductToCampaign(List<Integer> listIdProduct,
			Integer idCampaign) {

		HashMap<String, Object> map4 = new HashMap<>();

		map4.clear();
		map4.put("listIdProduct", listIdProduct);
		map4.put("idCampaign", idCampaign);

		getSqlSession().update(
				"it.othala.product.queries.addProductToCampaign", map4);

	}

	@Override
	public void insertColor(Integer idColor, String languages, String txColor) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idColor", idColor);
		map.put("languages", languages);
		map.put("txColor", txColor);

		getSqlSession().insert("it.othala.product.queries.insertColor", map);

	}

	@Override
	public void insertMaterial(Integer idMaterial, String languages,
			String txMaterial) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idMaterial", idMaterial);
		map.put("languages", languages);
		map.put("txMaterial", txMaterial);

		getSqlSession().insert("it.othala.product.queries.insertMaterial", map);

	}

	@Override
	public void insertType(Integer idType, String languages, String txType) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idType", idType);
		map.put("languages", languages);
		map.put("txType", txType);

		getSqlSession().insert("it.othala.product.queries.insertType", map);

	}

	@Override
	public List<AttributeDTO> listStatesOrder() {

		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listStatesOrder");

		return listAttribute;
	}

	@Override
	public List<AttributeDTO> listStatesProduct() {

		List<AttributeDTO> listAttribute = getSqlSession().selectList(
				"it.othala.product.queries.listStatesProduct");

		return listAttribute;

	}

	@Override
	public List<ProductFullNewDTO> listFindProduct(String txBarcode,
			Integer state, Integer shop, Integer gender, Integer type,
			Integer brand, BigDecimal minPrice, BigDecimal maxPrice,
			String description, Date dtBegin, Date dtEnd) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("txBarcode", txBarcode);
		mapProduct.put("state", state);
		mapProduct.put("gender", gender);
		mapProduct.put("type", type);
		mapProduct.put("brand", brand);

		mapProduct.put("minPrice", minPrice);
		mapProduct.put("maxPrice", maxPrice);
		mapProduct.put("description", description);

		mapProduct.put("shop", shop);
		mapProduct.put("dtBegin", dtBegin);
		mapProduct.put("dtEnd", dtEnd);

		List<ProductFullNewDTO> listProduct = getSqlSession().selectList(
				"it.othala.product.queries.listFindProduct", mapProduct);

		return listProduct;
	}

	@Override
	public List<String> listDistinctTxBarcode(Integer idProduct) {
		HashMap<String, String> map = new HashMap<>();
		map.put("idProduct", idProduct.toString());
		List<String> newString = getSqlSession().selectList(
				"it.othala.product.queries.listDistinctTxBarcode", map);
		return newString;
	}

	@Override
	public List<ShopDTO> listDistinctShop(Integer idProduct) {

		HashMap<String, String> map = new HashMap<>();
		map.put("idProduct", idProduct.toString());
		List<ShopDTO> newList = getSqlSession().selectList(
				"it.othala.product.queries.listDistinctShop", map);
		return newList;
	}

	@Override
	public void deleteProduct(Integer idProduct) {
		HashMap<String, String> map = new HashMap<>();
		map.put("idProduct", idProduct.toString());
		getSqlSession().update("it.othala.product.queries.deleteProduct", map);

	}

	@Override
	public void updateProduct(ProductFullNewDTO productFull) {

		if (productFull.getSpecialPrice().intValue() == 0)

		{
			productFull.setSpecialPrice(null);
		}

		getSqlSession().update("it.othala.product.queries.updateProduct",
				productFull);

		HashMap<String, Object> map2 = new HashMap<>();

		map2.clear();
		map2.put("idProduct", productFull.getIdProduct());

		getSqlSession().delete(
				"it.othala.product.queries.deleteProductDescription", map2);

		if (productFull.getLangDescription() == null
				|| productFull.getLangDescription().size() == 0)
			;
		{
			List<DescriptionDTO> listDescription = new ArrayList<DescriptionDTO>();
			DescriptionDTO description = new DescriptionDTO();
			description.setIdProduct(productFull.getIdProduct());
			description.setDescription(productFull.getDescription());
			description.setLanguages("it");
			listDescription.add(description);

			DescriptionDTO descriptionEN = new DescriptionDTO();
			descriptionEN.setIdProduct(productFull.getIdProduct());
			descriptionEN.setDescription(productFull.getDescriptionEN());
			descriptionEN.setLanguages("en");
			listDescription.add(descriptionEN);

			productFull.setLangDescription(listDescription);

		}

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

			if (productFull.getArticles().get(i).getArticleUpdate() == ArticleUpdate.NUOVO) {
				map4.clear();
				map4.put("idProduct", productFull.getIdProduct());
				map4.put("pgArticle", productFull.getArticles().get(i)
						.getPgArticle());
				map4.put("idSize", productFull.getArticles().get(i).getIdSize());
				map4.put("idColor", productFull.getArticles().get(i)
						.getIdColor());
				map4.put("qtStock", productFull.getArticles().get(i)
						.getQtStock());
				map4.put("thumbnailsUrl", productFull.getArticles().get(i)
						.getThumbnailsUrl());
				map4.put("idShop", productFull.getArticles().get(i).getShop()
						.getIdShop());
				map4.put("txBarCode", productFull.getArticles().get(i)
						.getTxBarCode());
				if (productFull.getArticles().get(i).getPrice() == null)
				{
					map4.put("imPrice", productFull.getPrice());
					map4.put("specialPrice", productFull
							.getSpecialPrice());
					map4.put("pcDiscount", productFull
							.getDiscount());
				}
				else
				{
				map4.put("imPrice", productFull.getArticles().get(i).getPrice());
				map4.put("specialPrice", productFull.getArticles().get(i)
						.getSpecialPrice());
				map4.put("pcDiscount", productFull.getArticles().get(i)
						.getDiscount());
				}

				getSqlSession().insert(
						"it.othala.product.queries.insertArticle", map4);
			}

			else
			{
				
			/*
			if (productFull.getArticles().get(i).getArticleUpdate() == ArticleUpdate.MODIFICATO) {
			*/
				map4.clear();
				map4.put("idProduct", productFull.getIdProduct());
				map4.put("pgArticle", productFull.getArticles().get(i)
						.getPgArticle());
				map4.put("qtStock", productFull.getArticles().get(i)
						.getQtStock());
				map4.put("idShop", productFull.getArticles().get(i).getShop()
						.getIdShop());
				/*
				if (productFull.getArticles().get(i).getPrice() == null)
				{
				*/
					map4.put("imPrice", productFull.getPrice());
					map4.put("specialPrice", productFull
							.getSpecialPrice());
					map4.put("pcDiscount", productFull
							.getDiscount());
				/*	
				}
				else
				{
				
				map4.put("imPrice", productFull.getArticles().get(i).getPrice());
				map4.put("specialPrice", productFull.getArticles().get(i)
						.getSpecialPrice());
				map4.put("pcDiscount", productFull.getArticles().get(i)
						.getDiscount());
				
				}
				*/
				
				
				getSqlSession().insert(
						"it.othala.product.queries.updateArticle", map4);
			}

		}

		map2.clear();
		map2.put("idProduct", productFull.getIdProduct());
		getSqlSession().delete("it.othala.product.queries.deleteProductImage",
				map2);

		for (int i = 0; i <= productFull.getImagesUrl().size() - 1; i++) {
			map2.clear();
			map2.put("idProduct", productFull.getIdProduct());
			map2.put("pgImage", i + 1);
			map2.put("txImageUrl", productFull.getImagesUrl().get(i));

			getSqlSession().insert(
					"it.othala.product.queries.insertProductImage", map2);
		}

		map2.clear();
		map2.put("idProduct", productFull.getIdProduct());
		getSqlSession().delete("it.othala.product.queries.deleteInfAggiuntive",
				map2);

		if (productFull.getInfAggiuntive() != null) {
			for (int i = 0; i <= productFull.getInfAggiuntive().size() - 1; i++) {
				map2.clear();
				map2.put("idProduct", productFull.getIdProduct());
				map2.put("idInformazione", productFull.getInfAggiuntive()
						.get(i).getIdInformazione());
				map2.put("idLanguages", "it");
				map2.put("txDescrizione", productFull.getInfAggiuntive().get(i)
						.getTxDescrizioneIT());

				getSqlSession().insert(
						"it.othala.product.queries.insertInfAggiuntive", map2);

				map2.clear();
				map2.put("idProduct", productFull.getIdProduct());
				map2.put("idInformazione", productFull.getInfAggiuntive()
						.get(i).getIdInformazione());
				map2.put("idLanguages", "en");
				map2.put("txDescrizione", productFull.getInfAggiuntive().get(i)
						.getTxDescrizioneEN());

				getSqlSession().insert(
						"it.othala.product.queries.insertInfAggiuntive", map2);

			}
		}

	}

	@Override
	public List<ArticleFullDTO> listArticleFullBarcode(Integer idProduct,
			String txBarcode) {
		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("idProduct", idProduct);
		map2.put("txBarcode", txBarcode);

		List<ArticleFullDTO> listArticleFull = getSqlSession().selectList(
				"it.othala.product.queries.listArticleFullBarcode", map2);

		ShopDTO shop = new ShopDTO();

		for (int i = 0; i <= listArticleFull.size() - 1; i++) {

			shop = getShop(idProduct, listArticleFull.get(i).getPgArticle());
			listArticleFull.get(i).setShop(shop);

		}

		return listArticleFull;

	}

	@Override
	public ProductFullNewDTO getProductFullBarcode(String txBarcode) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("txBarcode", txBarcode);

		ProductFullNewDTO productFull = getSqlSession().selectOne(
				"it.othala.product.queries.getProductFullBarcode", mapProduct);

		return productFull;

	}

	@Override
	public boolean countNewArrivals() {

		Integer newArrivals = getSqlSession().selectOne(
				"it.othala.product.queries.countNewArrivals");

		if (newArrivals == null || newArrivals == 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean countPromozioni() {

		Integer promozioni = getSqlSession().selectOne(
				"it.othala.product.queries.countPromozioni");

		if (promozioni == null || promozioni == 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean countSpecialPrice() {

		Integer specialPrice = getSqlSession().selectOne(
				"it.othala.product.queries.countSpecialPrice");

		if (specialPrice == null || specialPrice == 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public List<NazioniDTO> listNazioni() {
		List<NazioniDTO> listNazioni = getSqlSession().selectList(
				"it.othala.product.queries.getListNazioni");

		return listNazioni;
	}

	@Override
	public List<ConfigurationDTO> listConfiguration() {
		List<ConfigurationDTO> listConfiguration = getSqlSession().selectList(
				"it.othala.product.queries.getListConfiguration");

		return listConfiguration;
	}

	@Override
	public void removeProductFromCampaign(List<Integer> listIdProduct,
			Integer idCampaign) {
		HashMap<String, Object> map4 = new HashMap<>();

		map4.clear();
		map4.put("listIdProduct", listIdProduct);
		map4.put("idCampaign", idCampaign);

		getSqlSession().update(
				"it.othala.product.queries.removeProductFromCampaign", map4);

	}

	@Override
	public void deleteCampaign(Integer idCampaign) {

		HashMap<String, Object> map4 = new HashMap<>();
		map4.clear();
		map4.put("idCampaign", idCampaign);

		getSqlSession().update(
				"it.othala.product.queries.removeProductCampaign", map4);

		getSqlSession()
				.delete("it.othala.product.queries.deleteCampaign", map4);

	}

	@Override
	public void updateCampaign(CampaignDTO campaign) {

		getSqlSession().update("it.othala.product.queries.updateCampaign",
				campaign);

	}

	@Override
	public List<AttributeDTO> listSizeProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, int order, Integer idCampaign,
			Boolean fgCampaign) {

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("languages", languages);
		mapProduct.put("type", type);
		mapProduct.put("gender", gender);
		mapProduct.put("newArrivals", newArrivals);
		mapProduct.put("idCampaign", idCampaign);
		mapProduct.put("fgCampaign", fgCampaign);

		return getSqlSession().selectList(
				"it.othala.product.queries.listSizeProduct", mapProduct);

	}

	@Override
	public List<AttributeDTO> listColorProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, int order, Integer idCampaign,
			Boolean fgCampaign) {
		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("languages", languages);
		mapProduct.put("type", type);
		mapProduct.put("gender", gender);
		mapProduct.put("newArrivals", newArrivals);
		mapProduct.put("idCampaign", idCampaign);
		mapProduct.put("fgCampaign", fgCampaign);

		return getSqlSession().selectList(
				"it.othala.product.queries.listColorProduct", mapProduct);
	}

	@Override
	public List<AttributeDTO> listBrandProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, int order, Integer idCampaign,
			Boolean fgCampaign) {
		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("languages", languages);
		mapProduct.put("type", type);
		mapProduct.put("gender", gender);
		mapProduct.put("newArrivals", newArrivals);
		mapProduct.put("idCampaign", idCampaign);
		mapProduct.put("fgCampaign", fgCampaign);

		return getSqlSession().selectList(
				"it.othala.product.queries.listBrandProduct", mapProduct);
	}

	@Override
	public SiteImagesDTO getImage(String string) {

		return getSqlSession().selectOne("it.othala.images.queries.getImage",
				string);

	}

	@Override
	public Boolean checkEsistenza(String txAttributo, String txValore,
			String languages) {

		HashMap<String, Object> mapAttribute = new HashMap<>();
		mapAttribute.put("txValore", txValore);
		if (languages != null) {
			mapAttribute.put("languages", languages);
		}

		String query = null;
		if (txAttributo == "type") {
			query = "it.othala.product.queries.getType";
		}
		if (txAttributo == "brand") {
			query = "it.othala.product.queries.getBrand";
		}
		if (txAttributo == "material") {
			query = "it.othala.product.queries.getMaterial";
		}
		if (txAttributo == "color") {
			query = "it.othala.product.queries.getColor";
		}

		if (txAttributo == "size") {
			query = "it.othala.product.queries.getSize";
		}

		Integer count;

		if (query != null) {

			count = getSqlSession().selectOne(query, mapAttribute);
		} else {
			count = 0;

		}
		if (count == 0) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public void insertSize(String txSize) {

		Integer idSize = getSqlSession().selectOne(
				"it.othala.product.queries.getMaxIdSize");
		HashMap<String, Object> map = new HashMap<>();
		map.put("idSize", idSize + 1);
		map.put("txSize", txSize.toUpperCase());

		getSqlSession().insert("it.othala.product.queries.insertSize", map);

	}

	@Override
	public List<String> getGoodImages() {

		return getSqlSession().selectList(
				"it.othala.product.queries.listGoodImages");
	}

	@Override
	public List<String> getGoodThumbs() {

		return getSqlSession().selectList(
				"it.othala.product.queries.listGoodThumbs");
	}

	@Override
	public void deleteBadImages() {
		getSqlSession().delete("it.othala.product.queries.deleteBadImages");

	}

	@Override
	public List<SubMenuBrandDTO> listSubMenuBrand(Integer idMenu) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("idMenu", idMenu);

		List<SubMenuBrandDTO> listSubMenu = getSqlSession().selectList(
				"it.othala.product.queries.listSubMenuBrand", map);

		return listSubMenu;
	}

	@Override
	public int insLookBook(LookBookDTO lookBook) {

		return getSqlSession().insert(
				"it.othala.product.queries.insertLookBook", lookBook);
	}

	@Override
	public void insLookBookProduct(int idLookBook, int idProduct) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("idlookbook", idLookBook);
		map.put("idProduct", idProduct);
		getSqlSession().insert(
				"it.othala.product.queries.insertLookBookProduct", map);

	}

	@Override
	public void delLookBook(int idLookBook) {

		getSqlSession().update("it.othala.product.queries.deleteLookBook",
				idLookBook);

	}

	@Override
	public void delLookBookProduct(int idLookBook, int idProduct) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("idlookbook", idLookBook);
		map.put("idProduct", idProduct);
		getSqlSession().insert(
				"it.othala.product.queries.deleteLookBookProduct", map);

	}

	@Override
	public List<LookBookDTO> listaLookBook(Integer idLookBook) {

		HashMap<String, Object> map = new HashMap<>();
		if (idLookBook != null) {
			map.put("idlookbook", idLookBook);
		}

		return getSqlSession().selectList(
				"it.othala.product.queries.listLookBook", map);
	}

	@Override
	public List<BrandFullDTO> listBrandFull(String languages,
			Integer idProvincia, Integer idRegione, Integer idBrand) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("languages", languages);
		map.put("idProvincia", idProvincia);
		map.put("idRegione", idRegione);
		map.put("idBrand", idBrand);

		return getSqlSession().selectList(
				"it.othala.product.queries.listBrandFull", map);

	}

	@Override
	public List<InfAggiuntiveDTO> listInfAggiuntive(Integer idProduct,
			String languages) {
		HashMap<String, Object> map1 = new HashMap<>();
		map1.put("idProduct", idProduct);
		map1.put("languages", languages);

		return getSqlSession().selectList(
				"it.othala.product.queries.listProductInfAggiuntive", map1);

	}

	@Override
	public List<ArticleCashedDTO> getArticlesCached() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList(
				"it.othala.product.queries.getProdottiVenduti");
	}

	@Override
	public List<ArticleCashedDTO> getArticlesMajorCached(String language) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();		
		map.put("language", language);
		return getSqlSession().selectList(
				"it.othala.product.queries.getProdottiPiuVenduti",map);
	}

}
