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
import javax.faces.event.AjaxBehaviorEvent;

@ManagedBean
@ViewScoped
public class HomeMerchantView extends BaseView {

	@ManagedProperty(value = "#{merchantBean}")
	private MerchantBean merchantBean;

	public void setMerchantBean(MerchantBean merchantBean) {
		this.merchantBean = merchantBean;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		
		
		if (getQueryStringParm("torna") == null || getQueryStringParm("spedito")!=null) {
			merchantBean.setOrdersCompleted(OthalaFactory.getOrderServiceInstance().getOrders(null, null,
					TypeStateOrder.COMPLETED));

			merchantBean.setOrdersPending(OthalaFactory.getOrderServiceInstance().getOrders(null, null,
					TypeStateOrder.PENDING));
			
			

			merchantBean.setOrderSelected(null);
			
			merchantBean.setRefoundSelected(null);
		}
		return null;
	}
	
	public void selectRightClick(org.primefaces.event.SelectEvent e)
	{
		Integer idOrder=(Integer) e.getComponent().getAttributes().get("idOrder");
		
	}

}
