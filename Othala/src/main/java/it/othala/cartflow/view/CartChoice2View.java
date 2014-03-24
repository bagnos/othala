package it.othala.cartflow.view;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;
import it.othala.view.BaseView;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.inject.Named;

@Named
@javax.faces.view.ViewScoped
public class CartChoice2View extends BaseView {

	@Inject
	private CartFlowBean flowBean;

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
		
		//ProductFullDTO prdFull=OthalaFactory.getProductServiceInstance().getProductFull(getLang(), idProduct);
				ProductFullDTO prdFull=new ProductFullDTO();
				prdFull.setImagesUrl(new ArrayList<String>());
				prdFull.getImagesUrl().add(flowBean.getDetailProduct().getImagesUrl());
				prdFull.getImagesUrl().add(flowBean.getDetailProduct().getImagesUrl());
				prdFull.getImagesUrl().add(flowBean.getDetailProduct().getImagesUrl());
				prdFull.getImagesUrl().add(flowBean.getDetailProduct().getImagesUrl());
				prdFull.getImagesUrl().add(flowBean.getDetailProduct().getImagesUrl());
				prdFull.getImagesUrl().add(flowBean.getDetailProduct().getImagesUrl());
				prdFull.getImagesUrl().add(flowBean.getDetailProduct().getImagesUrl());
				
				flowBean.setDetailProductFull(prdFull);


		return null;
	}

}
