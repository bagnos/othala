package it.othala.service.interfaces;

import it.othala.dto.CampaignDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFindDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.enums.OrderByCartFlow;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public interface IProductService {

	public DomainDTO getDomain(String languages);

	public List<MenuDTO> getMenu(String languages);

	public ProductFullDTO getProductFull(String languages, Integer idProduct);

	
	public ProductFullDTO getProductArticleFull(String languages,
			Integer idProduct, Integer pgArticle);

	public DomainDTO insertBrand(String languages, String txBrand);

	public List<ProductDTO> getListProductToPublish();

	public List<CampaignDTO> getListCampaign();

	public List<ProductDTO> getListProduct(String languages, Integer gender,
			Integer type, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
			Boolean fgCampaign);

	public void publishProduct(List<Integer> listIdProduct);
	
	public void addProductToCampaign(List<Integer> listIdProduct, Integer idCampaign);

	public Integer insertCampaign(CampaignDTO campaign);

	public DomainDTO insertType(String languages, String txType);

	public DomainDTO insertColor(String languages, String txColor);

	public Integer insertProduct(ProductFullDTO productFull, Boolean fgPubblicazione);

	public List<ProductFindDTO> listFindProduct(String txBarcode, Integer state,
			Integer shop, Integer gender, Integer type, Integer brand,
			BigDecimal minPrice, BigDecimal maxPrice, String description,
			Date dtBegin, Date dtEnd);
			
	public List<String> deleteProduct (Integer idProduct);

	public void updateProduct(ProductFullDTO productFull);
	public void downloadArticle(String txBarcode);
	
}
