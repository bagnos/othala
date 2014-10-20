package it.othala.service.interfaces;

import it.othala.dto.ArticleDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.enums.OrderByCartFlow;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public interface IProductService {

	public DomainDTO getDomain(String languages);


	public ProductFullNewDTO getProductFull(String languages, Integer idProduct);

	
	public ProductFullNewDTO getProductArticleFull(String languages,
			Integer idProduct, Integer pgArticle);

	public DomainDTO insertBrand(String languages, String txBrand);

	public List<CampaignDTO> getListCampaign();

	public List<ProductFullNewDTO> getListProduct(String languages, Integer gender,
			Integer type, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, OrderByCartFlow order, Integer idCampaign,
			Boolean fgCampaign);

	public void publishProduct(List<Integer> listIdProduct);
	
	public void addProductToCampaign(List<Integer> listIdProduct, Integer idCampaign);
	
	public void removeProductFromCampaign(List<Integer> listIdProduct, CampaignDTO campaign);
	
	public void deleteCampaign(CampaignDTO campaign);
	
	public void updateCampaign(CampaignDTO campaign);

	public Integer insertCampaign(CampaignDTO campaign);

	public DomainDTO insertType(String languages, String txType);

	public Integer insertProduct(ProductFullNewDTO productFull, Boolean fgPubblicazione);

	public List<ProductFullNewDTO> listFindProduct(String txBarcode, Integer state,
			Integer shop, Integer gender, Integer type, Integer brand,
			BigDecimal minPrice, BigDecimal maxPrice, String description,
			Date dtBegin, Date dtEnd);
			
	public List<String> deleteProduct (Integer idProduct);

	public void updateProduct(ProductFullNewDTO productFull);

	public DomainDTO insertColor(String languages, String txColorIT, String txColorEN);

	public DomainDTO insertMaterial(String languages, String txMaterialIT,
			String txMaterialEN);

	public ProductFullNewDTO listFindBarcode(String txBarcode);

	public MenuFullDTO getMenuFull(String languages);


	public void downloadArticle(List<ArticleDTO> articles, Boolean fgScarico);


	public Integer insertCampaign(CampaignDTO campaign, List<Integer> listIdProduct);


	
	
}
