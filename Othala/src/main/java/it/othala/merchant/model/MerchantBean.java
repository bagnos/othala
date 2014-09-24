package it.othala.merchant.model;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.AttributeDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.dto.RefoundFullDTO;
import it.othala.dto.ShopDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.service.factory.OthalaFactory;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.event.ActionEvent;

@ManagedBean
@SessionScoped
public class MerchantBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AttributeDTO genere;
	private AttributeDTO tipo;
	private AttributeDTO brand;
	private BigDecimal prezzo;
	private String descrizione;
	private String descrizioneEN;
	private String negozio;
	private ShopDTO shop;
	
	private int minPrice;
	private int maxPrice;
	private List<ProductFullNewDTO> products;
	private List<ProductFullNewDTO> selectedProducts;
	private Date dtBegin;
	private Date dtEnd;
	private OrderFullDTO orderSelected;

	private List<OrderFullDTO> ordersCompleted=null;
	private List<OrderFullDTO> ordersPending=null;
	
	
	/* dato per carca ordine*/
	private String user;
	private Integer idOrdine ;
	private String idTransazione;
	private List<OrderFullDTO> ordersFounded=null;
	private AttributeDTO statoOrdine;
	private AttributeDTO stateProduct;
	
	private List<RefoundFullDTO> refoundRequest=null;
	
	private RefoundFullDTO refoundSelected=null;
	

	public void setRefoundRequest(List<RefoundFullDTO> refoundRequest) {
		this.refoundRequest = refoundRequest;
	}



	
	public RefoundFullDTO getRefoundSelected() {
		return refoundSelected;
	}

	public void setRefoundSelected(RefoundFullDTO refoundSelected) {
		this.refoundSelected = refoundSelected;
	}

	public List<RefoundFullDTO> getRefoundRequest() {
		return refoundRequest;
	}

	public AttributeDTO getStateProduct() {
		return stateProduct;
	}

	public void setStateProduct(AttributeDTO stateProduct) {
		this.stateProduct = stateProduct;
	}

	public AttributeDTO getStatoOrdine() {
		return statoOrdine;
	}

	public void setStatoOrdine(AttributeDTO statoOrdine) {
		this.statoOrdine = statoOrdine;
	}

	public List<OrderFullDTO> getOrdersFounded() {
		return ordersFounded;
	}

	public void setOrdersFounded(List<OrderFullDTO> ordersFounded) {
		this.ordersFounded = ordersFounded;
	}

	public String getIdTransazione() {
		return idTransazione;
	}

	public void setIdTransazione(String idTransazione) {
		this.idTransazione = idTransazione;
	}

	public Integer getIdOrdine() {
		return idOrdine;
	}

	public void setIdOrdine(Integer idOrdine) {
		this.idOrdine = idOrdine;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setOrdersCompleted(List<OrderFullDTO> ordersCompleted) {
		this.ordersCompleted = ordersCompleted;
	}

	public void setOrdersPending(List<OrderFullDTO> ordersPending) {
		this.ordersPending = ordersPending;
	}

	public void setOrderSelected(OrderFullDTO orderSelected) {
		this.orderSelected = orderSelected;
	}

	public List<OrderFullDTO> getOrdersPending() {

		return ordersPending;
	}

	public List<OrderFullDTO> getOrdersCompleted() {

		return ordersCompleted;
	}

	public OrderFullDTO getOrderSelected() {

		return orderSelected;
	}

	public void setProducts(List<ProductFullNewDTO> products) {
		this.products = products;
	}

	public void setSelectedProducts(List<ProductFullNewDTO> selectedProducts) {
		this.selectedProducts = selectedProducts;
	}

	public Date getDtBegin() {
		return dtBegin;
	}

	public void setDtBegin(Date dtBegin) {
		this.dtBegin = dtBegin;
	}

	public Date getDtEnd() {
		return dtEnd;
	}

	public void setDtEnd(Date dtEnd) {
		this.dtEnd = dtEnd;
	}

	public List<ProductFullNewDTO> getSelectedProducts() {
		return selectedProducts;
	}

	public List<ProductFullNewDTO> getProducts() {
		return products;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	

	private List<ArticleFullDTO> articles = new ArrayList<ArticleFullDTO>();

	private String merchantCode;

	public String getMerchantCode() {
		return merchantCode;
	}

	public void setMerchantCode(String merchantCode) {
		this.merchantCode = merchantCode;
	}

	public List<ArticleFullDTO> getArticles() {
		return articles;
	}

	public ShopDTO getShop() {
		return shop;
	}

	public void setShop(ShopDTO shop) {
		this.shop = shop;
	}

	public String getNegozio() {
		return negozio;
	}

	public void setNegozio(String negozio) {
		this.negozio = negozio;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
	public String getDescrizioneEN() {
		return descrizioneEN;
	}

	public void setDescrizioneEN(String descrizioneEN) {
		this.descrizioneEN = descrizioneEN;
	}

	public BigDecimal getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(BigDecimal prezzo) {
		this.prezzo = prezzo;
	}

	public AttributeDTO getBrand() {
		return brand;
	}

	public void setBrand(AttributeDTO brand) {
		this.brand = brand;
	}

	public AttributeDTO getTipo() {
		return tipo;
	}

	public void setTipo(AttributeDTO tipo) {
		this.tipo = tipo;
	}

	public AttributeDTO getGenere() {
		return genere;
	}

	public void setGenere(AttributeDTO genere) {
		this.genere = genere;
	}

	public void findProduct() {
		products = OthalaFactory.getProductServiceInstance().listFindProduct(
				getMerchantCode() == null || getMerchantCode().isEmpty() ? null : getMerchantCode(),
				getStateProduct() == null ? null : getStateProduct().getAttributo(), getShop() != null ? getShop().getIdShop() : null,
				getGenere() != null ? getGenere().getAttributo() : null,
				getTipo() != null ? getTipo().getAttributo() : null,
				getBrand() != null ? getBrand().getAttributo() : null, BigDecimal.valueOf(getMinPrice()),
				BigDecimal.valueOf(getMaxPrice()), getDescrizione()!=null && getDescrizione().isEmpty()?null:getDescrizione(), getDtBegin(), getDtEnd());
	}
	
	public void findOrders(ActionEvent e) {
		TypeStateOrder stateOrder = null;
		List<OrderFullDTO> orders = null;
		
		

		if (getStatoOrdine() != null) {
			stateOrder = TypeStateOrder.valueOf(getStatoOrdine().getAttributo());
		}
		if (getIdTransazione() != null && !getIdTransazione().isEmpty()) {
			orders = OthalaFactory.getOrderServiceInstance().getOrders(null,
					null,
					null,getIdTransazione());
		} else  {
			orders = OthalaFactory.getOrderServiceInstance().getOrders(getIdOrdine(),
					getUser() != null && getUser().isEmpty() ? null : getUser(),
					stateOrder);
		}
		setOrdersFounded(orders);

		if (getIdOrdine() != null && getIdOrdine().intValue() == 0) {
			setIdOrdine(null);
		}
		setOrderSelected(null);
	}


}
