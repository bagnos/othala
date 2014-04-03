package it.othala.cartflow.view;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.ArticleFullDTO;
import it.othala.view.BaseView;

import java.math.BigDecimal;

import javax.faces.event.ActionEvent;
import javax.inject.Inject;
import javax.inject.Named;

@Named
@javax.faces.view.ViewScoped
public class CartSelected3View extends BaseView {

	@Inject
	private CartFlowBean flowBean;
	private BigDecimal totalPrice = BigDecimal.ZERO;

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public CartFlowBean getFlowBean() {
		return flowBean;
	}

	public void setFlowBean(CartFlowBean flowBean) {
		this.flowBean = flowBean;
	}

	public String doInit() {
		// TODO Auto-generated method stub
		totalPrice=BigDecimal.ZERO;
		for (ArticleFullDTO art : flowBean.getCart()) {
			totalPrice = art.getPrdFullDTO().getRealPrice().add(totalPrice);

		}

		return null;
	}
	
	public void deleteArticol(ActionEvent e)
	{
		ArticleFullDTO art=(ArticleFullDTO) e.getComponent().getAttributes().get("art");
		flowBean.getCart().remove(art);
		doInit();
	}

}
