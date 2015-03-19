package it.othala.dto;

import java.io.Serializable;
import java.util.List;

public class DomainDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<AttributeDTO> size;
	private List<AttributeDTO> color;
	private List<AttributeDTO> brand;
	private List<AttributeDTO> gender;
	private List<AttributeDTO> material;
	private List<AttributeDTO> type;
	private List<ShopDTO> shop;
	private List<AttributeDTO> statesOrder;
	private List<AttributeDTO> statesProduct;
	private List<NazioniDTO> nazioni;
	private List<ConfigurationDTO> configuration;
	private List<RegioneDTO> regioni;
	private List<AttributeDTO> infAggiuntive;
	private List<MenuDTO> menu;
	private MenuFullDTO menuFull;
	private List<MenuDTO> menuProducts = null;
	private List<MenuDTO> menuServices = null;
	private List<ArticleCashedDTO> articleCashed=null;
	private List<ProductFullNewDTO> articleNewArrivals=null;	
	private List<HashtagDTO> hashtag;
	
	public List<ProductFullNewDTO> getArticleNewArrivals() {
		return articleNewArrivals;
	}

	public void setArticleNewArrivals(List<ProductFullNewDTO> articleNewArrivals) {
		this.articleNewArrivals = articleNewArrivals;
	}

	public List<ArticleCashedDTO> getArticleCashed() {
		return articleCashed;
	}

	public void setArticleCashed(List<ArticleCashedDTO> articleCashed) {
		this.articleCashed = articleCashed;
	}

	public List<MenuDTO> getMenuProducts() {
		return menuProducts;
	}

	public void setMenuProducts(List<MenuDTO> menuProducts) {
		this.menuProducts = menuProducts;
	}

	public List<MenuDTO> getMenuServices() {
		return menuServices;
	}

	public void setMenuServices(List<MenuDTO> menuServices) {
		this.menuServices = menuServices;
	}

	public MenuFullDTO getMenuFull() {
		return menuFull;
	}

	public void setMenuFull(MenuFullDTO menuFull) {
		this.menuFull = menuFull;
	}

	public List<MenuDTO> getMenu() {
		return menu;
	}

	public void setMenu(List<MenuDTO> menu) {
		this.menu = menu;
	}

	public List<AttributeDTO> getStatesProduct() {
		return statesProduct;
	}

	public void setStatesProduct(List<AttributeDTO> statesProduct) {
		this.statesProduct = statesProduct;
	}

	public List<AttributeDTO> getSize() {
		return size;
	}

	public void setSize(List<AttributeDTO> size) {
		this.size = size;
	}

	public List<AttributeDTO> getColor() {
		return color;
	}

	public void setColor(List<AttributeDTO> color) {
		this.color = color;
	}

	public List<AttributeDTO> getBrand() {
		return brand;
	}

	public void setBrand(List<AttributeDTO> brand) {
		this.brand = brand;
	}

	public List<AttributeDTO> getGender() {
		return gender;
	}

	public void setGender(List<AttributeDTO> gender) {
		this.gender = gender;
	}

	public List<AttributeDTO> getType() {
		return type;
	}

	public void setType(List<AttributeDTO> type) {
		this.type = type;
	}

	public List<ShopDTO> getShop() {
		return shop;
	}

	public void setShop(List<ShopDTO> shop) {
		this.shop = shop;
	}

	public List<AttributeDTO> getStatesOrder() {
		return statesOrder;
	}

	public void setStatesOrder(List<AttributeDTO> statesOrder) {
		this.statesOrder = statesOrder;
	}

	public List<AttributeDTO> getMaterial() {
		return material;
	}

	public void setMaterial(List<AttributeDTO> material) {
		this.material = material;
	}

	public List<NazioniDTO> getNazioni() {
		return nazioni;
	}

	public void setNazioni(List<NazioniDTO> nazioni) {
		this.nazioni = nazioni;
	}

	public List<ConfigurationDTO> getConfiguration() {
		return configuration;
	}

	public void setConfiguration(List<ConfigurationDTO> configuration) {
		this.configuration = configuration;
	}

	public List<RegioneDTO> getRegioni() {
		return regioni;
	}

	public void setRegioni(List<RegioneDTO> regioni) {
		this.regioni = regioni;
	}

	public List<AttributeDTO> getInfAggiuntive() {
		return infAggiuntive;
	}

	public void setInfAggiuntive(List<AttributeDTO> infAggiuntive) {
		this.infAggiuntive = infAggiuntive;
	}

	public List<HashtagDTO> getHashtag() {
		return hashtag;
	}

	public void setHashtag(List<HashtagDTO> hashtag) {
		this.hashtag = hashtag;
	}

}
