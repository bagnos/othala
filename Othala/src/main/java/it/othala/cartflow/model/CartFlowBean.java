package it.othala.cartflow.model;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.ProductDTO;
import it.othala.dto.ProductFullDTO;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.SessionScoped;
import javax.faces.event.ActionEvent;
import javax.inject.Named;

@Named
// @javax.faces.flow.FlowScoped("cartFlow")
@SessionScoped
/* @ManagedBean */
public class CartFlowBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ProductDTO detailProduct;
	private List<String> breadCrumb = new ArrayList<>();
	private ProductFullDTO detailProductFull;
	private DeliveryAddressDTO addressFat;
	private DeliveryAddressDTO addressSpe;
	private ArticleFullDTO articleSel;
	private List<ArticleFullDTO> cart;
	private int idPayment;
	private Catalog catalog;
	private boolean checkoutCart;
	private BigDecimal totalPriceOrder;
	

	public void deleteArticol(ActionEvent e)
	{
		ArticleFullDTO art=(ArticleFullDTO) e.getComponent().getAttributes().get("art");
		getCart().remove(art);
		
	}
	
	public BigDecimal getTotalPriceOrder() {
		totalPriceOrder=BigDecimal.ZERO;
		if (cart!=null)
		{
			for (ArticleFullDTO art:cart)
			{
				totalPriceOrder=totalPriceOrder.add(art.getTotalPriced());
			}
		}
		return totalPriceOrder;
	}

	public boolean isCheckoutCart() {
		return checkoutCart;
	}

	public void setCheckoutCart(boolean checkoutCart) {
		this.checkoutCart = checkoutCart;
	}

	public Catalog getCatalog() {
		if (catalog == null) {
			catalog = new Catalog();
		}
		return catalog;
	}

	public DeliveryAddressDTO getAddressFat() {
		if (addressFat == null) {
			addressFat = new DeliveryAddressDTO();
		}
		return addressFat;
	}

	public DeliveryAddressDTO getAddressSpe() {
		if (addressSpe == null) {
			addressSpe = new DeliveryAddressDTO();
		}
		return addressSpe;
	}

	public int getIdPayment() {
		return idPayment;
	}

	public void setIdPayment(int idPayment) {
		this.idPayment = idPayment;
	}

	public List<ArticleFullDTO> getCart() {
		if (cart == null) {
			cart = new ArrayList<>();
		}
		return cart;
	}

	public ArticleFullDTO getArticleSel() {
		return articleSel;
	}

	public void setArticleSel(ArticleFullDTO articleSel) {
		this.articleSel = articleSel;
	}

	public ProductFullDTO getDetailProductFull() {
		return detailProductFull;
	}

	public void setDetailProductFull(ProductFullDTO detailProductFull) {
		this.detailProductFull = detailProductFull;
	}

	public List<String> getBreadCrumb() {
		return breadCrumb;
	}

	public ProductDTO getDetailProduct() {
		return detailProduct;
	}

	public void setDetailProduct(ProductDTO detailProduct) {
		this.detailProduct = detailProduct;
	}

}
