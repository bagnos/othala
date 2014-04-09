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

import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;
import javax.inject.Inject;
import javax.inject.Named;

@Named
@javax.faces.view.ViewScoped
public class CartChoice2View extends BaseView {

	@Inject
	private CartFlowBean flowBean;
	private List<SelectItem> sizeItems;
	private List<SelectItem> colorItems;
	private ProductFullDTO prdFull;
	private Integer idSize;
	private Integer idColor;
	private Integer qtaArticle;
	private Integer min;
	private Integer max;
	private ArticleFullDTO artSel;

	public Integer getMin() {

		return min;
	}

	public void setMin(Integer min) {
		this.min = min;
	}

	public Integer getMax() {
		return max;
	}

	public void setMax(Integer max) {
		this.max = max;
	}

	public Integer getQtaArticle() {
		return qtaArticle;
	}

	public void setQtaArticle(Integer qtaArticle) {
		this.qtaArticle = qtaArticle;
	}

	public Integer getIdColor() {
		return idColor;
	}

	public void setIdColor(Integer idColor) {
		this.idColor = idColor;
	}

	public Integer getIdSize() {
		return idSize;
	}

	public void setIdSize(Integer idSize) {
		this.idSize = idSize;
	}

	public List<SelectItem> getColorItems() {

		return colorItems;
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

		prdFull = OthalaFactory.getProductServiceInstance().getProductFull(getLang(), idProduct);

		flowBean.setDetailProductFull(prdFull);

		sizeItems = new ArrayList<>();
		// sizeItems.add(new SelectItem(-1,
		// OthalaUtil.getWordBundle("catalog_chooseSize")));
		for (ArticleFullDTO art : prdFull.getArticles()) {
			sizeItems.add(new SelectItem(art.getIdSize(), art.getTxSize()));
		}

		colorItems = new ArrayList<>();
		
		/*
		 * for (ArticleFullDTO art : prdFull.getArticles()) { boolean found =
		 * false; for (SelectItem item : colorItems) { if
		 * (item.getValue().toString().equalsIgnoreCase(art.getTxColor())) {
		 * found = true; break; } } if (!found) { colorItems.add(new
		 * SelectItem(art.getIdColor(), art.getTxColor()));
		 * 
		 * }
		 * 
		 * }
		 */

		return null;
	}
	
	public String goToCart()
	{
		flowBean.getCart().add(artSel);
		artSel.setQtBooked(qtaArticle);
		return "cart-selected-3?faces-redirect=true";
	}

	public void changeSize(AjaxBehaviorEvent e) {
		if (idSize != null && idSize.intValue() != 0) {
			colorItems = new ArrayList<>();
			// colorItems.add(new SelectItem(-1,
			// OthalaUtil.getWordBundle("catalog_chooseColor")));
			for (ArticleFullDTO art : prdFull.getArticles()) {
				if (art.getIdSize().intValue() == idSize.intValue())
					colorItems.add(new SelectItem(art.getIdColor(), art.getTxColor()));
			}
		} else {
			colorItems = new ArrayList<>();
			// colorItems.add(new SelectItem(-1,
			// OthalaUtil.getWordBundle("catalog_chooseColor")));
		}
		idColor = 0;
		changeColor(null);
	}

	public void changeColor(AjaxBehaviorEvent e) {
		min = 0;
		max = 0;
		qtaArticle = 0;
		if (idSize != null && idSize.intValue() != 0) {
			if (idColor != null && idColor.intValue() != 0) {
				for (ArticleFullDTO art : prdFull.getArticles()) {
					if (art.getIdSize().intValue() == idSize.intValue()
							&& art.getIdColor().intValue() == idColor.intValue())

						if (!flowBean.getCart().contains(art)) {
							if (art.getQtStock() > 0) {
								artSel=art;	
								artSel.setPrdFullDTO(prdFull);								
								min = 1;
								max = art.getQtStock();
								qtaArticle = 1;
								return;
							}
						} else {

							addError(null, OthalaUtil.getWordBundle("catalog_erroArticleIsPresent"));
							return;
						}
				}

			}

		}

	}

}
