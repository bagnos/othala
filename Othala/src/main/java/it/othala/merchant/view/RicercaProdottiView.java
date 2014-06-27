package it.othala.merchant.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.ProductFindDTO;
import it.othala.dto.ShopDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class RicercaProdottiView extends BaseView {

	/**
	 * 
	 */

	private AttributeDTO genere;
	private AttributeDTO tipo;
	private AttributeDTO brand;
	private BigDecimal prezzo;
	private String descrizione;
	private String negozio;
	private ShopDTO shop;
	private int idStato;
	private int minPrice;
	private int maxPrice;
	private List<ProductFindDTO> products;
	private List<ProductFindDTO> selectedProducts;

	private Date dtBegin;
	private Date dtEnd;

	public void setSelectedProducts(List<ProductFindDTO> selectedProducts) {
		this.selectedProducts = selectedProducts;
	}

	public Date getDtBegin() {
		return dtBegin;
	}

	public void setDtBegin(Date dtBegin) {
		this.dtBegin = dtBegin;
	}

	public Date getDtEnd() {
		return dtEnd;
	}

	public void setDtEnd(Date dtEnd) {
		this.dtEnd = dtEnd;
	}

	public List<ProductFindDTO> getSelectedProducts() {
		return selectedProducts;
	}

	public List<ProductFindDTO> getProducts() {
		return products;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public int getIdStato() {
		return idStato;
	}

	public void setIdStato(int idStato) {
		this.idStato = idStato;
	}

	private List<ArticleFullDTO> articles = new ArrayList<ArticleFullDTO>();

	private String merchantCode;

	public String getMerchantCode() {
		return merchantCode;
	}

	public void setMerchantCode(String merchantCode) {
		this.merchantCode = merchantCode;
	}

	public List<ArticleFullDTO> getArticles() {
		return articles;
	}

	private final int SCROLL_WIDTH_AUTOCOMPLETE = 100;

	public int getSCROLL_WIDTH_AUTOCOMPLETE() {
		return SCROLL_WIDTH_AUTOCOMPLETE;
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
		// DomainDTO dom = getBeanApplication().getDomain();

		return null;
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

	public List<ShopDTO> completeShops(String query) {
		return getAutoUtils().completeShops(query);
	}

	public void findProducts(ActionEvent e) {
		try {

			products = OthalaFactory.getProductServiceInstance().listFindProduct(merchantCode==null || merchantCode.isEmpty()?null:merchantCode, null,
					shop != null ? shop.getIdShop() : null, genere != null ? genere.getAttributo() : null,
					tipo != null ? tipo.getAttributo() : null, brand != null ? brand.getAttributo() : null,
					BigDecimal.valueOf(minPrice), BigDecimal.valueOf(maxPrice), descrizione, dtBegin, dtEnd);
		} catch (Exception ex) {
			addGenericError(ex, "errore ricerca prodotti");
		}
	}

}
