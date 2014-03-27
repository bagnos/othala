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

import org.apache.xmlbeans.impl.common.IdentityConstraint.IdState;

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

		changeSize();

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
		sizeItems.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseSize")));
		for (ArticleFullDTO art : prdFull.getArticles()) {
			sizeItems.add(new SelectItem(art.getIdSize(), art.getTxSize()));
		}

		colorItems = new ArrayList<>();
		colorItems.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseColor")));
		for (ArticleFullDTO art : prdFull.getArticles()) {
			boolean found = false;
			for (SelectItem item : colorItems) {
				if (item.getValue().toString().equalsIgnoreCase(art.getTxColor())) {
					found = true;
					break;
				}
			}
			if (!found) {
				colorItems.add(new SelectItem(art.getIdColor(), art.getTxColor()));

			}

		}

		return null;
	}

	public void changeSize() {
		if (idSize != null && idSize.intValue() != -1) {
			colorItems = new ArrayList<>();
			colorItems.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseColor")));
			for (ArticleFullDTO art : prdFull.getArticles()) {
				if (art.getIdSize().intValue() == idSize.intValue())
					colorItems.add(new SelectItem(art.getTxColor(), art.getTxColor()));
			}
		}
	}
}
