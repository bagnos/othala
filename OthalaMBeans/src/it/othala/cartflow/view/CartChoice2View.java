package it.othala.cartflow.view;

import it.othala.dto.ArticleFullDTO;
import it.othala.dto.ProductFullNewDTO;
import it.othala.service.factory.OthalaFactory;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;

/*@Named
 @javax.faces.view.ViewScoped*/
@ManagedBean
@ViewScoped
public class CartChoice2View extends BaseView {

	private List<SelectItem> sizeItems;
	private List<SelectItem> colorItems;
	private ProductFullNewDTO prdFull;
	private Integer idSize;
	private Integer idColor;
	private Integer qtaArticle;
	private Integer min;
	private Integer max;
	private ArticleFullDTO artSel;
	private String priceStr;
	private String priceDiscountedStr;
	private Boolean disponibile;
	private Boolean nondisponibile;
	private String txSize;
	private String txColor;
	private boolean renderSize;
	private String seoDescriptionIT;
	private String seoDescriptionEN;
	private String seoDescription;
	private String txType;
	private String txDescription;
	
	private String custom1;
	private String custom2;
	
	

	public String getCustom1() {
		return custom1;
	}



	public void setCustom1(String custom1) {
		this.custom1 = custom1;
	}



	public String getCustom2() {
		return custom2;
	}



	public void setCustom2(String custom2) {
		this.custom2 = custom2;
	}



	public String getTxType() {
		return txType;
	}

	

	public String getSeoDescription() {
		return seoDescription;
	}

	public String getSeoDescriptionIT() {
		return seoDescriptionIT;
	}

	public String getSeoDescriptionEN() {
		return seoDescriptionEN;
	}

	public boolean isRenderSize() {
		return renderSize;
	}

	public String getTxColor() {
		return txColor;
	}

	public String getTxSize() {
		return txSize;
	}

	public String getPriceStr() {
		return priceStr;
	}

	public String getPriceDiscountedStr() {
		return priceDiscountedStr;
	}

	public Integer getMin() {

		return min;
	}

	public void setMin(Integer min) {
		this.min = min;
	}

	public Integer getMax() {
		return max;
	}

	public void setMax(Integer max) {
		this.max = max;
	}

	public Integer getQtaArticle() {
		return qtaArticle;
	}

	public void setQtaArticle(Integer qtaArticle) {
		this.qtaArticle = qtaArticle;
	}

	public Integer getIdColor() {
		return idColor;
	}

	public void setIdColor(Integer idColor) {
		this.idColor = idColor;
	}

	public Integer getIdSize() {
		return idSize;
	}

	public void setIdSize(Integer idSize) {
		this.idSize = idSize;
	}

	public List<SelectItem> getColorItems() {

		return colorItems;
	}

	public List<SelectItem> getSizeItems() {
		return sizeItems;
	}

	private Integer idProduct;

	public Integer getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(Integer idProduct) {
		this.idProduct = idProduct;
	}

