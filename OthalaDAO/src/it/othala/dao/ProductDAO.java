package it.othala.dao;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.ConfigurationDTO;
import it.othala.dto.DescriptionDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.NazioniDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.ArticleUpdate;
import it.othala.enums.OrderByCartFlow;

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
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
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

		if (order == null) {
			mapProduct.put("order", OrderByCartFlow.PREZZOASC.getState());
		} else {
			mapProduct.put("order", order.getState());

		}

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
	public List<ShopDTO> listShop() {

		List<ShopDTO> listShop = getSqlSession().selectList(
				"it.othala.product.queries.listShop");

		return listShop;

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

		HashMap<String, Object> mapProduct = new HashMap<>();
		mapProduct.put("languages", languages);
		mapProduct.put("idProduct", idProduct);

		ProductFullNewDTO productFull = getSqlSession().selectOne(
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

		ShopDTO shop = new ShopDTO();

		for (int i = 0; i <= listArticleFull.size() - 1; i++) {

			shop = getShop(idProduct, listArticleFull.get(i).getPgArticle());
			listArticleFull.get(i).setShop(shop);

		}

		return listArticleFull;

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
			Boolean fgPubblicazione) {

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
					.getDescription().toUpperCase());

			getSqlSession().insert(
					"it.othala.product.queries.insertProductDescription", map2);
		}

		HashMap<String, Object> map4 = new HashMap<>();

		for (int i = 0; i <= productFull.getArticles().size() - 1; i++) {
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
	public void insertBrand(String txBrand) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("txBrand", txBrand.toUpperCase());

		getSqlSession().insert("it.othala.product.queries.insertBrand", map);

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
	public void insertType(Integer idType, String languages,
			String txType) {
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
				getSqlSession().insert(
						"it.othala.product.queries.insertArticle", map4);
			}

			if (productFull.getArticles().get(i).getArticleUpdate() == ArticleUpdate.MODIFICATO) {
				map4.clear();
				map4.put("idProduct", productFull.getIdProduct());
				map4.put("pgArticle", productFull.getArticles().get(i)
						.getPgArticle());
				map4.put("qtStock", productFull.getArticles().get(i)
						.getQtStock());
				map4.put("idShop", productFull.getArticles().get(i).getShop()
						.getIdShop());
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
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
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
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
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
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
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

}
