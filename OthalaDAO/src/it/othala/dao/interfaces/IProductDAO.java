package it.othala.dao.interfaces;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.AttributeSizeDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.NazioniDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SubMenuDTO;
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

	public List<AttributeSizeDTO> listSize(String languages);

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

	public List<ArticleFullDTO> listArticleFull(Integer idProduct,
			String languages);

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



	public void insertType(String languages, String txType);

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

	public void downloadArticle(String txBarcode);
	public void uploadArticle(String txBarcode);

	public void insertMaterial(Integer idMaterial,String languages, String txMaterial);

	public List<AttributeDTO> listMaterial(String languages);

	public void insertColor(Integer idColor, String languages, String txColor);

	public Integer getMaxIdColor();
	public Integer getMaxIdMaterial();

	public ProductFullNewDTO getProductFullBarcode(String txBarcode);

	public List<ArticleFullDTO> listArticleFullBarcode(Integer idProduct,
			String txBarcode);

	public boolean countNewArrivals();

	public boolean countSpecialPrice();

	public boolean countPromozioni();

	public List<NazioniDTO> listNazioni();

	public Integer updateQtStock(String txBarcode, Integer qtArticles,
			Boolean fgVendita);

	public Integer setNewQtStock(Integer idProduct, Integer pgArticle,
			Integer qtArticles);
	
	
	
	

}
