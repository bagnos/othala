package it.othala.merchant.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.BrandFullDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.ShopDTO;
import it.othala.enums.ArticleUpdate;
import it.othala.execption.OthalaException;
import it.othala.merchant.model.MerchantBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ResizeImageUtil;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class InsertProdottiView extends BaseView {

	public String getNewBrandFulltxBrand() {
		return newBrandFulltxBrand;
	}

	public void setNewBrandFulltxBrand(String newBrandFulltxBrand) {
		this.newBrandFulltxBrand = newBrandFulltxBrand;
	}

	public Integer getNewBrandFullidProvincia() {
		return newBrandFullidProvincia;
	}

	public void setNewBrandFullidProvincia(Integer newBrandFullidProvincia) {
		this.newBrandFullidProvincia = newBrandFullidProvincia;
	}

	public Integer getNewBrandFullidRegione() {
		return newBrandFullidRegione;
	}

	public void setNewBrandFullidRegione(Integer newBrandFullidRegione) {
		this.newBrandFullidRegione = newBrandFullidRegione;
	}

	public String getNewBrandFullurlFoto() {
		return newBrandFullurlFoto;
	}

	public void setNewBrandFullurlFoto(String newBrandFullurlFoto) {
		this.newBrandFullurlFoto = newBrandFullurlFoto;
	}

	public String getNewBrandFulltxDescrIT() {
		return newBrandFulltxDescrIT;
	}

	public void setNewBrandFulltxDescrIT(String newBrandFulltxDescrIT) {
		this.newBrandFulltxDescrIT = newBrandFulltxDescrIT;
	}

	public String getNewBrandFulltxDescrEN() {
		return newBrandFulltxDescrEN;
	}

	public void setNewBrandFulltxDescrEN(String newBrandFulltxDescrEN) {
		this.newBrandFulltxDescrEN = newBrandFulltxDescrEN;
	}

	/**
	 * 
	 */

	private AttributeDTO genere;
	private AttributeDTO tipo;
	private AttributeDTO brand;
	private AttributeDTO material;
	private int sconto;
	private BigDecimal prezzo;
	private BigDecimal prezzoSpeciale;
	private BigDecimal prezzoScontato;
	private List<String> imagesFile = new ArrayList<>();
	// private List<String> imagesGuidFile = new ArrayList<>();

	private String descrizione;
	private String descrizioneEN;
	private AttributeDTO size;
	private AttributeDTO color;
	private int qta;
	private String negozio;
	private ShopDTO shop;
	private String fileThumb;

	private List<ArticleFullDTO> articles = new ArrayList<ArticleFullDTO>();
	private String removedArticle;
	private String merchantCode;
	private String newBrand;
	private String newColor;
	private String newColorEN;
	private String newMaterial;
	private String newMaterialEN;
	private String newType;
	private String newTypeEN;
	private boolean pubblica;
	private BrandFullDTO newBrandFull;
	
	
	
private String newBrandFulltxBrand;
	private Integer newBrandFullidProvincia;
	private Integer newBrandFullidRegione;
	private String newBrandFullurlFoto;
	private String newBrandFulltxDescrIT;
	private String newBrandFulltxDescrEN;
	private String newBrandFullidUser;
	
	

	private Boolean fgRead;
	private Boolean fgMod;
	private static DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private String separatorDateFormat = "&";
	private Boolean detail;
	private ProductFullNewDTO prdDetail = null;

	private final int SCROLL_WIDTH_AUTOCOMPLETE = 100;
	private String newSize;
	private List<String> imgToDelete = new ArrayList<>();

	public String getNewSize() {
		return newSize;
	}

	public void setNewSize(String newSize) {
		this.newSize = newSize;
	}

	public Boolean getDetail() {
		return detail;
	}

	public void setDetail(Boolean detail) {
		this.detail = detail;
	}

	@ManagedProperty(value = "#{merchantBean}")
	private MerchantBean merchantBean;

	public MerchantBean getMerchantBean() {
		return merchantBean;
	}

	/*
	 * public List<String> getImagesGuidFile() { return imagesGuidFile; }
	 */

	public void setMerchantBean(MerchantBean merchantBean) {
		this.merchantBean = merchantBean;
	}

	public Boolean getFgRead() {
		if (fgRead == null) {
			fgRead = false;
		}
		return fgRead;
	}

	public void setFgRead(Boolean fgRead) {
		this.fgRead = fgRead;
	}

	public Boolean getFgMod() {
		if (fgMod == null) {
			fgMod = false;
		}
		return fgMod;
	}

	public void setFgMod(Boolean fgMod) {
		this.fgMod = fgMod;
	}

	public boolean isPubblica() {
		return pubblica;
	}

	public void setPubblica(boolean pubblica) {
		this.pubblica = pubblica;
	}

	public String getNewType() {
		return newType;
	}

	public void setNewType(String newType) {
		this.newType = newType;
	}

	public String getNewTypeEN() {
		return newTypeEN;
	}

	public void setNewTypeEN(String newTypeEN) {
		this.newTypeEN = newTypeEN;
	}

	public String getNewColor() {
		return newColor;
	}

	public void setNewColor(String newColor) {
		this.newColor = newColor;
	}

	public String getNewBrand() {
		return newBrand;
	}

	public void setNewBrand(String newBrand) {
		this.newBrand = newBrand;
	}


	
	public BrandFullDTO getNewBrandFull() {
		return newBrandFull;
	}

	public void setNewBrandFull(BrandFullDTO newBrandFull) {
		this.newBrandFull = newBrandFull;
	}
	
	public String getMerchantCode() {
		return merchantCode;
	}

	public void setMerchantCode(String merchantCode) {
		this.merchantCode = merchantCode;
	}

	public String getRemovedArticle() {
		return removedArticle;
	}

	public void setRemovedArticle(String removedArticle) {
		this.removedArticle = removedArticle;
	}

	public List<ArticleFullDTO> getArticles() {
		return articles;
	}

	public List<String> getImagesFile() {
		return imagesFile;
	}

	public void setFileThumb(String fileThumb) {
		this.fileThumb = fileThumb;
	}

	public int getSCROLL_WIDTH_AUTOCOMPLETE() {
		return SCROLL_WIDTH_AUTOCOMPLETE;
	}

	public String getFileThumb() {

		return fileThumb;
	}

	public ShopDTO getShop() {
		return shop;
	}

	public void setShop(ShopDTO shop) {
		this.shop = shop;
	}

	public String getNegozio() {
		return negozio;
	}

	public void setNegozio(String negozio) {
		this.negozio = negozio;
	}

	public int getQta() {
		return qta;
	}

	public void setQta(int qta) {
		this.qta = qta;
	}

	public AttributeDTO getSize() {
		return size;
	}

	public void setSize(AttributeDTO size) {
		this.size = size;
	}

	public AttributeDTO getColor() {
		return color;
	}

	public void setColor(AttributeDTO color) {
		this.color = color;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getDescrizioneEN() {
		return descrizioneEN;
	}

	public void setDescrizioneEN(String descrizioneEN) {
		this.descrizioneEN = descrizioneEN;
	}

	public BigDecimal getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(BigDecimal prezzo) {
		this.prezzo = prezzo;
	}

	public BigDecimal getPrezzoSpeciale() {
		return prezzoSpeciale;
	}

	public void setPrezzoSpeciale(BigDecimal prezzoSpeciale) {
		this.prezzoSpeciale = prezzoSpeciale;
	}

	public BigDecimal getPrezzoScontato() {
		return prezzoScontato;
	}

	public void setPrezzoScontato(BigDecimal prezzoScontato) {
		this.prezzoScontato = prezzoScontato;
	}

	public int getSconto() {
		return sconto;
	}

	public void setSconto(int sconto) {
		this.sconto = sconto;
	}

	public AttributeDTO getBrand() {
		return brand;
	}

	public void setBrand(AttributeDTO brand) {
		this.brand = brand;
	}

	public AttributeDTO getTipo() {
		return tipo;
	}

	public void setTipo(AttributeDTO tipo) {
		this.tipo = tipo;
	}

	public AttributeDTO getGenere() {
		return genere;
	}

	public void setGenere(AttributeDTO genere) {
		this.genere = genere;
	}

	private static final long serialVersionUID = 1L;

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		DomainDTO dom = getBeanApplication().getDomain();
		shop = getBeanApplication().getShopsDTO().get(0);
		pubblica = true;
		if (detail != null && detail) {
			initProdotto();
		}

		changeLocaleIT();

		qta = 1;
		imgToDelete = new ArrayList<String>();
;
		return null;
		
	}

	public void addProduct(ActionEvent e) {
		try {
			if (articles.isEmpty()) {
				addError("Prodotto", "Inserire almeno un articolo");
				return;
			}

			ProductFullNewDTO prd = new ProductFullNewDTO();
			// lo mettiamo sempre, avrà significato solo per configurazioni
			// diverse da uno

			prd.setArticles(articles);
			prd.setDescription(descrizione);
			prd.setDescriptionEN(descrizioneEN);

			prd.setDiscount(sconto);
			prd.setIdBrand(brand.getAttributo());
			prd.setIdGender(genere.getAttributo());
			prd.setIdType(tipo.getAttributo());
			prd.setIdMaterial(material.getAttributo());
			prd.setImagesUrl(imagesFile);
			prd.setMerchantCode(merchantCode);
			prd.setPrice(prezzo);
			prd.setSpecialPrice(prezzoSpeciale);
			prd.setThumbnailsUrl(fileThumb);
			prd.setPriceDiscounted(prezzoScontato);
			prd.setIdProductState(0);
			if (pubblica)
			{
				prd.setIdProductState(1);
			}
			if (getBeanApplication().isConfiguredBarcodeProduct()) {
				for (ArticleFullDTO art : prd.getArticles()) {
					art.setTxBarCode(merchantCode);
				}
			}

			if (fgMod == null || fgMod == false) {
				OthalaFactory.getProductServiceInstance().insertProduct(prd, pubblica);
				resetPrd();
				getBeanApplication().resetDomain();
				addInfo("Prodotto", "inserimento effettuato correttamente");
			} else {
				prd.setIdProduct(prdDetail.getIdProduct());
				OthalaFactory.getProductServiceInstance().updateProduct(prd);
				merchantBean.findProduct();
				getBeanApplication().resetDomain();
				addInfo("Prodotto", "modifica effettuata correttamente");
			}

			eliminaImmagini();

		} catch (OthalaException oex) {
			addError("errore nell'inserimento del prodotto", oex.getMessage());

		}

		catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del prodotto");
		}

	}

	public void addProduct2(ActionEvent e) {
		try {
			if (articles.isEmpty()) {
				addError("Prodotto", "Inserire almeno un articolo");
				return;
			}

			ProductFullNewDTO prd = new ProductFullNewDTO();
			// lo mettiamo sempre, avrà significato solo per configurazioni
			// diverse da uno

			prd.setArticles(articles);
			prd.setDescription(descrizione);
			prd.setDescriptionEN(descrizioneEN);

			//prd.setDiscount(sconto);
			prd.setIdBrand(brand.getAttributo());
			prd.setIdGender(genere.getAttributo());
			prd.setIdType(tipo.getAttributo());
			prd.setIdMaterial(1);
			prd.setImagesUrl(imagesFile);
			prd.setMerchantCode(merchantCode);
			prd.setPriceDiscounted(new BigDecimal(9999999));
			for (ArticleFullDTO art: articles)
			{
				if (art.getPriceDiscounted().compareTo(prd.getPriceDiscounted()) < 0 )
				{
					prd.setPriceDiscounted(art.getPriceDiscounted());
					prd.setPrice(art.getPrice());
					prd.setDiscount(art.getDiscount());
					prd.setSpecialPrice(new BigDecimal(0));
				}
				
			}
			//prd.setPrice(prezzo);
			//prd.setSpecialPrice(prezzoSpeciale);
			//prd.setSpecialPrice(null);
			prd.setThumbnailsUrl(fileThumb);
			//prd.setPriceDiscounted(prezzoScontato);
			prd.setIdProductState(0);
			prd.setTyProduct(1);
			if (pubblica)
			{
				prd.setIdProductState(1);
			}
			if (getBeanApplication().isConfiguredBarcodeProduct()) {
				for (ArticleFullDTO art : prd.getArticles()) {
					art.setTxBarCode(merchantCode);
				}
			}

			if (fgMod == null || fgMod == false) {
				OthalaFactory.getProductServiceInstance().insertProduct(prd, pubblica);
				resetPrd();
				getBeanApplication().resetDomain();
				addInfo("Prodotto", "inserimento effettuato correttamente");
			} else {
				prd.setIdProduct(prdDetail.getIdProduct());
				OthalaFactory.getProductServiceInstance().updateProduct(prd);
				merchantBean.findProduct();
				getBeanApplication().resetDomain();
				addInfo("Prodotto", "modifica effettuata correttamente");
			}

			eliminaImmagini();

		} catch (OthalaException oex) {
			addError("errore nell'inserimento del prodotto", oex.getMessage());

		}

		catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del prodotto");
		}

	}

	
	private void eliminaImmagini() {
		if (!imgToDelete.isEmpty()) {
			try {

				ResizeImageUtil.deleteImages(imgToDelete);

			} catch (Exception e) {
				log.error("errore eliminazione immagine", e);
			}
		}
	}

	private void initProdotto() {
		prdDetail = OthalaFactory.getProductServiceInstance().getProductFull(getLang(),
				merchantBean.getSelectedProducts().get(0).getIdProduct(), true);

		if (prdDetail.getArticles() != null) {
			if (!prdDetail.getArticles().isEmpty()) {
				merchantCode = prdDetail.getArticles().get(0).getTxBarCode();
			}
		} else {
			merchantCode = "";
		}
		articles = prdDetail.getArticles();
		descrizione = prdDetail.getDescription();
		descrizioneEN = prdDetail.getDescriptionEN();
		imagesFile = prdDetail.getImagesUrl();
		prezzo = prdDetail.getPrice();
		prezzoScontato = prdDetail.getPriceDiscounted();
		prezzoSpeciale = prdDetail.getSpecialPrice();
		fileThumb = prdDetail.getThumbnailsUrl();
		sconto = prdDetail.getDiscount();

		brand = new AttributeDTO();
		brand.setAttributo(prdDetail.getIdBrand());
		brand.setValore(prdDetail.getTxBrand());

		material = new AttributeDTO();
		material.setAttributo(prdDetail.getIdMaterial());
		material.setValore(prdDetail.getTxMaterial());
		
		pubblica=!(prdDetail.getIdProductState()==null || prdDetail.getIdProductState().intValue()==0); 

		genere = new AttributeDTO();
		genere.setAttributo(prdDetail.getIdGender());
		genere.setValore(prdDetail.getTxGender());

		tipo = new AttributeDTO();
		tipo.setAttributo(prdDetail.getIdType());
		tipo.setValore(prdDetail.getTxType());

	}

	private void resetPrd() {
		articles.clear();
		imagesFile.clear();
		merchantCode = null;
		prezzo = null;
		prezzoSpeciale = null;
		prezzoScontato = null;
		genere = null;
		tipo = null;
		sconto = 0;
		brand = null;
		material = null;
		size = null;
		shop = getBeanApplication().getShopsDTO().get(0);
		fileThumb = null;
		descrizione = null;
		descrizioneEN = null;
		qta = 1;
		color = null;
		pubblica = true;

		imagesFile.clear();
		fileThumb = null;

	}

	public void addArticle(ActionEvent e) {

		if (fileThumb == null) {
			addError("thumbinal", "nessun file caricato");
			return;
		}

		ArticleFullDTO art = new ArticleFullDTO();
		art.setThumbnailsUrl(fileThumb);
		art.setShop(getShop());
		art.setIdSize(size.getAttributo());
		art.setTxSize(size.getValore());
		art.setQtStock(qta);
		art.setIdColor(color.getAttributo());
		art.setTxColor(color.getValore());

		// se barcode è sul prodotto mettiamo lo stesso barcode a tutti gli
		// articoli

		if (articles.size() == 0) {
			art.setPgArticle(1);
		} else {
			art.setPgArticle(articles.get(articles.size() - 1).getPgArticle() + 1);
		}
		art.setTxBarCode(merchantCode);
		art.setArticleUpdate(ArticleUpdate.NUOVO);
		articles.add(art);

		// shop = getBeanApplication().getShopsDTO().get(0);
	}

	public void addArticle2(ActionEvent e) {

		if (fileThumb == null) {
			addError("thumbinal", "nessun file caricato");
			return;
		}

		ArticleFullDTO art = new ArticleFullDTO();
		art.setThumbnailsUrl(fileThumb);
		art.setShop(getShop());
		art.setIdSize(size.getAttributo());
		art.setTxSize(size.getValore());
		art.setQtStock(qta);
		
		art.setIdColor(new Integer (1));
		art.setTxColor("N/A");

		
		// se barcode è sul prodotto mettiamo lo stesso barcode a tutti gli
		// articoli

		if (articles.size() == 0) {
			art.setPgArticle(1);
		} else {
			art.setPgArticle(articles.get(articles.size() - 1).getPgArticle() + 1);
		}
		art.setTxBarCode(merchantCode);
		art.setPrice(getPrezzo());
		art.setDiscount(getSconto());
		art.setSpecialPrice(new BigDecimal(0));
		
		art.setPriceDiscounted(getPrezzo().subtract((getPrezzo().multiply(new BigDecimal(getSconto()).divide(new BigDecimal(100))))));
		
		art.setArticleUpdate(ArticleUpdate.NUOVO);
		articles.add(art);

		// shop = getBeanApplication().getShopsDTO().get(0);
	}
	
	public List<AttributeDTO> completeTaglia(String query) {
		return getAutoUtils().completeTaglia(query);
	}

	public List<AttributeDTO> completeGenere(String query) {
		return getAutoUtils().completeGenere(query);
	}

	public List<AttributeDTO> completeTipo(String query) {

		return getAutoUtils().completeTipo(query);

	}

	public List<AttributeDTO> completeBrand(String query) {
		return getAutoUtils().completeBrand(query);

	}

	public List<AttributeDTO> completeMaterial(String query) {
		return getAutoUtils().completeMaterial(query);

	}

	public List<ShopDTO> completeShops(String query) {
		return getAutoUtils().completeShops(query);
	}

	public List<AttributeDTO> completeColours(String query) {
		return getAutoUtils().completeColours(query);
	}

	/*
	 * public void removeArticle(ActionEvent e) {
	 * 
	 * Integer id = (Integer) e.getComponent().getAttributes().get("idArt");
	 * 
	 * if (!articles.isEmpty()) { for (ArticleFullDTO art : articles) { if
	 * (art.getPgArticle().intValue() == id.intValue()) {
	 * //articles.remove(art); //art.setQtBooked(0); return; } }
	 * 
	 * } }
	 */

	public void modifyArticle(ActionEvent e) {

		Integer id = (Integer) e.getComponent().getAttributes().get("idArt");
		if (!articles.isEmpty()) {
			for (ArticleFullDTO art : articles) {
				if (art.getPgArticle().intValue() == id.intValue()) {
					art.setSelected(true);
					return;
				}
			}
		}
	}

	public void deleteArticle(ActionEvent e) {

		Integer id = (Integer) e.getComponent().getAttributes().get("idArt");

		if (!articles.isEmpty()) {
			for (ArticleFullDTO art : articles) {
				if (art.getPgArticle().intValue() == id.intValue()) {

					articles.remove(art);
					break;
				}

			}

		}
	}

	public void closeArticle(ActionEvent e) {

		Integer id = (Integer) e.getComponent().getAttributes().get("idArt");
		if (!articles.isEmpty()) {
			for (ArticleFullDTO art : articles) {
				if (art.getPgArticle().intValue() == id.intValue()) {
					art.setSelected(false);
					return;
				}
			}
		}
	}

	public void confirmArticle(ActionEvent e) {

		Integer id = (Integer) e.getComponent().getAttributes().get("idArt");
		if (!articles.isEmpty()) {
			for (ArticleFullDTO art : articles) {
				if (art.getPgArticle().intValue() == id.intValue()) {
					art.setSelected(false);
					if (art.getArticleUpdate() == null
							|| art.getArticleUpdate().getStato() != ArticleUpdate.NUOVO.getStato()) {
						art.setArticleUpdate(ArticleUpdate.MODIFICATO);
					}
					return;
				}
			}
		}
	}

	public void removeImgPrd(ActionEvent e) {

		String fileName = (String) e.getComponent().getAttributes().get("img");

		imagesFile.remove(fileName);

		if (fileThumb != null && fileThumb.contains(fileName)) {
			// cancelli direttamente solo in modalità inserimento, non in
			// modifica
			if (!fgMod) {
				ResizeImageUtil.deleteImage(fileThumb);
			}
			fileThumb = null;
		}

		if (!fgMod) {
			ResizeImageUtil.deleteImage(fileName);
		} else {
			// aggiungiamo alla lista delle immagini da cancellare
			imgToDelete.add(fileName);
		}

	}

	public void handleFileUpload(FileUploadEvent event) {
		UploadedFile file = event.getFile();
		String fileResized = null;

		if (file == null) {
			addError("Inserimento immagine", "immagine non selezionata");
			return;
		}

		if (file != null) {

			// verifica se il file è già presente
			for (String image : imagesFile) {
				if (image.toUpperCase().trim().contains(file.getFileName().trim().toUpperCase())) {
					addError("Upload", file.getFileName() + " già presente");
					return;
				}
			}

			try {
				fileResized = copyFile(file);
				imagesFile.add(fileResized);
				if (fileThumb == null) {
					fileThumb = fileResized;
					resizeThumb(ResizeImageUtil.getFormat(file));
				}

			} catch (IOException e) {
				log.error("errore upload", e);
				addError("Upload", file.getFileName() + " errore nell'upload");
			}
			addInfo("Upload", file.getFileName() + " è stata caricata correttamente");

		}
	}

	public void addThumb(ActionEvent e) {

		fileThumb = (String) e.getComponent().getAttributes().get("img");
		resizeThumb(ResizeImageUtil.getFormat(fileThumb));

	}
	
	public void moveThumb(ActionEvent e) {

		int index = (int) e.getComponent().getAttributes().get("img");
		int indexMove=(index+1) % imagesFile.size();
		Collections.swap(imagesFile, index, indexMove);

	}

	private String copyFile(UploadedFile file) throws IOException {

		// File result = new File(extContext.getRealPath(BASE_IMG_PATH +
		// file.getFileName()));

		// FileOutputStream fileOutputStream = new FileOutputStream(result);
		InputStream inputStream = file.getInputstream();
		String format = ResizeImageUtil.getFormat(file);
		// IOUtils.copy(inputStream, fileOutputStream);
		Date date = new Date();

		String fileResized = ResizeImageUtil.resizeAndCopyImage(inputStream, dateFormat.format(date)
				+ separatorDateFormat + file.getFileName().replaceAll(separatorDateFormat, ""), format);

		return fileResized;

	}

	private void resizeThumb(String format) {
		try {
			fileThumb = ResizeImageUtil.resizeImageThumb(fileThumb, format);
		} catch (IOException e1) {
			addGenericError(e1, "Errore nel resize dell'immagine thumb");
		}
	}

	public void addNewBrand(ActionEvent e) {
		brand=null;
		if (newBrand == null || newBrand.isEmpty()) {
			addError("Nuovo Brand", "inserire il brand");
			return;
		}
		newBrand=newBrand.trim();
		try {
			OthalaFactory.getProductServiceInstance().insertBrand(getLang(), newBrand, null, null, null, null, null,
					null);
			log.info("inserito brand "+newBrand);
			getBeanApplication().resetDomain();
			for (AttributeDTO attr : getBeanApplication().getBrandDTO()) {
				log.info("attr "+attr.getValore());
				if (attr.getValore().equalsIgnoreCase(newBrand)) {
					brand = attr;
					break;
				}
			}
			if (brand != null) {
				addInfo("Nuovo Brand", "brand inserito correttamente");
			} else {
				addError("Nuovo brand", "errore inserimento brand");
			}

		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del brand");
		}
	}
	
	public void addNewBrandFull(ActionEvent e) {
		brand=null;
		if (newBrandFulltxBrand == null || newBrandFulltxBrand.isEmpty()) {
			addError("Nuovo Brand", "inserire il brand");
			return;
		}
		
		newBrandFull =  new BrandFullDTO();
		newBrandFull.setTxBrand(newBrandFulltxBrand);
		newBrandFull.setIdProvincia(newBrandFullidProvincia);
		newBrandFull.setIdRegione(newBrandFullidRegione);
		newBrandFull.setUrlFoto(newBrandFullurlFoto);
		newBrandFull.setTxDescrIT(newBrandFulltxDescrIT);
		newBrandFull.setTxDescrEN(newBrandFulltxDescrEN);
		newBrandFull.setIdUser(newBrandFullidUser);
		
		try {
			OthalaFactory.getProductServiceInstance().insertBrand(getLang(), newBrandFull.getTxBrand(), null, null, null, null, newBrandFull.getTxDescrIT(),
					newBrandFull.getTxDescrEN());
			
			getBeanApplication().resetDomain();
			
			for (AttributeDTO attr : getBeanApplication().getBrandDTO()) {
				
				if (attr.getValore().equalsIgnoreCase(newBrandFull.getTxBrand())) {
					brand = attr;
					break;
				}
			}
			if (brand != null) {
				addInfo("Nuovo Brand", "brand inserito correttamente");
			} else {
				addError("Nuovo brand", "errore inserimento brand");
			}

		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del brand");
		}
	}

	public void addNewColor(ActionEvent e) {
		if (newColor == null || newColor.isEmpty() || newColorEN == null || newColorEN.isEmpty()) {
			addError("Nuovo colore", "inserire il colore");
			return;
		}
		try {
			OthalaFactory.getProductServiceInstance().insertColor(getLang(), newColor, newColorEN);
			getBeanApplication().resetDomain();
			color = completeColours(newColor).get(0);
			addInfo("Nuovo Colore", "colore inserito correttamente");

		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del colore");
		}
	}

	public void addNewSize(ActionEvent e) {
		if (newSize == null || newSize.isEmpty()) {
			addError("Nuova taglia", "inserire la taglia");
			return;
		}
		try {
			OthalaFactory.getProductServiceInstance().insertSize(getLang(), newSize);
			getBeanApplication().resetDomain();
			size = completeTaglia(newSize).get(0);
			addInfo("Nuova taglia", "operazione eseguita correttamente");

		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento della taglia");
		}
	}

	public void addNewMaterial(ActionEvent e) {
		if (newMaterial == null || newMaterial.isEmpty() || newMaterialEN == null || newMaterialEN.isEmpty()) {
			addError("Nuovo materiale", "inserire il materiale");
			return;
		}
		try {
			OthalaFactory.getProductServiceInstance().insertMaterial(getLang(), newMaterial, newMaterialEN);
			getBeanApplication().resetDomain();
			material = completeMaterial(newMaterial).get(0);
			addInfo("Nuovo Materiale", "materiale inserito correttamente");

		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del materiale");
		}
	}

	public void addNewType(ActionEvent e) {
		if (newType == null || newType.isEmpty() || newTypeEN == null || newTypeEN.isEmpty()) {
			addError("Nuovo tipo", "inserire il tipo");
			return;
		}
		try {
			OthalaFactory.getProductServiceInstance().insertType(getLang(), newType, newTypeEN);
			getBeanApplication().resetDomain();
			tipo = completeTipo(newType).get(0);
			addInfo("Nuovo tipo", "tipo inserito correttamente");

		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del tipo");
		}
	}

	public String getNewColorEN() {
		return newColorEN;
	}

	public void setNewColorEN(String newColorEN) {
		this.newColorEN = newColorEN;
	}

	public AttributeDTO getMaterial() {
		return material;
	}

	public void setMaterial(AttributeDTO material) {
		this.material = material;
	}

	public String getNewMaterial() {
		return newMaterial;
	}

	public void setNewMaterial(String newMaterial) {
		this.newMaterial = newMaterial;
	}

	public String getNewMaterialEN() {
		return newMaterialEN;
	}

	public void setNewMaterialEN(String newMaterialEN) {
		this.newMaterialEN = newMaterialEN;
	}

	public String getNewBrandFullidUser() {
		return newBrandFullidUser;
	}

	public void setNewBrandFullidUser(String newBrandFullidUser) {
		this.newBrandFullidUser = newBrandFullidUser;
	}

}
