package it.othala.merchant.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ResizeImageUtil;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class InsertProdottiView extends BaseView {

	/**
	 * 
	 */

	private AttributeDTO genere;
	private AttributeDTO tipo;
	private AttributeDTO brand;
	private int sconto;
	private BigDecimal prezzo;
	private BigDecimal prezzoScontato;
	private List<String> imagesFile = new ArrayList<>();
	private String descrizione;
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
	private String newType;
	private boolean pubblica;

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

	private final String BASE_IMG_PATH = "//resources//images//cartThumbinals//";
	private final int SCROLL_WIDTH_AUTOCOMPLETE = 100;

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

	public BigDecimal getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(BigDecimal prezzo) {
		this.prezzo = prezzo;
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

	private UploadedFile file;

	public UploadedFile getFile() {
		return file;
	}

	public void setFile(UploadedFile file) {
		this.file = file;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		DomainDTO dom = getBeanApplication().getDomain();
		qta = 1;
		return null;
	}

	public void addProduct(ActionEvent e) {
		try {
			if (articles.isEmpty()) {
				addError("Prodotto", "Inserire almeno un articolo");
				return;
			}

			ProductFullDTO prd = new ProductFullDTO();
			prd.setArticles(articles);
			prd.setDescription(descrizione);
			prd.setDiscount(sconto);
			prd.setIdBrand(brand.getAttributo());
			prd.setIdGender(genere.getAttributo());
			prd.setIdType(tipo.getAttributo());
			prd.setImagesUrl(imagesFile);
			prd.setMerchantCode(merchantCode);
			prd.setPrice(prezzo);
			prd.setThumbnailsUrl(fileThumb);
			prd.setPriceDiscounted(prezzoScontato);
			OthalaFactory.getProductServiceInstance().insertProduct(prd);
			resetPrd();
			getBeanApplication().resetMenu();
			addInfo("Prodotto", "inserimento effettuato correttamente");

		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del prodotto");
		}

	}

	private void resetPrd() {
		articles.clear();
		imagesFile.clear();
		merchantCode = null;
		prezzo = null;
		prezzoScontato = null;
		genere = null;
		tipo = null;
		sconto = 0;
		brand = null;
		size = null;
		shop = null;
		fileThumb = null;
		descrizione = null;
		qta = 1;
		color = null;

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
		art.setPgArticle(articles.size());
		articles.add(art);
	}

	public List<AttributeDTO> completeGenere(String query) {
		List<AttributeDTO> allAttributeDTO = getBeanApplication().getGenderDTO();
		List<AttributeDTO> filteredAttributeDTO = new ArrayList<AttributeDTO>();

		for (int i = 0; i < allAttributeDTO.size(); i++) {
			AttributeDTO attr = allAttributeDTO.get(i);
			if (attr.getValore().toLowerCase().startsWith(query.toLowerCase())) {
				filteredAttributeDTO.add(attr);
			}
		}

		return filteredAttributeDTO;
	}

	public List<AttributeDTO> completeTaglia(String query) {
		List<AttributeDTO> filteredSize = new ArrayList<AttributeDTO>();
		if (tipo != null) {
			List<AttributeDTO> allSize = getBeanApplication().getSizesDTO(tipo.getAttributo().intValue());

			for (int i = 0; i < allSize.size(); i++) {
				AttributeDTO attr = allSize.get(i);
				if (attr.getValore().toLowerCase().startsWith(query.toLowerCase())) {
					filteredSize.add(attr);
				}
			}
		}

		return filteredSize;
	}

	public List<AttributeDTO> completeBrand(String query) {
		List<AttributeDTO> allBrands = getBeanApplication().getBrandDTO();
		List<AttributeDTO> filteredBrands = new ArrayList<AttributeDTO>();

		for (int i = 0; i < allBrands.size(); i++) {
			AttributeDTO attr = allBrands.get(i);
			if (attr.getValore().toLowerCase().startsWith(query.toLowerCase())) {
				filteredBrands.add(attr);
			}
		}

		return filteredBrands;
	}

	public List<ShopDTO> completeShops(String query) {
		List<ShopDTO> allShops = getBeanApplication().getShopsDTO();
		List<ShopDTO> filteredShops = new ArrayList<ShopDTO>();

		for (int i = 0; i < allShops.size(); i++) {
			ShopDTO attr = allShops.get(i);
			if (attr.getTxShop().toLowerCase().startsWith(query.toLowerCase())) {
				filteredShops.add(attr);
			}
		}

		return filteredShops;
	}

	public List<AttributeDTO> completeColours(String query) {
		List<AttributeDTO> allColours = getBeanApplication().getColorsDTO();
		List<AttributeDTO> filteredColours = new ArrayList<AttributeDTO>();

		for (int i = 0; i < allColours.size(); i++) {
			AttributeDTO attr = allColours.get(i);
			if (attr.getValore().toLowerCase().startsWith(query.toLowerCase())) {
				filteredColours.add(attr);
			}
		}

		return filteredColours;
	}

	public List<AttributeDTO> completeTipo(String query) {

		List<AttributeDTO> allType = getBeanApplication().getTypeDTO();
		List<AttributeDTO> filteredType = new ArrayList<AttributeDTO>();

		for (int i = 0; i < allType.size(); i++) {
			AttributeDTO menu = allType.get(i);
			if (menu.getValore().toLowerCase().startsWith(query.toLowerCase())) {
				filteredType.add(menu);
			}
		}

		return filteredType;
	}

	public void upload(ActionEvent e) {
		if (file != null) {
			FacesMessage message = new FacesMessage("Succesful", file.getFileName() + " is uploaded.");
			FacesContext.getCurrentInstance().addMessage(null, message);
		}
	}

	public void removeArticle(ActionEvent e) {

		Integer id = (Integer) e.getComponent().getAttributes().get("idArt");

		if (!articles.isEmpty()) {
			for (ArticleFullDTO art : articles) {
				if (art.getPgArticle().intValue() == id.intValue()) {
					articles.remove(art);
					return;
				}
			}

		}
	}

	public void removeImgPrd(ActionEvent e) {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();
		String fileName = (String) e.getComponent().getAttributes().get("img");
		File file = new File(extContext.getRealPath(BASE_IMG_PATH + fileName));
		imagesFile.remove(fileName);

		if (fileName.equalsIgnoreCase(fileThumb)) {
			ResizeImageUtil.deleteImageThumb(fileThumb, extContext.getRealPath(BASE_IMG_PATH));
			fileThumb = null;
		}

		file.delete();

	}

	public void handleFileUpload(FileUploadEvent event) {
		UploadedFile file = event.getFile();
		String fileResized = null;
		if (file != null) {

			// verifica se il file è già presente
			if (imagesFile.contains(file.getFileName())) {
				addError("Upload", file.getFileName() + " già presente");
				return;
			}

			try {
				fileResized = copyFile(file);
				if (fileThumb == null) {
					fileThumb = fileResized;
					resizeThumb();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				log.error("errore upload", e);
				addError("Upload", file.getFileName() + " errore nell'upload");
			}
			addInfo("Upload", file.getFileName() + " è stata caricata correttamente");
			imagesFile.add(fileResized);

		}
	}

	public void addThumb(ActionEvent e) {

		fileThumb = (String) e.getComponent().getAttributes().get("img");
		resizeThumb();

	}

	private void deleteFile(UploadedFile file) throws IOException {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();

		File result = new File(extContext.getRealPath(BASE_IMG_PATH + file.getFileName()));

		result.delete();
	}

	private String copyFile(UploadedFile file) throws IOException {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();

		// File result = new File(extContext.getRealPath(BASE_IMG_PATH +
		// file.getFileName()));

		// FileOutputStream fileOutputStream = new FileOutputStream(result);
		InputStream inputStream = file.getInputstream();

		// IOUtils.copy(inputStream, fileOutputStream);

		String fileResized = ResizeImageUtil.resizeAndCopyImage(inputStream, extContext.getRealPath(BASE_IMG_PATH),
				file.getFileName());

		return fileResized;

	}

	private void resizeThumb() {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();
		File result = new File(extContext.getRealPath(BASE_IMG_PATH + fileThumb));
		try {
			ResizeImageUtil.resizeImageThumb(result);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			addGenericError(e1, "Errore nel resize dell'immagine thumb");
		}
	}

	public void addNewBrand(ActionEvent e) {
		if (newBrand == null || newBrand.isEmpty()) {
			addError("Nuovo Brand", "inserire il brand");
			return;
		}
		try {
			OthalaFactory.getProductServiceInstance().insertBrand(getLang(), newBrand);
			getBeanApplication().resetDomain();
			addInfo("Nuovo Brand", "brand inserito correttamente");
			
			
		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del brand");
		}
	}
	
	public void addNewColor(ActionEvent e) {
		if (newColor == null || newColor.isEmpty()) {
			addError("Nuovo colore", "inserire il colore");
			return;
		}
		try {
			OthalaFactory.getProductServiceInstance().insertColor(getLang(), newColor);
			getBeanApplication().resetDomain();
			addInfo("Nuovo Colore", "colore inserito correttamente");
			
			
		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del colore");
		}
	}
	
	public void addNewType(ActionEvent e) {
		if (newType == null || newType.isEmpty()) {
			addError("Nuovo tipo", "inserire il tipo");
			return;
		}
		try {
			OthalaFactory.getProductServiceInstance().insertType(getLang(), newType);
			getBeanApplication().resetDomain();
			addInfo("Nuovo tipo", "tipo inserito correttamente");
			
			
		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del tipo");
		}
	}

}
