package it.othala.dao.interfaces;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.ConfigurationDTO;
import it.othala.dto.LookBookDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.NazioniDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.dto.SubMenuBrandDTO;
import it.othala.enums.OrderByCartFlow;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public interface IProductDAO {

	public List<MenuDTO> listMenu(String languages);

	public List<SubMenuDTO> listSubMenu(Integer idMenu, String languages);

	public List<String> listDistinctArticleSize(Integer idProduct);

	public List<String> listDistinctArticleColor(Integer idProduct,
			String languages);

	public List<AttributeDTO> listSize(String languages);

	public List<AttributeDTO> listColor(String languages);

	public List<AttributeDTO> listBrand();

	public List<AttributeDTO> listType(String languages);

	public List<AttributeDTO> listGender(String languages);

	public List<String> listProductImages(Integer idProduct);

	public List<ProductFullNewDTO> listProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign, Boolean fgCampaign);

	public ProductFullNewDTO getProductFull(String languages, Integer idProduct);

	public 	List<ArticleFullDTO> listArticleFull(Integer idProduct, String languages,
			Boolean fgQtaZero);

	public Integer insertProduct(ProductFullNewDTO productFull, Boolean fgPubblicazione);

	public Integer getQtStock(Integer idProduct, Integer pgArticle);

	public ShopDTO getShop(Integer idProduct, Integer pgArticle);

	public ArticleFullDTO getArticleFull(Integer idProduct, Integer pgArticle,
			String languages);

	public ProductFullNewDTO getProductArticleFull(String languages, Integer idProduct,
			Integer pgArticle);

	public void insertBrand(String txBrand);

	public Integer updateQtStock(Integer idProduct, Integer pgArticle, Integer qtArticles, Boolean fgVendita);

	public Integer getQtStockLock(Integer idProduct, Integer pgArticle);

	public List<CampaignDTO> getListCampaign();

	public void publishProduct(List<Integer> listIdProduct);

	public Integer insertCampaign(CampaignDTO campaign);

	public void addProductToCampaign(List<Integer> listIdProduct,
			Integer idCampaign);

	public List<ShopDTO> listShop();



	public void insertType(Integer idType,String languages, String txType);

	public List<AttributeDTO> listStatesOrder();
	public List<AttributeDTO> listStatesProduct();

	public List<ProductFullNewDTO> listFindProduct(String txBarcode,
			Integer state, Integer shop, Integer gender, Integer type,
			Integer brand, BigDecimal minPrice, BigDecimal maxPrice,
			String description, Date dtBegin, Date dtEnd);

	public List<String> listDistinctTxBarcode(Integer idProduct);

	public List<ShopDTO> listDistinctShop(Integer idProduct);

	public void deleteProduct(Integer idProduct);

	public void updateProduct(ProductFullNewDTO productFull);

	public void downloadArticle(Integer idProduct, Integer pgArticle);
	public void uploadArticle(Integer idProduct, Integer pgArticle);

	public void insertMaterial(Integer idMaterial,String languages, String txMaterial);

	public List<AttributeDTO> listMaterial(String languages);

	public void insertColor(Integer idColor, String languages, String txColor);

	public Integer getMaxIdColor();
	public Integer getMaxIdMaterial();
	public Integer getMaxIdType();

	public ProductFullNewDTO getProductFullBarcode(String txBarcode);

	public List<ArticleFullDTO> listArticleFullBarcode(Integer idProduct,
			String txBarcode);

	public boolean countNewArrivals();

	public boolean countSpecialPrice();

	public boolean countPromozioni();

	public List<NazioniDTO> listNazioni();

	public Integer setNewQtStock(Integer idProduct, Integer pgArticle,
			Integer qtArticles);

	public List<ConfigurationDTO> listConfiguration();

	public void removeProductFromCampaign(List<Integer> listIdProduct,
			Integer idCampaign);

	public void deleteCampaign(Integer idCampaign);

	public void updateCampaign(CampaignDTO campaign);

	public List<AttributeDTO> listSizeProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
			Boolean fgCampaign);

	public List<AttributeDTO> listColorProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
			Boolean fgCampaign);

	public List<AttributeDTO> listBrandProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
			Boolean fgCampaign);
	

	
	public SiteImagesDTO getImage(String string);

	public Boolean checkEsistenza(String txAttributo, String txValore, String languages);

	public void insertSize(String txSize);
	
	public List<String> getGoodImages ();
	
	public List<String> getGoodThumbs ();
	
	public void deleteBadImages();

	public List<SubMenuBrandDTO> listSubMenuBrand(Integer idMenu);
	
	public int insLookBook(LookBookDTO lookBook);
	
	public void insLookBookProduct(int idLookBook, int idProduct); 
	
	public void delLookBook(int idLookBook);
	
	public void delLookBookProduct(int idLookBook, int idProduct);
	
	public List<LookBookDTO> listaLookBook(Integer idLookBook);



}
