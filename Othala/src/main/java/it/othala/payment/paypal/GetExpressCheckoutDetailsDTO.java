package it.othala.payment.paypal;

import it.othala.dto.DeliveryAddressDTO;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class GetExpressCheckoutDetailsDTO extends PayPalResponseDTO {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String custom;
	private String payerid;

	
	private String lastname;
	private String firstname;
	private String email;
	private BigDecimal amount;
	private  List<ItemCartDTO> shoppingCartOrder;
	private DeliveryAddressDTO shippingAddress;
	
	
	
	
	public DeliveryAddressDTO getShippingAddress() {
		if (shippingAddress==null)
		{
			shippingAddress=new DeliveryAddressDTO();
		}
		return shippingAddress;
	}
	public List<ItemCartDTO> getShoppingCartOrder() {
		if (shoppingCartOrder==null)
		{
			shoppingCartOrder=new ArrayList<>();
		}
		return shoppingCartOrder;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getCustom() {
		return custom;
	}
	public void setCustom(String custom) {
		this.custom = custom;
	}
	public String getPayerid() {
		return payerid;
	}
	public void setPayerid(String payerid) {
		this.payerid = payerid;
	}	
	
	
	
}
