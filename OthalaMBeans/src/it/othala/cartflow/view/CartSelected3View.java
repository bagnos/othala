package it.othala.cartflow.view;

import it.othala.dto.ArticleFullDTO;
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
		try
		{
		totalPrice = BigDecimal.ZERO;
		getCartFlowBean().setCheckoutCart(false);
		for (ArticleFullDTO art : getCartFlowBean().getCart()) {
			totalPrice = art.getPriceDiscounted().add(totalPrice);

		}
		if (getCartFlowBean().getDeliveryCost()!=null && getCartFlowBean().getDeliveryCost().getImportoSpese()!=null)
		{
			totalPrice=totalPrice.add(getCartFlowBean().getDeliveryCost().getImportoSpese());
		}

		getCartFlowBean().setTotalPriceOrder(totalPrice);
		}
		catch (Exception e)
		{
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
