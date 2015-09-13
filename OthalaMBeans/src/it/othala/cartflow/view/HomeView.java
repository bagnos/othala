package it.othala.cartflow.view;

import java.io.IOException;

import it.othala.view.BaseView;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

@ManagedBean
@ViewScoped
public class HomeView extends BaseView {

	private String serchProduct;

	public String getSerchProduct() {
		return serchProduct;
	}

	public void setSerchProduct(String serchProduct) {
		this.serchProduct = serchProduct;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		log.info("Access Site");
		changeLocale();
		return null;
	}

	public void serchProductClick(ActionEvent e) {
		if (serchProduct != null && serchProduct.isEmpty() == false) {
			String url = getRequest().getContextPath()+"/cart/cart-catalog.xhtml?searchProduct=" + serchProduct;

			try {
				FacesContext.getCurrentInstance().getExternalContext().redirect(url);
			} catch (IOException ex) {
				// TODO Auto-generated catch block
				log.error("errore navigazione da search products", ex);
			}
		}
	}
}
