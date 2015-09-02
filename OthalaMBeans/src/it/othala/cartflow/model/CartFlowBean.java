package it.othala.cartflow.model;

import it.othala.dto.ArticleCashedDTO;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.BrandFullDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.DeliveryCostDTO;
import it.othala.dto.NazioniDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.web.utils.OthalaUtil;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

//@Named
// @javax.faces.flow.FlowScoped("cartFlow")
//@SessionScoped
@ManagedBean
@javax.faces.bean.SessionScoped
public class CartFlowBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ProductFullNewDTO detailProduct;
	private List<String> breadCrumb = new ArrayList<>();
	private ProductFullNewDTO detailProductFull;
	private DeliveryAddressDTO addressFat;
	private DeliveryAddressDTO addressSpe;
	private ArticleFullDTO articleSel;
	private List<ArticleFullDTO> cart;
	private int idPayment;
	private Catalog catalog;
	private boolean checkoutCart;
	private BigDecimal totalPriceOrder;
	
	private DeliveryCostDTO deliveryCost;
	private BigDecimal totalItemOrder;
	private int idTypeDelivery;
	private String fidelityCard;
	private String coupon;
	private List<NazioniDTO> nazioni;
	private List<SelectItem> colors = null;
	private List<SelectItem> brands = null;
	private List<SelectItem> sizes = null;
	private List<AttributeDTO> brandDTO = null;
	private List<AttributeDTO> colorDTO = null;
	private List<AttributeDTO> sizeDTO = null;
	private int pcScontoCoupon;
	private int pcScontoFidelity;	
	private BigDecimal amtDiscount;
	private BigDecimal totalPriceOrdeNoDiscount;
	private boolean singleProductCatalog;
	private List<BrandFullDTO> brandFullDTO;
	private String urlReferer;
	private DeliveryAddressDTO addressAnnSpe;
	
	
	public DeliveryAddressDTO getAddressAnnSpe() {
		return addressAnnSpe;
	}

	public void setAddressAnnSpe(DeliveryAddressDTO addressAnnSpe) {
		this.addressAnnSpe = addressAnnSpe;
	}

	public String getUrlReferer() {
		return urlReferer;
	}

	public void setUrlReferer(String urlReferer) {
		this.urlReferer = urlReferer;
	}

	public boolean isSingleProductCatalog() {
		return singleProductCatalog;
	}

	public void setSingleProductCatalog(boolean singleProductCatalog) {
		this.singleProductCatalog = singleProductCatalog;
	}

	public BigDecimal getTotalPriceOrdeNoDiscount() {
		return totalPriceOrdeNoDiscount;
	}

	public void setTotalPriceOrdeNoDiscount(BigDecimal totalPriceOrdeNoDiscount) {
		this.totalPriceOrdeNoDiscount = totalPriceOrdeNoDiscount;
	}

	public BigDecimal getTotalPriceOrder() {
		return totalPriceOrder;
	}

	public void setTotalPriceOrder(BigDecimal totalPriceOrder) {
		this.totalPriceOrder = totalPriceOrder;
	}

		
	public BigDecimal getAmtDiscount() {
		return amtDiscount;
	}

	public void setAmtDiscount(BigDecimal amtDiscount) {
		this.amtDiscount = amtDiscount;
	}

	public int getPcScontoCoupon() {
		return pcScontoCoupon;
	}

	public void setPcScontoCoupon(int pcScontoCoupon) {
		this.pcScontoCoupon = pcScontoCoupon;
	}

	public int getPcScontoFidelity() {
		return pcScontoFidelity;
	}

	public void setPcScontoFidelity(int pcScontoFidelity) {
		this.pcScontoFidelity = pcScontoFidelity;
	}

	public List<AttributeDTO> getColorDTO() {
		return colorDTO;
	}

	public void setColorDTO(List<AttributeDTO> colorDTO) {
		this.colorDTO = colorDTO;
	}

	public List<AttributeDTO> getSizeDTO() {
		return sizeDTO;
	}

	public void setSizeDTO(List<AttributeDTO> sizeDTO) {
		this.sizeDTO = sizeDTO;
	}

	public List<AttributeDTO> getBrandDTO() {
		return brandDTO;
	}

	public void setBrandDTO(List<AttributeDTO> brandDTO) {
		this.brandDTO = brandDTO;
	}

	public List<SelectItem> getBrands() {
		brands = new ArrayList<>();
		brands.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseBrand")));

		for (AttributeDTO att : brandDTO) {
			brands.add(new SelectItem(att.getAttributo(), att.getValore()));
		}

		return brands;
	}

	public List<SelectItem> getSizes() {

		sizes = new ArrayList<>();
		sizes.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseSize")));

		for (AttributeDTO att : sizeDTO) {
			sizes.add(new SelectItem(att.getAttributo(), att.getValore()));
		}

		return sizes;
	}

	public List<SelectItem> getColors() {

		colors = new ArrayList<>();
		colors.add(new SelectItem(-1, OthalaUtil.getWordBundle("catalog_chooseColor")));
		for (AttributeDTO att : colorDTO) {
			colors.add(new SelectItem(att.getAttributo(), att.getValore()));
		}
		return colors;
	}

	public String getFidelityCard() {
		return fidelityCard;
	}

	public void setFidelityCard(String fidelityCard) {
		this.fidelityCard = fidelityCard;
	}

	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}

	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}

	public int getIdTypeDelivery() {
		return idTypeDelivery;
	}

	public void setIdTypeDelivery(int idTypeDelivery) {
		this.idTypeDelivery = idTypeDelivery;
	}

	public BigDecimal getTotalItemOrder() {
		totalItemOrder = BigDecimal.ZERO;
		if (cart != null) {
			for (ArticleFullDTO art : cart) {
				totalItemOrder = totalItemOrder.add(art.getPriceDiscounted().multiply(new BigDecimal(art.getQtBooked())));
			}
		}

		return totalItemOrder;
	}

	public DeliveryCostDTO getDeliveryCost() {
		return deliveryCost;
	}

	public void setDeliveryCost(DeliveryCostDTO deliveryCost) {
		this.deliveryCost = deliveryCost;
	}

	public void setAddressFat(DeliveryAddressDTO addressFat) {
		this.addressFat = addressFat;
	}

	public void setAddressSpe(DeliveryAddressDTO addressSpe) {
		this.addressSpe = addressSpe;
	}
	
	

	public void deleteArticol(ActionEvent e) {
		ArticleFullDTO art = (ArticleFullDTO) e.getComponent().getAttributes().get("art");
		getCart().remove(art);

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

	public ProductFullNewDTO getDetailProductFull() {
		return detailProductFull;
	}

	public void setDetailProductFull(ProductFullNewDTO detailProductFull) {
		this.detailProductFull = detailProductFull;
	}

	public List<String> getBreadCrumb() {
		return breadCrumb;
	}

	public ProductFullNewDTO getDetailProduct() {
		return detailProduct;
	}

	public void setDetailProduct(ProductFullNewDTO detailProduct) {
		this.detailProduct = detailProduct;
	}



	public List<NazioniDTO> getNazioni() {
		return nazioni;
	}

	public void setNazioni(List<NazioniDTO> nazioni) {
		this.nazioni = nazioni;
	}

	public List<BrandFullDTO> getBrandFullDTO() {
		return brandFullDTO;
	}

	public void setBrandFullDTO(List<BrandFullDTO> brandFullDTO) {
		this.brandFullDTO = brandFullDTO;
	}

}
