package it.othala.dao.interfaces;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.AttributeSizeDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.enums.OrderByCartFlow;

import java.math.BigDecimal;
import java.util.List;

public interface IProductDAO {

	public List<MenuDTO> listMenu(String languages);

	public List<SubMenuDTO> listSubMenu(Integer idMenu, String languages);

	public List<String> listDistinctArticleSize(Integer idProduct);

	public List<String> listDistinctArticleColor(Integer idProduct,
			String languages);

	public List<AttributeSizeDTO> listSize();

	public List<AttributeDTO> listColor(String languages);

	public List<AttributeDTO> listBrand(String languages);

	public List<AttributeDTO> listType(String languages);

	public List<AttributeDTO> listGender(String languages);

	public List<String> listProductImages(Integer idProduct);

	public List<ProductDTO> listProduct(String languages, Integer type,
			Integer gender, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign, Boolean fgCampaign);

	public ProductFullDTO getProductFull(String languages, Integer idProduct);

	public List<ArticleFullDTO> listArticleFull(Integer idProduct,
			String languages);

	public Integer insertProduct(ProductFullDTO productFull);

	public Integer getQtStock(Integer idProduct, Integer pgArticle);

	public ShopDTO getShop(Integer idProduct, Integer pgArticle);

	public ArticleFullDTO getArticleFull(Integer idProduct, Integer pgArticle,
			String languages);

	public ProductFullDTO getProductArticleFull(String languages, Integer idProduct,
			Integer pgArticle);

	public void insertBrand(String languages, String txBrand);

	public List<ProductDTO> listProductToPublish();

	public Integer updateQtStock(Integer idProduct, Integer pgArticle, Integer qtArticles, Boolean fgVendita);

	public Integer getQtStockLock(Integer idProduct, Integer pgArticle);

	public List<CampaignDTO> getListCampaign();

	public void publishProduct(List<Integer> listIdProduct);

	public Integer insertCampaign(CampaignDTO campaign);

	public void addProductToCampaign(List<Integer> listIdProduct,
			Integer idCampaign);
	
	

}
