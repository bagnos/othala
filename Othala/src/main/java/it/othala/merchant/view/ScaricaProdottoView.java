package it.othala.merchant.view;

import it.othala.dto.AttributeDTO;
import it.othala.dto.DomainDTO;
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
	
	public String getIdBarcode() {
		return idBarcode;
	}

	public void setIdBarcode(String idBarcode) {
		this.idBarcode = idBarcode;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		
		return null;
	}

	
	public void scarica(ActionEvent e) {
		try {
			OthalaFactory.getProductServiceInstance().downloadArticle(idBarcode);
			addInfo("Scarico prodotto", "Operazione eseguita correttamente");
		} catch (Exception ex) {
			addGenericError(ex, "errore nella cancellazione del prodotto");
		}
	}

	
}
