package it.othala.merchant.view;

import it.othala.dto.AttributeDTO;
import it.othala.dto.CampaignDTO;
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
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;

import org.primefaces.context.RequestContext;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class RicercaCampagneView extends BaseView {

	/**
	 * 
	 */

	private Integer idCampaign;
	private List<CampaignDTO> campaigns;
	private List<CampaignDTO> selectCampaigns;
	private boolean details;
	private boolean modify;
	private CampaignDTO selectCampaign;
	private List<ProductFullNewDTO> prdCampaign;
	private List<ProductFullNewDTO> prdToRemove;

	public List<ProductFullNewDTO> getPrdToRemove() {
		return prdToRemove;
	}

	public void setPrdToRemove(List<ProductFullNewDTO> prdToRemove) {
		this.prdToRemove = prdToRemove;
	}

	public List<ProductFullNewDTO> getPrdCampaign() {
		return prdCampaign;
	}

	public CampaignDTO getSelectCampaign() {
		return selectCampaign;
	}

	public boolean isDetails() {
		return details;
	}

	public void setDetails(boolean details) {
		this.details = details;
	}

	public boolean isModify() {
		return modify;
	}

	public void setModify(boolean modify) {
		this.modify = modify;
	}

	public List<CampaignDTO> getSelectCampaigns() {
		return selectCampaigns;
	}

	public void setSelectCampaigns(List<CampaignDTO> selectCampaigns) {
		this.selectCampaigns = selectCampaigns;
	}

	public List<CampaignDTO> getCampaigns() {
		return campaigns;
	}

	public Integer getIdCampaign() {
		return idCampaign;
	}

	public void setIdCampaign(Integer idCampaign) {
		this.idCampaign = idCampaign;
	}

	private CampaignDTO campaignDTO = new CampaignDTO();

	public CampaignDTO getCampaignDTO() {
		return campaignDTO;
	}

	private static final long serialVersionUID = 1L;

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		try {
			campaigns = OthalaFactory.getProductServiceInstance().getListCampaign();
		} catch (Exception e) {
			// TODO: handle exception
			addGenericError(e, "errore inizializzazione campagne");
		}

		return null;
	}

	public void detailCampagna(ActionEvent e) {
		details = true;
		modify = false;
		selectCampaign = selectCampaigns.get(0);
		updateProdutcCampaigns();
		RequestContext.getCurrentInstance().execute("PF('campaign').show();");

	}

	public void eliminaCampagna(ActionEvent e) {
		if (selectCampaigns != null) {
			for (CampaignDTO c : selectCampaigns) {
				OthalaFactory.getProductServiceInstance().deleteCampaign(c);
			}
		}
		campaigns = OthalaFactory.getProductServiceInstance().getListCampaign();
		selectCampaigns.clear();
		getBeanApplication().resetDomain();
		addInfo("Elimina Campagna", "Operazione eseguita correttamente");
	}

	public void modifyCampagna(ActionEvent e) {
		modify = true;
		details = false;
		selectCampaign = selectCampaigns.get(0);
		updateProdutcCampaigns();
		getBeanApplication().resetDomain();
		RequestContext.getCurrentInstance().execute("PF('campaign').show();");

	}

	private void updateProdutcCampaigns() {
		prdCampaign = OthalaFactory
				.getProductServiceInstance()
				.getListProduct(getLang(), null, null, null, null, null, null, null, null, 1,
						selectCampaign.getIdCampaign(), true).getProdotti();
	}

	public void conferma(ActionEvent e) {
		try {
			List<Integer> idPrds = new ArrayList<>();
			if (prdToRemove != null)
			{
			for (ProductFullNewDTO prd : prdToRemove) {
				idPrds.add(prd.getIdProduct());
			}
			}

			OthalaFactory.getProductServiceInstance().updateCampaign(selectCampaign, idPrds);
			getBeanApplication().resetDomain();
			addInfo("Modifica Campagna", "Operazione eseguita correttamente");
			RequestContext.getCurrentInstance().execute("PF('campaign').hide();");

		} catch (Exception ex) {
			addGenericError(ex, "errore nell'aggiornamento della campagna");
		}
	}

}
