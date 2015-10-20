package it.othala.cartflow.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.view.BaseView;

import java.math.BigDecimal;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ActionEvent;

/*@Named
 @javax.faces.view.ViewScoped*/
@ManagedBean
@ViewScoped
public class CartSelected3View extends BaseView {

	private BigDecimal totalPrice = BigDecimal.ZERO;

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public String doInit() {
		// TODO Auto-generated method stub
		try {
			DeliveryCostDTO delCost = new DeliveryCostDTO();
			delCost.setImportoSpese(new BigDecimal(0));
			
			getCartFlowBean().setDeliveryCost(null);
			getCartFlowBean().setTotalPriceOrdeNoDiscount(null);
			getCartFlowBean().setTotalPriceOrder(null);
			getCartFlowBean().setAmtDiscount(null);
			getCartFlowBean().setCoupon(null);
			getCartFlowBean().setPcScontoCoupon(0);
			getCartFlowBean().setPcScontoFidelity(0);
			
			
			
			
			calcolaPrezzoCarrello();
		} catch (Exception e) {
			addGenericError(e, "errore initr carello");
		}

		return null;
	}

	public void deleteArticol(ActionEvent e) {
		ArticleFullDTO art = (ArticleFullDTO) e.getComponent().getAttributes().get("art");
		getCartFlowBean().getCart().remove(art);
		doInit();
	}

}
