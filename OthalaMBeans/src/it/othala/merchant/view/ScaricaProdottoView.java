package it.othala.merchant.view;

import it.othala.dto.ArticleDTO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.execption.BarcodeNotPresentException;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

import org.primefaces.context.RequestContext;
import org.primefaces.event.SelectEvent;

@ManagedBean
@ViewScoped
public class ScaricaProdottoView extends BaseView {

	private String idBarcode;
	private ProductFullNewDTO prdSelected;
	private List<ProductFullNewDTO> prdFounded;
	private ArticleFullDTO articleSelected;

	public ArticleFullDTO getArticleSelected() {
		return articleSelected;
	}

	public void setArticleSelected(ArticleFullDTO articleSelected) {
		this.articleSelected = articleSelected;
	}

	private boolean carico;

	public boolean isCarico() {
		return carico;
	}

	public void setCarico(boolean carico) {
		this.carico = carico;
	}

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

			List<ArticleDTO> pgArticles = new ArrayList<>();
			ArticleDTO art = null;
			if (prdFounded != null && !prdFounded.isEmpty()) {
				for (ProductFullNewDTO prd : prdFounded) {
					art = new ArticleDTO();
					art.setIdProduct(prd.getIdProduct());
					art.setPgArticle(prd.getArticles().get(0).getPgArticle());
					pgArticles.add(art);
				}

				OthalaFactory.getProductServiceInstance().downloadArticle(
						pgArticles, !carico);

				prdFounded.clear();
			} else {
				addError("Scarico prodotto", "nessun prodotto selezionato");
			}
			if (carico) {
				addInfo("Carico prodotto", "Operazione eseguita correttamente");
			} else {
				addInfo("Scarico prodotto", "Operazione eseguita correttamente");
			}

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
				prdSelected = OthalaFactory.getProductServiceInstance()
						.listFindBarcode(idBarcode);

				if (prdSelected != null && prdSelected.getArticles() != null
						&& prdSelected.getArticles().size() == 1) {
					prdFounded.add(prdSelected);
					idBarcode = "";
				} else {
					// mostra dialog per la scelta dell'articolo
					RequestContext.getCurrentInstance().execute(
							"PF('artsProd').show();");

				}

			}
		} catch (BarcodeNotPresentException bex) {
			addOthalaExceptionError

			(bex, "barcode non presente");
		} catch (Exception ex) {
			addGenericError(ex, "errore nella ricerca del prodotto");
		}
	}

	public void onRowSelect(SelectEvent e) {
		prdSelected.getArticles().clear();
		prdSelected.getArticles().add(articleSelected);
		prdFounded.add(prdSelected);
		RequestContext.getCurrentInstance().execute("PF('artsProd').hide();");

	}

}
