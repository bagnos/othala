package it.othala.merchant.view;

import it.othala.dto.ArticleCashedDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
public class IncassiView extends BaseView{

	private List<ArticleCashedDTO> listAriclesCashed=new ArrayList<>();
	private BigDecimal imArticlesChached=BigDecimal.ZERO;
	
	public BigDecimal getImArticlesChached() {
		return imArticlesChached;
	}

	public List<ArticleCashedDTO> getListAriclesCashed() {
		return listAriclesCashed;
	}
	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		listAriclesCashed = OthalaFactory.getProductServiceInstance().listArticleCashed();
		for (ArticleCashedDTO art:listAriclesCashed)
		{
			imArticlesChached=imArticlesChached.add(art.getImCashed());
		}
		return null;
	}
}
