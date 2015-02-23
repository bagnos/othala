package it.othala.cartflow.view;

import it.othala.dto.VetrinaDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
public class HomeView extends BaseView {

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		log.info("Access Site");
		if (getCartFlowBean().getArticleCashed() == null) {
			getCartFlowBean().setArticleCashed(
					OthalaFactory.getProductServiceInstance().listArticleMajorCashed(getLang()));
		}
		VetrinaDTO vetrina = OthalaFactory.getProductServiceInstance().getListProduct(getLang(), null, null, null,
				null, null, null, null, true, 0, null, false);
		if (getCartFlowBean().getArticleNewArrivals() == null) {
			getCartFlowBean().setArticleNewArrivals(vetrina.getProdotti());
		}
		return null;
	}
}
