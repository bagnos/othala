package it.othala.merchant.view;

import it.othala.enums.TypeStateOrder;
import it.othala.merchant.model.MerchantBean;
import it.othala.model.LocaleManager;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.io.IOException;

import javax.faces.application.ConfigurableNavigationHandler;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;

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
		try {
			changeLocaleIT();
			if (getQueryStringParm("torna") == null || getQueryStringParm("spedito") != null
					|| getQueryStringParm("rimborsato") != null) {
				merchantBean.setOrdersCompleted(OthalaFactory.getOrderServiceInstance().getOrders(null, null,
						TypeStateOrder.COMPLETED, true));

				merchantBean.setOrdersPending(OthalaFactory.getOrderServiceInstance().getOrders(null, null,
						TypeStateOrder.PENDING, true));

				merchantBean.setRefoundRequest(OthalaFactory.getOrderServiceInstance().getRefounds(null, null, null,
						TypeStateOrder.REQUEST_REFOUND, null, "R"));

				merchantBean.setChangeRequest(OthalaFactory.getOrderServiceInstance().getRefounds(null, null, null,
						TypeStateOrder.REQUEST_CHANGE, null, "C"));

				merchantBean.setOrderSelected(null);

				merchantBean.setRefoundSelected(null);
			}
		} catch (Exception e) {
			addGenericError(e, "errore inizializzazione merchant home");
		}
		return null;
	}

	public void selectRightClick(org.primefaces.event.SelectEvent e) {
		Integer idOrder = (Integer) e.getComponent().getAttributes().get("idOrder");

	}

	public void onRowSelectNavigate(SelectEvent event) {
		// FacesContext.getCurrentInstance().getExternalContext().getFlash().put("selectedCar",
		// event.getObject());

		// FacesContext.getCurrentInstance().getExternalContext().redirect("dettaglioOrdine.xhtml?home=true");
		ConfigurableNavigationHandler configurableNavigationHandler = (ConfigurableNavigationHandler) FacesContext
				.getCurrentInstance().getApplication().getNavigationHandler();
		configurableNavigationHandler.performNavigation("dettaglioOrdine.xhtml?home=true");

	}

	public void onRowSelectNavigateReso(SelectEvent event) {
		// FacesContext.getCurrentInstance().getExternalContext().getFlash().put("selectedCar",
		// event.getObject());

		// FacesContext.getCurrentInstance().getExternalContext().redirect("detailMerchantRequest.xhtml?home=true");
		ConfigurableNavigationHandler configurableNavigationHandler = (ConfigurableNavigationHandler) FacesContext
				.getCurrentInstance().getApplication().getNavigationHandler();
		configurableNavigationHandler.performNavigation("detailMerchantRequest.xhtml?home=true");
		merchantBean.setChange(false);

	}

	public void onRowSelectNavigateChange(SelectEvent event) {
		// FacesContext.getCurrentInstance().getExternalContext().getFlash().put("selectedCar",
		// event.getObject());

		// FacesContext.getCurrentInstance().getExternalContext().redirect("detailMerchantRequest.xhtml?home=true");
		ConfigurableNavigationHandler configurableNavigationHandler = (ConfigurableNavigationHandler) FacesContext
				.getCurrentInstance().getApplication().getNavigationHandler();
		configurableNavigationHandler.performNavigation("detailMerchantRequest.xhtml?home=true");
		merchantBean.setChange(true);

	}

}
