package it.othala.merchant.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.model.ApplicationBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;
import javax.inject.Named;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

@Named
@javax.faces.view.ViewScoped
public class InsertProdottiView extends BaseView {

	/**
	 * 
	 */

	@Inject
	private ApplicationBean appBean;

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
		DomainDTO dom = appBean.getDomain();
		qta = 1;
		return null;
	}

	public void addProduct(ActionEvent e) {
		try {
			if (articles.isEmpty())
			{
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
			addInfo("Prodotto", "inserimento effettuato correttamente");
		
			
		} catch (Exception ex) {
			addGenericError(ex, "errore nell'inserimento del prodotto");
		}

	}
	
	private void resetPrd()
	{		
		articles.clear();
		imagesFile.clear();
		merchantCode=null;
		prezzo=null;
		prezzoScontato=null;
		genere = null;
		tipo = null;
		sconto=0;
		brand=null;
		size=null;
		shop=null;
		fileThumb=null;
		descrizione=null;
		qta=1;
		color=null;
		
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
		List<AttributeDTO> allAttributeDTO = appBean.getGenderDTO();
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
			List<AttributeDTO> allSize = appBean.getSizesDTO(tipo.getAttributo().intValue());

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
		List<AttributeDTO> allBrands = appBean.getBrandDTO();
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
		List<ShopDTO> allShops = appBean.getShopsDTO();
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
		List<AttributeDTO> allColours = appBean.getColorsDTO();
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

		List<AttributeDTO> allType = appBean.getTypeDTO();
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

	public void removeThumbinal(ActionEvent e) {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();
		File file = new File(extContext.getRealPath(BASE_IMG_PATH + fileThumb));
		file.delete();
		fileThumb = null;
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
			fileThumb = null;
		}

		file.delete();

	}

	public void handleFileUpload(FileUploadEvent event) {
		UploadedFile file = event.getFile();
		if (file != null) {

			// verifica se il file � gi� presente
			if (imagesFile.contains(file.getFileName())) {
				addError("Upload", file.getFileName() + "gi� presente");
				return;
			}

			try {
				copyFile(file);
				if (fileThumb == null) {
					fileThumb = file.getFileName();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				log.error("errore upload", e);
				addError("Upload", file.getFileName() + " errore nell'upload");
			}
			addInfo("Upload", file.getFileName() + " � stata caricata correttamente");
			imagesFile.add(file.getFileName());

		}
	}

	public void handleFileUploadThumb(FileUploadEvent event) {
		UploadedFile file = event.getFile();
		if (file != null) {
			try {
				copyFile(file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				log.error("errore upload", e);
				addError("Upload", file.getFileName() + " errore nell'upload");
			}
			addInfo("Upload", file.getFileName() + " � stata caricata correttamente");
			fileThumb = file.getFileName();

		}
		// application code
	}

	public void addThumb(ActionEvent e) {

		fileThumb = (String) e.getComponent().getAttributes().get("img");

	}

	private void copyFile(UploadedFile file) throws IOException {
		ExternalContext extContext = FacesContext.getCurrentInstance().getExternalContext();

		File result = new File(extContext.getRealPath(BASE_IMG_PATH + file.getFileName()));

		FileOutputStream fileOutputStream = new FileOutputStream(result);

		byte[] buffer = new byte[2024];

		int bulk;

		InputStream inputStream = file.getInputstream();

		while (true) {

			bulk = inputStream.read(buffer);

			if (bulk < 0) {

				break;

			}

			fileOutputStream.write(buffer, 0, bulk);

			fileOutputStream.flush();

		}

		fileOutputStream.close();

		inputStream.close();

	}
}
