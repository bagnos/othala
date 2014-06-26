package it.othala.merchant.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.ShopDTO;
import it.othala.view.BaseView;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

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

}
