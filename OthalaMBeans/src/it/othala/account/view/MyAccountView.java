package it.othala.account.view;

import it.othala.account.model.MyAccountBean;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryDTO;
import it.othala.dto.FidelityCardDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.model.ApplicationBean;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.ConfigurationUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;

@ManagedBean
@ViewScoped
public class MyAccountView extends BaseView {

	private List<OrderFullDTO> orders;
	private DeliveryDTO addresses;

	private boolean editAddress;
	private boolean newAddress;
	private DeliveryAddressDTO address;
	private int idAddrSel;
	private OrderFullDTO order;
	private Boolean renderDetails;
	private List<FidelityCardDTO> listFidelity;
	private Boolean myAccountFidelity;
	private String emailFidelityRequest;
	private String cell;

	

	public String getCell() {
		return cell;
	}

	public void setCell(String cell) {
		this.cell = cell;
	}

	public String getEmailFidelityRequest() {
		return emailFidelityRequest;
	}

	public boolean isMyAccountFidelity() {
		return myAccountFidelity;
	}


	public List<FidelityCardDTO> getListFidelity() {
		return listFidelity;
	}

	@ManagedProperty(value = "#{myAccountBean}")
	private MyAccountBean myAccountBean;

	public MyAccountBean getMyAccountBean() {
		return myAccountBean;
	}

	public void setMyAccountBean(MyAccountBean myAccountBean) {
		this.myAccountBean = myAccountBean;
	}

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
			address.setUserId(getLoginBean().getEmail());
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
		try {

			addresses = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(getLoginBean().getEmail());

			renderDetails = false;

			getMyAccountBean().setNazioni(getBeanApplication().getDomain().getNazioni());

			getMyAccountBean().setNazioni(getBeanApplication().getDomain().getNazioni());

			listFidelity = OthalaFactory.getOrderServiceInstance().getFidelityCards(null, null, null,
					getLoginBean().getEmail());
			
			myAccountFidelity = Boolean
					.parseBoolean(ConfigurationUtil.getProperty("MyAccount_Fidelity") != null ? ConfigurationUtil
							.getProperty("MyAccount_Fidelity") : "false");
			emailFidelityRequest =ConfigurationUtil.getProperty("MyAccount_EmailFidelityRequest");

		} catch (Exception e) {
			addGenericError(e, "errore nella inizializzazione della myAccount");
		}
		return null;

	}

	public String doInitMyOrders() {
		// TODO Auto-generated method stub
		try {
			orders = OthalaFactory.getOrderServiceInstance().getOrders(null, getLoginBean().getEmail(), null, false);
			renderDetails = false;
		}

		catch (Exception e) {
			addGenericError(e, "errore nella inizializzazione dei miei ordini");
		}
		return null;

	}

	public String doInitMyReturns() {
		{
			return null;
		}
	}

	public void selectAddr(AjaxBehaviorEvent e) {
		idAddrSel = Integer.valueOf(FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap()
				.get("idAddrSel"));
		for (DeliveryAddressDTO d : addresses.getIndirizzo()) {
			if (d.getIdAddress() == idAddrSel) {
				address = new DeliveryAddressDTO();
				address = d;
				editAddress = true;
				break;
			}
		}
	}

	public void selectOrder(AjaxBehaviorEvent e) {
		int idOrderSel = Integer.valueOf(FacesContext.getCurrentInstance().getExternalContext()
				.getRequestParameterMap().get("idOrderSel"));
		for (OrderFullDTO ord : orders) {
			if (ord.getIdOrder() == idOrderSel) {
				order = ord;
				myAccountBean.setOrderSelected(order);
				renderDetails = true;
				break;
			}
		}
	}

	public void backToOrders(ActionEvent e) {
		renderDetails = false;
	}

	public void newAddr(ActionEvent e) {
		newAddress = true;
		address = new DeliveryAddressDTO();
		address.setNazione("ITALIA");
		address.setUserId(getLoginBean().getEmail());
	}

	public void saveAddr(AjaxBehaviorEvent ev) {
		try {

			if (newAddress) {
				// ho cliccato su nuovo
				OthalaFactory.getOrderServiceInstance().newAddress(address);
				newAddress = false;
			} else {
				// modifica
				OthalaFactory.getOrderServiceInstance().updateAddress(address, idAddrSel);
			}
			addresses = OthalaFactory.getOrderServiceInstance().getDeliveryInfo(getLoginBean().getEmail());

			editAddress = false;
			newAddress = false;
		} catch (Exception e) {
			addGenericError(e, "errore nell'inserimento dell'indirizzo");
		}

	}

	public void annAddr(AjaxBehaviorEvent ev) {
		editAddress = false;
		newAddress = false;
	}

	public void clearCart(ActionEvent ex) {

		deleteCart(getCartFlowBean());
		redirectHome();

	}

	public void richiediCarta(ActionEvent e) {
		try {
			cell="";
			if (addresses.getIndirizzo().isEmpty()==false)
			{
				cell=addresses.getIndirizzo().get(0).getTel();
			}
			OthalaFactory.getAccountServiceInstance().richiediFidelity(getLoginBean().getName(),
					getLoginBean().getSurname(), getLoginBean().getEmail(),cell,emailFidelityRequest,ConfigurationUtil.getProperty("DNS_SITE"),ConfigurationUtil.getMailProps(getRequest()));
			addInfo("Richiedi Fidelity",
					"La richiesta è stata inoltrata correttamente, tra qualche giorno sarà visibile nella sezione MyAccount");
		} catch (Exception ex) {
			addGenericError(ex, "errore richiesta fidelity");
		}
	}

}
