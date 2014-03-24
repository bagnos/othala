package it.othala.cartflow.view;

import javax.faces.bean.RequestScoped;
import javax.inject.Named;

@Named
@RequestScoped
public class CartFlowView0 {

	public String preInit() {
		return "cart-flow-1?redirect=true";
	}

}
