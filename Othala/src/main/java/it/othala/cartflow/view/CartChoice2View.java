package it.othala.cartflow.view;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;
import javax.inject.Inject;
import javax.inject.Named;

@Named
@javax.faces.view.ViewScoped
public class CartChoice2View extends BaseView {

	@Inject
	private CartFlowBean flowBean;
	private List<SelectItem> sizeItems;
	private ArticleFullDTO articleSel;

	
	public ArticleFullDTO getArticleSel() {
		return articleSel;
	}

	public void setArticleSel(ArticleFullDTO articleSel) {
		this.articleSel = articleSel;
	}

	public List<SelectItem> getSizeItems() {
		return sizeItems;
	}

	public CartFlowBean getFlowBean() {
		return flowBean;
	}

	public void setFlowBean(CartFlowBean flowBean) {
		this.flowBean = flowBean;
	}

	private Integer idProduct;

	public Integer getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(Integer idProduct) {
		this.idProduct = idProduct;
	}

	public String doInit() {
		// TODO Auto-generated method stub

		for (ProductDTO p : flowBean.getArticlesPage()) {
			if (p.getIdProduct().intValue() == idProduct.intValue()) {
				flowBean.setDetailProduct(p);
				break;
			}
		}

		ProductFullDTO prdFull = OthalaFactory.getProductServiceInstance().getProductFull(getLang(), idProduct);

		flowBean.setDetailProductFull(prdFull);

		sizeItems = new ArrayList<>();
		sizeItems.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseSize")));
		for (ArticleFullDTO art : prdFull.getArticles()) {
			sizeItems.add(new SelectItem(art, art.getTxSize()));
		}

		return null;
	}
	
	

}
