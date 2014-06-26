package it.othala.merchant.view;

import it.othala.dto.OrderFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
public class HomeMerchantView extends BaseView{
	
	private List<OrderFullDTO> ordersCompleted;
	private List<OrderFullDTO> ordersPending;

	public List<OrderFullDTO> getOrdersPending() {
		return ordersPending;
	}

	public List<OrderFullDTO> getOrdersCompleted() {
		return ordersCompleted;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub
		ordersCompleted= OthalaFactory.getOrderServiceInstance().getOrders(null, null, TypeStateOrder.COMPLETED.getState());
		ordersPending= OthalaFactory.getOrderServiceInstance().getOrders(null, null, TypeStateOrder.PENDING.getState());
		return null;
	}

	
}
