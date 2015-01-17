package it.othala.cartflow.view;

import it.othala.dto.ArticleCashedDTO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.VetrinaDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
public class HomeView extends BaseView {

	private List<ArticleCashedDTO> articleCached;
	private List<ProductFullNewDTO> articleNewArrivals;

	
	public List<ProductFullNewDTO> getArticleNewArrivals() {
		return articleNewArrivals;
	}

	public List<ArticleCashedDTO> getArticleCached() {
		return articleCached;
	}

	public void setArticleCached(List<ArticleCashedDTO> articleCached) {
		this.articleCached = articleCached;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		articleCached = OthalaFactory.getProductServiceInstance().listArticleMajorCashed(getLang());
		VetrinaDTO vetrina = OthalaFactory.getProductServiceInstance().getListProduct(getLang(), null, null, null,
				null, null, null, null, true, 0, null, false);
		articleNewArrivals=vetrina.getProdotti();
		return null;
	}
}
