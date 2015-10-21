package it.othala.merchant.view;

import it.othala.dto.ArticleCashedDTO;
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

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;

import org.primefaces.context.RequestContext;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class RicercaProdottiView extends BaseView {

	/**
	 * 
	 */

	@ManagedProperty(value = "#{merchantBean}")
	private MerchantBean merchantBean;
	private boolean addToCampaign;
	private List<SelectItem> listCampaigns;
	private UploadedFile file;
	private Integer idCampaign;
	List<CampaignDTO> campaigns;
	private CampaignDTO campaignDTO = new CampaignDTO();

	public Integer getIdCampaign() {
		return idCampaign;
	}

	public void setIdCampaign(Integer idCampaign) {
		this.idCampaign = idCampaign;
	}

	public UploadedFile getFile() {
		return file;
	}

	public void setFile(UploadedFile file) {
		this.file = file;
	}

	public CampaignDTO getCampaignDTO() {
		return campaignDTO;
	}

	public List<SelectItem> getListCampaigns() {
		return listCampaigns;
	}

	public boolean isAddToCampaign() {
		return addToCampaign;
	}

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

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		DomainDTO dom = getBeanApplication().getDomain();
		// stato prodotti a -1
		if (getQueryStringParm("torna") == null) {
			merchantBean.setStateProduct(null);
			merchantBean.setProducts(null);
			merchantBean.setSelectedProducts(null);
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
			if (merchantBean.getDtBegin() != null) {
				if (merchantBean.getDtEnd() == null) {
					addError("Date finale errata", "inserire la data");
				}
			}
			if (merchantBean.getDtEnd() != null) {
				if (merchantBean.getDtBegin() == null) {
					addError("Date iniziale errata", "inserire la data");
				}
			}
			merchantBean.findProduct();
		} catch (Exception ex) {
			addGenericError(ex, "errore ricerca prodotti");
		}
	}

	
	
			
			
			public void modificaProdotto(ActionEvent e) {

		try {

			if (merchantBean.getSelectedProducts() != null
					&& merchantBean.getSelectedProducts().size() == 1) {

				if (merchantBean.getSelectedProducts().get(0).getTyProduct() == 1) {
					FacesContext
							.getCurrentInstance()
							.getExternalContext()
							.redirect(
									"insertProdotti2.xhtml?faces-redirect=true&detail=true&mod=true");

				} else {
					FacesContext
							.getCurrentInstance()
							.getExternalContext()
							.redirect(
									"insertProdotti.xhtml?faces-redirect=true&detail=true&mod=true");

				}
			}
		} catch (IOException ex) {
			// TODO Auto-generated catch block
			addGenericError(ex, "errore redirect dettaglio prodotto");
		}

	}
	
	
	public void vediProdotto(ActionEvent e) {

		try {

			if (merchantBean.getSelectedProducts() != null
					&& merchantBean.getSelectedProducts().size() == 1) {

				if (merchantBean.getSelectedProducts().get(0).getTyProduct() == 1) {
					FacesContext
							.getCurrentInstance()
							.getExternalContext()
							.redirect(
									"insertProdotti2.xhtml?faces-redirect=true&detail=true&read=true");

				} else {
					FacesContext
							.getCurrentInstance()
							.getExternalContext()
							.redirect(
									"insertProdotti.xhtml?faces-redirect=true&detail=true&read=true");

				}
			}
		} catch (IOException ex) {
			// TODO Auto-generated catch block
			addGenericError(ex, "errore redirect dettaglio prodotto");
		}

	}

	public void eliminaProdotto(ActionEvent e) {
		int del = 0;
		try {

			if (merchantBean.getSelectedProducts() != null) {
				for (ProductFullNewDTO prd : merchantBean.getSelectedProducts()) {

					List<String> imageToDelete = OthalaFactory
							.getProductServiceInstance().deleteProduct(
									prd.getIdProduct());
					ResizeImageUtil.deleteImages(imageToDelete);
					del++;
				}
				addInfo("Eliminazione Prodotto",
						String.format(
								"operazione eseguita correttamente, eliminati  %d prodotti",
								del));
				getBeanApplication().resetDomain();
				findProducts(null);
				merchantBean.setSelectedProducts(null);
			} else {
				addError("Eliminazione Prodotto", "nessun prodotto selezionato");
			}

		} catch (Exception ex) {
			addGenericError(
					ex,
					String.format(
							"errore durante la cancellazione del prodotto, eliminati  %d prodotti",
							del));

		}
		if (del > 0) {
			findProducts(null);
		}

	}

	public void pubblicaProdotto(ActionEvent e) {
		try {

			List<Integer> idPrds = new ArrayList<>();
			for (ProductFullNewDTO prd : merchantBean.getSelectedProducts()) {
				if (prd.getIdProductState() == TypeStateProduct.INSERITO
						.getState()) {
					idPrds.add(prd.getIdProduct());
				}

			}
			if (idPrds != null && idPrds.size() > 0) {
				OthalaFactory.getProductServiceInstance()
						.publishProduct(idPrds);

				addInfo("Pubblicazione Prodotto",
						String.format(
								"operazione eseguita correttamente, pubblicati  %d prodotti",
								idPrds.size()));
				getBeanApplication().resetDomain();
				findProducts(null);

			} else {
				addError("Pubblicazione Prodotto",
						"nessun prodotto selezionato");
			}
			merchantBean.setSelectedProducts(null);
		} catch (Exception ex) {
			addGenericError(ex, "errore nella Pubblicazione del prodotto");
		}
	}

	public void creaCampagna(ActionEvent e) {
		String opCampagna = addToCampaign == false ? "Creazione Campagna"
				: "Modifica Campagna";
		try {

			if (campaignDTO.getDtInizio().compareTo(campaignDTO.getDtFine()) >= 0) {
				addError("Campagna",
						"data inizione deve essere inferiore a data fine");
				return;
			}

			List<Integer> idPrds = new ArrayList<>();
			for (ProductFullNewDTO prd : merchantBean.getSelectedProducts()) {

				idPrds.add(prd.getIdProduct());

			}
			if (idPrds != null && idPrds.size() > 0) {
				if (!addToCampaign) {
					OthalaFactory.getProductServiceInstance().insertCampaign(
							campaignDTO, idPrds);
				} else {
					OthalaFactory.getProductServiceInstance()
							.addProductToCampaign(idPrds,
									campaignDTO.getIdCampaign());
				}
				addInfo(opCampagna,
						String.format("operazione eseguita correttamente"));

			} else {
				addError(opCampagna, "nessun prodotto selezionato");
			}
			getBeanApplication().resetDomain();
			merchantBean.setSelectedProducts(null);
		} catch (Exception ex) {
			addGenericError(ex, "errore nella " + opCampagna + " del prodotto");
		}
	}

	public void showCreaCampagna(ActionEvent e) {
		campaignDTO = new CampaignDTO();
		campaignDTO.setPcSconto(1);

		addToCampaign = false;
		RequestContext.getCurrentInstance()
				.execute("PF('newCampaign').show();");

	}

	public void showAddCampagna(ActionEvent e) {
		campaignDTO = null;

		addToCampaign = false;
		campaigns = OthalaFactory.getProductServiceInstance().getListCampaign();
		listCampaigns = new ArrayList<SelectItem>();
		for (CampaignDTO c : campaigns) {
			listCampaigns.add(new SelectItem(c.getIdCampaign(), c
					.getTxCampaign()));
		}
		if (listCampaigns.isEmpty()) {
			addError("Aggiungi a Campagna", "Nessuna campagna presente");
		} else {
			addToCampaign = true;
			RequestContext.getCurrentInstance().execute(
					"PF('newCampaign').show();");
		}
	}

	public void campaignChange(AjaxBehaviorEvent e) {
		for (CampaignDTO item : campaigns) {
			if (item.getIdCampaign().intValue() == idCampaign.intValue()) {
				campaignDTO = item;
				break;
			}
		}
	}

}
