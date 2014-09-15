package it.othala.merchant.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.ProductFindDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.merchant.model.MerchantBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ResizeImageUtil;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class ScaricaProdottoView extends BaseView {

	private String idBarcode;
	private ProductFindDTO prdSelected;
	private List<ProductFindDTO> prdFounded;

	public List<ProductFindDTO> getPrdFounded() {
		return prdFounded;
	}

	public void setPrdFounded(List<ProductFindDTO> prdFounded) {
		this.prdFounded = prdFounded;
	}

	public void setPrdSelected(ProductFindDTO prdSelected) {
		this.prdSelected = prdSelected;
	}

	public ProductFindDTO getPrdSelected() {
		return prdSelected;
	}

	public String getIdBarcode() {
		return idBarcode;
	}

	public void setIdBarcode(String idBarcode) {
		this.idBarcode = idBarcode;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		prdFounded = new ArrayList<>();
		return null;
	}

	public void scarica(ActionEvent e) {
		try {
			// OthalaFactory.getProductServiceInstance().downloadArticle(idBarcode);
			List<String> idBarcodes = new ArrayList<>();
			if (prdFounded != null && !prdFounded.isEmpty()) {
				for (ProductFindDTO prd : prdFounded) {

					idBarcodes.addAll(prd.getListTxBarcode());
				}
				OthalaFactory.getProductServiceInstance().downloadArticle(idBarcodes);
				prdFounded.clear();
			} else {
				addError("Scarico prodotto", "nessun prodotto selezionato");
			}

			addInfo("Scarico prodotto", "Operazione eseguita correttamente");
		} catch (Exception ex) {
			addGenericError(ex, "errore nella cancellazione del prodotto");
		}
	}

	public void rimuoviProdotto(ActionEvent e) {
		prdFounded.remove(prdSelected);
	}

	public void cercaProdottoPerBarcode(ActionEvent e) {
		try {
			// OthalaFactory.getProductServiceInstance().downloadArticle(idBarcode);
			// addInfo("Scarico prodotto", "Operazione eseguita correttamente");
			List<ProductFindDTO> products = OthalaFactory.getProductServiceInstance().listFindProduct(idBarcode, null,
					null, null, null, null, null, null, null, null, null);
			if (products != null && !products.isEmpty()) {
				List<String> txBarcodeToDelete = null;

				// un prodottto può avere uno o più articoli e quindi barcode,
				// elimino quelli diversi dal barcode cercato
				for (ProductFindDTO prd : products) {
					txBarcodeToDelete = new ArrayList<>();
					for (String txBarcode : prd.getListTxBarcode()) {
						if (!txBarcode.equalsIgnoreCase(idBarcode)) {
							txBarcodeToDelete.add(txBarcode);
						}
					}
					prd.getListTxBarcode().removeAll(txBarcodeToDelete);
				}
				prdFounded.addAll(products);
				
			} else {
				addError("Scarico prodotto", "prodotto con barcode " + idBarcode + " non presente");
			}
			idBarcode="";
		} catch (Exception ex) {
			addGenericError(ex, "errore nella cancellazione del prodotto");
		}
	}

}
