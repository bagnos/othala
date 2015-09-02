package it.othala.merchant.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.external.service.FactoryExternalService;
import it.othala.external.service.interfaces.IOthalaExternalServices;
import it.othala.merchant.model.MerchantBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.io.IOException;
import java.util.List;

import javax.faces.application.ConfigurableNavigationHandler;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.primefaces.event.SelectEvent;

@ManagedBean
@ViewScoped
public class GestioneOrdiniView extends BaseView {

	/**
	 * 
	 */

	private Integer idOrdine;
	private String status;
	private String cercaOrd = null;

	public void setCercaOrd(String cercaOrd) {
		this.cercaOrd = cercaOrd;
	}

	public String getCercaOrd() {
		return cercaOrd;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getIdOrdine() {
		return idOrdine;
	}

	public void setIdOrdine(Integer idOrdine) {
		this.idOrdine = idOrdine;
	}

	@ManagedProperty(value = "#{merchantBean}")
	private MerchantBean merchantBean;

	public void setMerchantBean(MerchantBean merchantBean) {
		this.merchantBean = merchantBean;
	}

	public MerchantBean getMerchantBean() {
		return merchantBean;
	}
	
	
	
	public void findOrders(ActionEvent e)
	{
		merchantBean.findOrders(e);
	}

	public void spedisciOrdine(ActionEvent e) {
		try {
			OthalaFactory.getOrderServiceInstance().updateStateOrder(merchantBean.getOrderSelected().getIdOrder(),
					merchantBean.getOrderSelected(), TypeStateOrder.SPEDITO);
			stampaBolla(null);
			merchantBean.getOrderSelected().setIdStato(TypeStateOrder.SPEDITO.getState());
			merchantBean.getOrderSelected().setTxStato(TypeStateOrder.SPEDITO.toString());
			merchantBean.getOrdersCompleted().clear();
			merchantBean.getOrdersPending().clear();
			findOrders(null);
			addInfo("Spedizione Ordine", "Operazione eseguita correttamente");
		} catch (Exception ex) {
			addGenericError(ex, "errore eliminazione ordine");
		}
	}

	public void eliminaOrdine(ActionEvent e) {
		try {
			OthalaFactory.getOrderServiceInstance().updateStateOrder(merchantBean.getOrderSelected().getIdOrder(),
					merchantBean.getOrderSelected(), TypeStateOrder.ANNULLATO_DA_MERCHANT);
			merchantBean.getOrderSelected().setIdStato(TypeStateOrder.ANNULLATO_DA_MERCHANT.getState());
			merchantBean.getOrderSelected().setTxStato(TypeStateOrder.ANNULLATO_DA_MERCHANT.toString());
			merchantBean.getOrdersCompleted().clear();
			merchantBean.getOrdersPending().clear();
			findOrders(null);
			addInfo("Eliminazione Ordine", "Operazione eseguita correttamente");
		} catch (Exception ex) {
			addGenericError(ex, "errore eliminazione ordine");
		}
	}

	public void stampaBolla(ActionEvent e) {
	}
	
	

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		if (getQueryStringParm("spedito")!=null)
		{
			
			findOrders(null);
			return null;
		}
		
		cercaOrd = getQueryStringParm("cercaOrd");
		if (getQueryStringParm("torna")==null && cercaOrd==null && getQueryStringParm("home")==null)
		{
			//invocazione diretta, non rientro dal torna e non sto facendo il dettaglio di un ordine
			merchantBean.setOrdersFounded(null);
			merchantBean.setOrderSelected(null);
			merchantBean.setIdOrdine(null);
			merchantBean.setIdTransazione(null);
			merchantBean.setUser(null);
			merchantBean.setStatoOrdine(null);
		}
		return null;
	}
	

	/*
	public void onRowSelectNavigate(SelectEvent event) {
	
		try {
			//recuper il negozio tramite extService(es. degortes)
			IOthalaExternalServices extService= FactoryExternalService.getExternalService(getBeanApplication().getSito());
			for (ArticleFullDTO art:merchantBean.getOrderSelected().getCart())
			{
				ShopDTO shop= extService.getShopStock(art.getPrdFullDTO().getIdProduct(), art.getPgArticle(), art.getPrdFullDTO().getMerchantCode());
				art.setShop(shop);
			}
			
			FacesContext.getCurrentInstance().getExternalContext().redirect("dettaglioOrdine.xhtml?cercaOrd=true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}*/

}
