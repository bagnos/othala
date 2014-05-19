package it.othala.account.view;

import it.othala.account.model.CustomerLoginBean;
import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;

import java.util.List;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.inject.Inject;
import javax.inject.Named;

@Named
@javax.faces.view.ViewScoped
public class MyAccountView extends BaseView {

	@Inject
	private CustomerLoginBean loginBean;
	@Inject
	private CartFlowBean cart;

	private List<OrderFullDTO> orders;
	private DeliveryDTO addresses;
	
	private boolean editAddress;
	private boolean newAddress;
	private DeliveryAddressDTO address;
	private int idAddrSel;
	private OrderFullDTO order;
	private Boolean renderDetails;

	public Boolean getRenderDetails() {
		return renderDetails;
	}

	public OrderFullDTO getOrder() {
		return order;
	}

	public int getIdAddrSel() {
		return idAddrSel;
	}

	public void setIdAddrSel(int idAddrSel) {
		this.idAddrSel = idAddrSel;
	}

	public DeliveryAddressDTO getAddress() {
		if (address == null) {
			address = new DeliveryAddressDTO();
			address.setUserId(loginBean.getEmail());
		}
		return address;
	}

	public boolean isEditAddress() {
		return editAddress;
	}

	public boolean isNewAddress() {
		return newAddress;
	}

	
	public List<OrderFullDTO> getOrders() {
		return orders;
	}

	public DeliveryDTO getAddresses() {
		return addresses;
	}

	@Override
	public String doInit() {
		// TODO Auto-generated method stub

		addresses = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(loginBean.getEmail());
		orders = OthalaFactory.getOrderServiceInstance().getOrders(null, loginBean.getEmail(), null);
		renderDetails=false;

		return null;

	}

	public void selectAddr(AjaxBehaviorEvent e) {
		idAddrSel=Integer.valueOf(FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("idAddrSel"));
		for (DeliveryAddressDTO d : addresses.getIndirizzo()) {
			if (d.getIdAddress() == idAddrSel) {
				address = new DeliveryAddressDTO();
				address = d;
				editAddress = true;
				break;
			}
		}
	}
	
	public void selectOrder(AjaxBehaviorEvent e)
	{
		int idOrderSel=Integer.valueOf(FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("idOrderSel"));
		for (OrderFullDTO ord : orders) {
			if (ord.getIdOrder() == idOrderSel) {
				order=ord;
				renderDetails=true;
				break;
			}
		}
	}
	
	public void backToOrders(AjaxBehaviorEvent e)
	{
		renderDetails=false;
	}

	public void newAddr(ActionEvent e) {
		newAddress = true;
		address = new DeliveryAddressDTO();
		address.setNazione("Italia");
		address.setUserId(loginBean.getEmail());
	}

	public void saveAddr(AjaxBehaviorEvent ev) {

		if (newAddress) {
			// ho cliccato su nuovo
			OthalaFactory.getOrderServiceInstance().newAddress(address);
			newAddress = false;
		} else {
			// modifica
			OthalaFactory.getOrderServiceInstance().updateAddress(address, idAddrSel);
		}
		addresses = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(loginBean.getEmail());

		editAddress = false;
		newAddress = false;

	}

	public void annAddr(AjaxBehaviorEvent ev) {
		editAddress = false;
		newAddress = false;
	}

	public void clearCart(ActionEvent ex) {
		
		deleteCart(cart);
		redirectHome();

	}
	
	

	

}
