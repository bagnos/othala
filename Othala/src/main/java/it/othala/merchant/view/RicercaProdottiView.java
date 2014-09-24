package it.othala.merchant.view;

import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.ShopDTO;
import it.othala.enums.TypeStateProduct;
import it.othala.merchant.model.MerchantBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ResizeImageUtil;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class RicercaProdottiView extends BaseView {

	/**
	 * 
	 */

	@ManagedProperty(value = "#{merchantBean}")
	private MerchantBean merchantBean;

	public MerchantBean getMerchantBean() {
		return merchantBean;
	}

	public void setMerchantBean(MerchantBean merchantBean) {
		this.merchantBean = merchantBean;
	}

	private final int SCROLL_WIDTH_AUTOCOMPLETE = 100;

	public int getSCROLL_WIDTH_AUTOCOMPLETE() {
		return SCROLL_WIDTH_AUTOCOMPLETE;
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
		// stato prodotti a -1
		if (getQueryStringParm("torna") == null) {
			merchantBean.setStateProduct(null);
			merchantBean.setProducts(null);
		}
		if (merchantBean.getMaxPrice() == 0) {
			merchantBean.setMaxPrice(5000);
		}

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

			merchantBean.findProduct();
		} catch (Exception ex) {
			addGenericError(ex, "errore ricerca prodotti");
		}
	}

	public void eliminaProdotto(ActionEvent e) {
		int del = 0;
		try {

			if (merchantBean.getSelectedProducts() != null) {
				for (ProductFullNewDTO prd : merchantBean.getSelectedProducts()) {

					List<String> imageToDelete = OthalaFactory.getProductServiceInstance().deleteProduct(
							prd.getIdProduct());
					ResizeImageUtil.deleteImages(imageToDelete);
					del++;
				}
				addInfo("Eliminazione Prodotto",
						String.format("operazione eseguita correttamente, eliminati  %d prodotti", del));
				findProducts(null);
				merchantBean.setSelectedProducts(null);
			} else {
				addError("Eliminazione Prodotto", "nessun prodotto selezionato");
			}

		} catch (Exception ex) {
			addGenericError(ex,
					String.format("errore durante la cancellazione del prodotto, eliminati  %d prodotti", del));

		}
		if (del > 0) {
			findProducts(null);
		}
		
	}

	public void pubblicaProdotto(ActionEvent e) {
		try {
		
			List<Integer> idPrds = new ArrayList<>();
			for (ProductFullNewDTO prd : merchantBean.getSelectedProducts()) {
				if (prd.getIdProductState() == TypeStateProduct.INSERITO.getState()) {
					idPrds.add(prd.getIdProduct());
				}

			}
			if (idPrds != null && idPrds.size() > 0) {
				OthalaFactory.getProductServiceInstance().publishProduct(idPrds);

				addInfo("Pubblicazione Prodotto",
						String.format("operazione eseguita correttamente, pubblicati  %d prodotti", idPrds.size()));
				findProducts(null);
			} else {
				addError("Pubblicazione Prodotto", "nessun prodotto selezionato");
			}
			merchantBean.setSelectedProducts(null);
		} catch (Exception ex) {
			addGenericError(ex, "errore nella Pubblicazione del prodotto");
		}
	}

}
