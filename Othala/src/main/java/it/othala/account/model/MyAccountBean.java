package it.othala.account.model;


import it.othala.dto.AccountDTO;
import it.othala.dto.OrderFullDTO;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/*@Named
@javax.enterprise.context.SessionScoped*/
@ManagedBean
@SessionScoped
public class MyAccountBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private OrderFullDTO orderSelected;
	public OrderFullDTO getOrderSelected() {
		return orderSelected;
	}
	public void setOrderSelected(OrderFullDTO orderSelected) {
		this.orderSelected = orderSelected;
	}
	
	
	
}
