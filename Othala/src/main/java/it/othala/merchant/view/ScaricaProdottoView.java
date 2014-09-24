package it.othala.merchant.view;

import it.othala.dto.ProductFullNewDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

@ManagedBean
@ViewScoped
public class ScaricaProdottoView extends BaseView {

	private String idBarcode;
	private ProductFullNewDTO prdSelected;
	private List<ProductFullNewDTO> prdFounded;

	public List<ProductFullNewDTO> getPrdFounded() {
		return prdFounded;
	}

	public void setPrdFounded(List<ProductFullNewDTO> prdFounded) {
		this.prdFounded = prdFounded;
	}

	public void setPrdSelected(ProductFullNewDTO prdSelected) {
		this.prdSelected = prdSelected;
	}

	public ProductFullNewDTO getPrdSelected() {
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

		prdFounded = new ArrayList<>();

		return null;
	}

	public void scarica(ActionEvent e) {
		try {

			List<String> idBarcodes = new ArrayList<>();
			if (prdFounded != null && !prdFounded.isEmpty()) {
				for (ProductFullNewDTO prd : prdFounded) {

					idBarcodes.add(prd.getArticles().get(0).getTxBarCode());
				}
				OthalaFactory.getProductServiceInstance().downloadArticle(
						idBarcodes);
				prdFounded.clear();
			} else {
				addError("Scarico prodotto", "nessun prodotto selezionato");
			}

			addInfo("Scarico prodotto", "Operazione eseguita correttamente");
		} catch (Exception ex) {
			addGenericError(ex, "errore nello scarico del prodotto");
		}
	}

	public void rimuoviProdotto(ActionEvent e) {
		prdFounded.remove(prdSelected);
	}

	public void cercaProdottoPerBarcode(ActionEvent e) {
		try {

			if (idBarcode != "") {
				ProductFullNewDTO products = OthalaFactory
						.getProductServiceInstance().listFindBarcode(idBarcode);

				prdFounded.add(products);

				idBarcode = "";
			}
		} catch (Exception ex) {
			addGenericError(ex, "errore nella ricerca del prodotto");
		}
	}

}
