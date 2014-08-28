package it.othala.merchant.view;

import it.othala.dto.OrderFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.merchant.model.MerchantBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

@ManagedBean
@ViewScoped
public class GestioneOrdiniView extends BaseView {

	/**
	 * 
	 */

	private Integer idOrdine;
	private String status;
	private String cercaOrd=null;

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

	public void spedisciOrdine(ActionEvent e) {
		try {
			OthalaFactory.getOrderServiceInstance().updateStateOrder(merchantBean.getOrderSelected().getIdOrder(),
					merchantBean.getOrderSelected(), TypeStateOrder.SPEDITO);
			stampaBolla(null);
			merchantBean.getOrderSelected().setIdStato(TypeStateOrder.SPEDITO.getState());
			merchantBean.getOrderSelected().setTxStato(TypeStateOrder.SPEDITO.toString());
			merchantBean.getOrdersCompleted().clear();
			merchantBean.getOrdersPending().clear();
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
		merchantBean.setOrdersFounded(null);
		cercaOrd=getQueryStringParm("cercaOrd");
		return null;
	}
	
	public void findOrders(ActionEvent e)
	{
		TypeStateOrder stateOrder=null;
		
		
		if (merchantBean.getStatoOrdine()!=null)
		{
			stateOrder=TypeStateOrder.valueOf(merchantBean.getStatoOrdine().getAttributo());
		}
		List<OrderFullDTO> orders=OthalaFactory.getOrderServiceInstance().getOrders(merchantBean.getIdOrdine(), merchantBean.getUser()!=null && merchantBean.getUser().isEmpty()?null: merchantBean.getUser(), stateOrder);
		merchantBean.setOrdersFounded(orders);
		
		if (merchantBean.getIdOrdine()!=null && merchantBean.getIdOrdine().intValue()==0)
		{
			merchantBean.setIdOrdine(null);
		}
		merchantBean.setOrderSelected(null);
	}

}
