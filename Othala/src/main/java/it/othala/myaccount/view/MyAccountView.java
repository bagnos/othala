package it.othala.myaccount.view;

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
		// orders = OthalaFactory.getOrderServiceInstance().getOrders(null,
		// loginBean.getEmail(), null);

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
		cart.getCart().clear();
		cart.setAddressFat(null);
		cart.setAddressSpe(null);
		cart.setArticleSel(null);
		cart.setDeliveryCost(null);
		cart.setDetailProduct(null);
		cart.setDetailProductFull(null);
		cart.setIdPayment(0);
		cart.setIdTypeDelivery(0);

		redirectHome();

	}

	

}
