package it.othala.service.interfaces;

import it.othala.dto.ArticleCashedDTO;
import it.othala.dto.ArticleDTO;
import it.othala.dto.BrandFullDTO;
import it.othala.dto.LookBookDTO;
import it.othala.dto.VetrinaDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.MenuFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.execption.BarcodeNotPresentException;
import it.othala.execption.OthalaException;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public interface IProductService {

	public DomainDTO getDomain(String languages);


	public 	ProductFullNewDTO getProductFull(String languages, Integer idProduct,
			Boolean fgQtaZero);

	
	public ProductFullNewDTO getProductArticleFull(String languages,
			Integer idProduct, Integer pgArticle);

	public List<CampaignDTO> getListCampaign();

	public VetrinaDTO getListProduct(String languages, Integer gender,
			Integer type, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, int order, Integer idCampaign,
			Boolean fgCampaign);

	public void publishProduct(List<Integer> listIdProduct);
	
	public void addProductToCampaign(List<Integer> listIdProduct, Integer idCampaign);
	
	public void removeProductFromCampaign(List<Integer> listIdProduct, CampaignDTO campaign);
	
	public void deleteCampaign(CampaignDTO campaign);
	
	public void updateCampaign(CampaignDTO campaign, List<Integer> listIdProduct);

	public Integer insertCampaign(CampaignDTO campaign);

	public void insertType(String languages, String txType, String txTypeEN);

	public Integer insertProduct(ProductFullNewDTO productFull, Boolean fgPubblicazione) throws OthalaException;

	public List<ProductFullNewDTO> listFindProduct(String txBarcode, Integer state,
			Integer shop, Integer gender, Integer type, Integer brand,
			BigDecimal minPrice, BigDecimal maxPrice, String description,
			Date dtBegin, Date dtEnd);
			
	public List<String> deleteProduct (Integer idProduct);

	public void updateProduct(ProductFullNewDTO productFull);

	public void insertColor(String languages, String txColorIT, String txColorEN);

	public void insertMaterial(String languages, String txMaterialIT,
			String txMaterialEN);

	public ProductFullNewDTO listFindBarcode(String txBarcode) throws BarcodeNotPresentException;

	public MenuFullDTO getMenuFull(String languages);


	public void downloadArticle(List<ArticleDTO> articles, Boolean fgScarico);


	public Integer insertCampaign(CampaignDTO campaign, List<Integer> listIdProduct);


	public void insertSize(String languages, String txSize);
	
	public void cleanFolderImages(String folderPath) throws OthalaException;
	
	public int newLookBook(LookBookDTO lookBook);
	
	public void addProductToLookBook(int idLookBook, int idProduct); 
	
	public void removeLookBook(int idLookBook);
	
	public void removeProductFromLookBook(int idLookBook, int idProduct);
	
	public List<LookBookDTO> getLookBook(Integer idLookBook);


	public List<BrandFullDTO> listBrandFull(String languages, Integer idProvincia,
			Integer idRegione, Integer idBrand);


	public void insertBrand(String languages, String txBrand, Integer idRegione,
			Integer idProvincia, String idUser, String urlFoto,
			String txDescrIT, String txDescrEN);

	public List<ArticleCashedDTO> listArticleCashed();
	public List<ArticleCashedDTO> listArticleMajorCashed(String language);


	
	
}
