package it.othala.cartflow.model;

import javax.faces.bean.ManagedBean;
import javax.faces.flow.FlowScoped;

@ManagedBean
@FlowScoped("cart-flow")
public class CartFlowBean {

	private Integer nrProducts;

	public void setNrProducts(Integer nrProducts) {
		this.nrProducts = nrProducts;
	}

	public Integer getNrProducts() {
		if (nrProducts==null)
		{
			nrProducts=0;
		}
		return nrProducts;
	}
}
