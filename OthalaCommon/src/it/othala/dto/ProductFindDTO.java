package it.othala.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.util.List;

public class ProductFindDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private List<String> listTxBarcode; /* ok */

	private Integer idProductState;/* ok */
	private String txProductState;/* ok */
	
	private List <ShopDTO> listShop; /* ok */
	

		private BigDecimal imPrice; /* price */
	
	private Date dtProductstate; /* ok */
		




	public List<String> getListTxBarcode() {
		return listTxBarcode;
	}

	public void setListTxBarcode(List<String> listTxBarcode) {
		this.listTxBarcode = listTxBarcode;
	}

	public Integer getIdProductState() {
		return idProductState;
	}

	public void setIdProductState(Integer idProductState) {
		this.idProductState = idProductState;
	}

	public String getTxProductState() {
		return txProductState;
	}

	public void setTxProductState(String txProductState) {
		this.txProductState = txProductState;
	}

	public List<ShopDTO> getListShop() {
		return listShop;
	}

	public void setListShop(List<ShopDTO> listShop) {
		this.listShop = listShop;
	}

	
	
	public Date getDtProductstate() {
		return dtProductstate;
	}

	public void setDtProductstate(Date dtProductstate) {
		this.dtProductstate = dtProductstate;
	}

	
	public BigDecimal getImPrice() {
		return imPrice;
	}

	public void setImPrice(BigDecimal imPrice) {
		this.imPrice = imPrice;
	}

	
	


}