	public String doInit() {
		// TODO Auto-generated method stub
		try {
			changeLocale();
			getCartFlowBean().setUrlReferer(getRequest().getHeader("referer"));

			if (idProduct == null) {
				addError("Scelta prodotto", "nessun prodotto selezionato");
				return null;
			}

			for (ProductFullNewDTO p : getCartFlowBean().getCatalog().getArticlesPage()) {
				if (p.getIdProduct().intValue() == idProduct.intValue()) {
					getCartFlowBean().setDetailProduct(p);
					break;
				}
			}

			// inserita it per il crawler di fb che si presenta in use non trova
			// il prodotto
			
			
			prdFull = OthalaFactory.getProductServiceInstance().getProductFull(getLocalManager().getLanguage(),
					idProduct, false);
			getCartFlowBean().setDetailProductFull(prdFull);

			if (prdFull == null) {
				addError("Scelta prodotto", "nessun prodotto selezionato con id=" + idProduct);
				return null;
			}

			seoDescriptionIT = prdFull.getDescription().length() > 40 ? prdFull.getDescription().substring(0, 39)
					: prdFull.getDescription();
			seoDescriptionIT=seoDescriptionIT.toLowerCase().replace("/", "");

			seoDescriptionEN = prdFull.getDescriptionEN().length() > 40 ? prdFull.getDescriptionEN().substring(0, 39)
					: prdFull.getDescriptionEN();
			seoDescriptionEN=seoDescriptionEN.toLowerCase().replace("/", "");
			if (getLang().equalsIgnoreCase("it")) {
				seoDescription = seoDescriptionIT;
				
				
			} else {
				seoDescription = seoDescriptionEN;
				
			}

			priceStr = getCartFlowBean().getDetailProductFull().getRealPrice().setScale(2, RoundingMode.HALF_UP)
					.toString();

			priceDiscountedStr = null;
			if (getCartFlowBean().getDetailProductFull().getPriceDiscounted() != null
					&& getCartFlowBean().getDetailProductFull().getPriceDiscounted().compareTo(BigDecimal.ZERO) > 0
					&& getCartFlowBean().getDetailProductFull().getPriceDiscounted()
							.compareTo(getCartFlowBean().getDetailProductFull().getPrice()) < 0) {
				priceDiscountedStr = getCartFlowBean().getDetailProductFull().getPriceDiscounted()
						.setScale(2, RoundingMode.HALF_UP).toString();
			}

			/*
			 * List<ProductCarouselDTO> carouselList = new
			 * ArrayList<ProductCarouselDTO>(); ProductCarouselDTO a = null; if
			 * (getCartFlowBean().getCatalog().getArticlesPage() != null) { for
			 * (int i = 0; i <=
			 * getCartFlowBean().getCatalog().getArticlesPage().size() - 1; i++)
			 * {
			 * 
			 * if (i % 4 == 0) { a = new ProductCarouselDTO(); ;
			 * carouselList.add(a);
			 * a.setProduct1(getCartFlowBean().getCatalog().
			 * getArticlesPage().get(i));
			 * 
			 * } else if (i % 4 == 1) {
			 * 
			 * a.setProduct2(getCartFlowBean().getCatalog().getArticlesPage().get
			 * (i));
			 * 
			 * } else if (i % 4 == 2) {
			 * 
			 * a.setProduct3(getCartFlowBean().getCatalog().getArticlesPage().get
			 * (i));
			 * 
			 * } else if (i % 4 == 3) {
			 * 
			 * a.setProduct4(getCartFlowBean().getCatalog().getArticlesPage().get
			 * (i));
			 * 
			 * }
			 * 
			 * } }
			 * 
			 * getCartFlowBean().setCarouselList(carouselList);
			 */

			sizeItems = new ArrayList<>();
			// sizeItems.add(new SelectItem(-1,
			// OthalaUtil.getWordBundle("catalog_chooseSize")));
			boolean foundSize = false;
			for (ArticleFullDTO art : prdFull.getArticles()) {
				foundSize = false;
				for (SelectItem s : sizeItems) {
					if (s.getValue().toString().equalsIgnoreCase(art.getIdSize().toString())) {
						foundSize = true;
						break;
					}

				}
				if (!foundSize) {
					sizeItems.add(new SelectItem(art.getIdSize(), art.getTxSize()));
				}
			}

			Integer qtArticle = 0;
			for (ArticleFullDTO art : prdFull.getArticles()) {
				qtArticle = qtArticle + art.getQtStock();
			}

			if (!prdFull.getIdProductState().equals(1) || qtArticle.equals(0)) {
				setDisponibile(false);
				setNondisponibile(true);
			} else {
				setDisponibile(true);
				setNondisponibile(false);
			}

			colorItems = new ArrayList<>();
			verifyNA();

			/*
			 * for (ArticleFullDTO art : prdFull.getArticles()) { boolean found
			 * = false; for (SelectItem item : colorItems) { if
			 * (item.getValue().toString().equalsIgnoreCase(art.getTxColor())) {
			 * found = true; break; } } if (!found) { colorItems.add(new
			 * SelectItem(art.getIdColor(), art.getTxColor()));
			 * 
			 * }
			 * 
			 * }
			 */

			return null;
		} catch (Exception e) {

			addGenericError(e, "errore inizializzazione scelta prodotto");
			return null;
		}
	}

	private void verifyNA() {
		renderSize = true;
		for (ArticleFullDTO art : prdFull.getArticles()) {
			if (art.getTxSize().equalsIgnoreCase("N/A")) {
				renderSize = false;
				artSel = art;
				qtaArticle = 1;
				idSize = art.getIdSize();
				min = 1;
				max = 1;
				idColor = art.getIdColor();
				art.setPrdFullDTO(prdFull);
			}
		}
	}

