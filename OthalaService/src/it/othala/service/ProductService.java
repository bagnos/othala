package it.othala.service;

import it.othala.dao.interfaces.IProductDAO;
import it.othala.dto.ArticleDTO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.BrandFullDTO;
import it.othala.dto.CampaignDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.LookBookDTO;
import it.othala.dto.MenuDTO;
import it.othala.dto.MenuFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.ShopDTO;
import it.othala.dto.SiteImagesDTO;
import it.othala.dto.SubMenuBrandDTO;
import it.othala.dto.SubMenuDTO;
import it.othala.dto.VetrinaDTO;
import it.othala.execption.BarcodeNotPresentException;
import it.othala.execption.OthalaException;
import it.othala.service.interfaces.IProductService;

import java.io.File;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

			List<SubMenuBrandDTO> listSubMenuBrand = productDAO
					.listSubMenuBrand(listMenu.get(i).getIdGender());

			listMenu.get(i).setSubMenuBrand(listSubMenuBrand);

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

		domainDTO.setRegioni(productDAO.listRegioni());
		domainDTO.setInfAggiuntive(productDAO.listInfAggiuntive(languages));
		
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
	public DomainDTO insertBrand(String languages, String txBrand, Integer idRegione, Integer idProvincia, String idUser, String urlFoto, String txDescrIT, String txDescrEN) {

		if (productDAO.checkEsistenza("brand", txBrand, null)) {
			productDAO.insertBrand(txBrand, idRegione, idProvincia, idUser, urlFoto, txDescrIT, txDescrEN);
		}

		return getDomain(languages);

	}

	@Override
	public DomainDTO insertSize(String languages, String txSize) {

		if (productDAO.checkEsistenza("size", txSize, null)) {
			productDAO.insertSize(txSize);
		}
		return getDomain(languages);

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
		return getDomain(languages);

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
		return getDomain(languages);

	}

	@Override
	public DomainDTO insertType(String languages, String txType, String txTypeEN) {

		if (productDAO.checkEsistenza("type", txType, "it")) {
			Integer maxIdType = productDAO.getMaxIdType();
			maxIdType = maxIdType + 1;

			productDAO.insertType(maxIdType, "it", txType);
			productDAO.insertType(maxIdType, "en", txTypeEN);
		}
		return getDomain(languages);

	}

	@Override
	public VetrinaDTO getListProduct(String languages, Integer gender,
			Integer type, Integer brand, BigDecimal minPrice,
			BigDecimal maxPrice, Integer size, Integer color,
			Boolean newArrivals, int order, Integer idCampaign,
			Boolean fgCampaign) {

		List<ProductFullNewDTO> listProduct = productDAO.listProduct(languages,
				type, gender, brand, minPrice, maxPrice, size, color,
				newArrivals, order, idCampaign, fgCampaign);

		for (int i = 0; i <= listProduct.size() - 1; i++) {

			List<String> newString = productDAO.listProductImages(listProduct
					.get(i).getIdProduct());

			listProduct.get(i).setImagesUrl(newString);
		}

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
	public ProductFullNewDTO getProductFull(String languages,
			Integer idProduct, Boolean fgQtaZero) {

		ProductFullNewDTO productFull = productDAO.getProductFull(languages,
				idProduct);

		List<String> newString = productDAO.listProductImages(idProduct);
		
		productFull.setInfAggiuntive(productDAO.listInfAggiuntive(idProduct, languages));

		productFull.setImagesUrl(newString);

		List<ArticleFullDTO> listArticleFull = productDAO.listArticleFull(
				idProduct, languages, fgQtaZero);

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
	public ProductFullNewDTO listFindBarcode(String txBarcode) throws BarcodeNotPresentException {

		ProductFullNewDTO productFull = productDAO
				.getProductFullBarcode(txBarcode);

		if (productFull == null) {
			throw new BarcodeNotPresentException(txBarcode);
		}
			List<String> newString = productDAO.listProductImages(productFull
					.getIdProduct());
			productFull.setImagesUrl(newString);

			List<ArticleFullDTO> listArticleFull = productDAO
					.listArticleFullBarcode(productFull.getIdProduct(),
							txBarcode);

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

	@Override
	public void cleanFolderImages(String folderPath) throws OthalaException {
		// Recupero la directory delle immagini
		File dir = new File(folderPath);
		// Recupreo la lista delle immagini nella direcotry
		String[] folderImages = dir.list();
		if (folderImages == null) {
			throw new OthalaException("La directory " + folderPath
					+ " non esiste");
		}
		List<String> imagesToDelete = new ArrayList<String>();
		// Crea una collezione di immagini
		for (int i = 0; i < folderImages.length; i++) {
			imagesToDelete.add(folderImages[i]);

		}

		// Recupero le immagini da tenere
		List<String> imagesToKeep = productDAO.getGoodImages();
		// Recupero i thumbnails da tenere
		List<String> thumbsToKeep = productDAO.getGoodThumbs();

		List<String> imagesLargeToKeep = new ArrayList<String>();

		for (int i = 0; i < imagesToKeep.size(); i++) {
			imagesLargeToKeep.add("LARGE_" + imagesToKeep.get(i));

		}

		// Elimino dalla collezione leimmagini da tenere
		imagesToDelete.removeAll(imagesToKeep);
		imagesToDelete.removeAll(thumbsToKeep);
		imagesToDelete.removeAll(imagesLargeToKeep);
		// Le immagini LARGE non devono essere eliminate
		/*
		 * CharSequence car = "LARGE_"; for (String img : imagesToDelete) { if
		 * (img.contains(car)) imagesToDelete.remove(img); }
		 */

		// Elimino fisicamente i files dalla directory
		String fileDelete = null;
		for (String img : imagesToDelete) {
			fileDelete = folderPath + File.separator + img;
			File file = new File(fileDelete);
			file.delete();
		}

		// Elimino le imamgini da tabella
		productDAO.deleteBadImages();

	}

	@Override
	public int newLookBook(LookBookDTO lookBook) {

		return productDAO.insLookBook(lookBook);
	}

	@Override
	public void addProductToLookBook(int idLookBook, int idProduct) {

		productDAO.insLookBookProduct(idLookBook, idProduct);

	}

	@Override
	public void removeLookBook(int idLookBook) {

		productDAO.delLookBook(idLookBook);

	}

	@Override
	public void removeProductFromLookBook(int idLookBook, int idProduct) {

		productDAO.delLookBookProduct(idLookBook, idLookBook);

	}

	@Override
	public List<LookBookDTO> getLookBook(Integer idLookBook) {

		return productDAO.listaLookBook(idLookBook);
	}

	
	@Override
	public List<BrandFullDTO> listBrandFull(String languages, Integer idProvincia, Integer idRegione, Integer idBrand) {

		return	productDAO.listBrandFull(languages, idProvincia, idRegione, idBrand);

	}
	
	
}