	public String goToCart() {
		if (custom1!=null && custom1.isEmpty()==false && custom2!=null && custom2.isEmpty()==false )
		{
			artSel.setCustom(getLocalManager().getWordBundle("catalog_custom_article")+  custom1+" "+custom2);
		}
		getCartFlowBean().getCart().add(artSel);
		artSel.setQtBooked(qtaArticle);
		redirectCart();
		return null;
	}

	public String goToCatalogo() {

		// url="http://"+getRequest().getServerName()+"/"+url;
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(getCartFlowBean().getUrlReferer());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.error("errore redirect go to catalog", e);
		}
		return null;
	}

	public String goToCheckout() {

		// url="http://"+getRequest().getServerName()+"/"+url;
		redirectCheckOut();
		return null;
	}

	public void changeSize(AjaxBehaviorEvent e) {
		if (idSize != null && idSize.intValue() != 0) {
			for (SelectItem s : sizeItems) {
				if (s.getValue().toString().equalsIgnoreCase(idSize.toString())) {
					txSize = s.getLabel();
					break;
				}
			}

			colorItems = new ArrayList<>();
			// colorItems.add(new SelectItem(-1,
			// OthalaUtil.getWordBundle("catalog_chooseColor")));
			for (ArticleFullDTO art : prdFull.getArticles()) {
				if (art.getIdSize().intValue() == idSize.intValue())
					colorItems.add(new SelectItem(art.getIdColor(), art.getTxColor()));
			}
		} else {
			colorItems = new ArrayList<>();
			// colorItems.add(new SelectItem(-1,
			// OthalaUtil.getWordBundle("catalog_chooseColor")));
		}
		idColor = 0;
		changeColor(null);
	}

	public void changeFormato(AjaxBehaviorEvent e) {
		if (idSize != null && idSize.intValue() != 0) {
			for (SelectItem s : sizeItems) {
				if (s.getValue().toString().equalsIgnoreCase(idSize.toString())) {
					txSize = s.getLabel();
					break;
				}
			}

			colorItems = new ArrayList<>();
			// colorItems.add(new SelectItem(-1,
			// OthalaUtil.getWordBundle("catalog_chooseColor")));
			for (ArticleFullDTO art : prdFull.getArticles()) {
				if (art.getIdSize().intValue() == idSize.intValue())
					idColor = art.getIdColor();
				colorItems.add(new SelectItem(art.getIdColor(), art.getTxColor()));
			}
		} else {
			colorItems = new ArrayList<>();
			// colorItems.add(new SelectItem(-1,
			// OthalaUtil.getWordBundle("catalog_chooseColor")));
		}
		idColor = 1;
		changeColor(null);
	}

	public void selectSize(ActionEvent e) {
		idSize = (Integer) e.getComponent().getAttributes().get("idSize");
		txSize = (String) e.getComponent().getAttributes().get("txSize");

		changeSize(null);
	}

	public void selectColor(ActionEvent e) {
		idColor = (Integer) e.getComponent().getAttributes().get("idColor");
		txColor = (String) e.getComponent().getAttributes().get("txColor");
		changeColor(null);
	}

	public void changeColor(AjaxBehaviorEvent e) {
		min = 0;
		max = 0;
		qtaArticle = 0;
		if (idSize != null && idSize.intValue() != 0) {
			if (idColor != null && idColor.intValue() != 0) {
				for (SelectItem s : colorItems) {
					if (s.getValue().toString().equalsIgnoreCase(idColor.toString())) {
						txColor = s.getLabel();
					}
				}
				for (ArticleFullDTO art : prdFull.getArticles()) {
					if (art.getIdSize().intValue() == idSize.intValue()
							&& art.getIdColor().intValue() == idColor.intValue())

						if (!getCartFlowBean().getCart().contains(art)) {
							if (art.getQtStock() > 0) {
								artSel = art;
								artSel.setPrdFullDTO(prdFull);
								min = 1;
								max = art.getQtStock();
								qtaArticle = 1;
								return;
							}
						} else {

							addError(null, OthalaUtil.getWordBundle("catalog_erroArticleIsPresent"));
							return;
						}
				}

			}

		}

	}

	public Boolean getDisponibile() {
		return disponibile;
	}

	public void setDisponibile(Boolean disponibile) {
		this.disponibile = disponibile;
	}

	public Boolean getNondisponibile() {
		return nondisponibile;
	}

	public void setNondisponibile(Boolean nondisponibile) {
		this.nondisponibile = nondisponibile;
	}

}
