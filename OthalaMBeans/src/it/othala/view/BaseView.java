package it.othala.view;

import it.othala.account.model.CustomerLoginBean;
import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.ArticleFullDTO;
import it.othala.dto.DeliveryAddressDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.execption.OthalaException;
import it.othala.model.ApplicationBean;
import it.othala.model.LocaleManager;
import it.othala.web.utils.AutoCompleteUtils;
import it.othala.web.utils.OthalaUtil;
import it.othala.web.utils.UAgentInfo;

import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ocpsoft.pretty.PrettyContext;

public abstract class BaseView implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String DEFAULT_LOCALE_DB = "it";

	/**
	 * dentro il content del .xhtml inserire {@code <f:metadata>
	 * <f:viewAction action="sampleView.doInit" /> </f:metadata>} il metodo
	 * doInit verr� inocato alla prima richesta sulla pagina, no postback di
	 * default. Pu� essere utilizzato per inizializzare la view.
	 * 
	 * @return
	 */
	protected static Log log = LogFactory.getLog(BaseView.class);
	private List<String> breadCrumb = new ArrayList<>();
	private AutoCompleteUtils autoUtils = null;
	private Boolean requestComingFromAMobileDevice = null;
	private String canonicalUrl;
	private String canonicalUrlLang;
	private String languageCanonical;

	public String getLanguageCanonical() {
		return languageCanonical;
	}

	public void setLanguageCanonical(String languageCanonical) {
		this.languageCanonical = languageCanonical;
	}

	public String getCanonicalUrlLang(String lang) {
		canonicalUrlLang = String.format("http://%s%s/%s/%s", FacesContext.getCurrentInstance().getExternalContext()

		.getRequestServerName(), FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath(), lang,
				PrettyContext.getCurrentInstance().getRequestURL().toURL());
		return canonicalUrlLang;
	}

	public String getCanonicalUrl() {
		canonicalUrl = String.format("http://%s%s%s", FacesContext.getCurrentInstance().getExternalContext()
				.getRequestServerName(),
				FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath(), PrettyContext
						.getCurrentInstance().getRequestURL().toURL());

		return canonicalUrl;
	}

	@ManagedProperty(value = "#{localeManager}")
	private LocaleManager localManager;

	public LocaleManager getLocalManager() {
		return localManager;
	}

	public void setLocalManager(LocaleManager localManager) {
		this.localManager = localManager;
	}

	public AutoCompleteUtils getAutoUtils() {
		if (autoUtils == null) {
			autoUtils = new AutoCompleteUtils(getBeanApplication(), localManager);
		}
		return autoUtils;
	}

	@ManagedProperty(value = "#{applicationBean}")
	// @Inject
	private ApplicationBean beanApplication;

	// @Inject
	@ManagedProperty(value = "#{customerLoginBean}")
	private CustomerLoginBean loginBean;

	// @Inject
	@ManagedProperty(value = "#{cartFlowBean}")
	private CartFlowBean cartFlowBean;

	public CartFlowBean getCartFlowBean() {
		return cartFlowBean;
	}

	public void setCartFlowBean(CartFlowBean cartFlowBean) {
		this.cartFlowBean = cartFlowBean;
	}

	public void setLoginBean(CustomerLoginBean loginBean) {
		this.loginBean = loginBean;
	}

	protected void changeLocaleIT() {
		if (!localManager.getLanguage().equalsIgnoreCase("it")) {
			localManager.changeLocale("it");
		}

	}

	public boolean getRequestComingFromAMobileDevice() {

		// http://www.hand-interactive.com/m/resources/detect-mobile-java.htm
		if (requestComingFromAMobileDevice == null) {
			HttpServletRequest request = getRequest();
			final String userAgent = request.getHeader("User-Agent");
			final String httpAccept = request.getHeader("Accept");

			final UAgentInfo detector = new UAgentInfo(userAgent, httpAccept);

			requestComingFromAMobileDevice = detector.detectMobileQuick();
		}
		return requestComingFromAMobileDevice;
	}

	public CustomerLoginBean getLoginBean() {
		return loginBean;
	}

	public void setBeanApplication(ApplicationBean beanApplication) {
		this.beanApplication = beanApplication;
	}

	public ApplicationBean getBeanApplication() {
		return beanApplication;
	}

	public abstract String doInit();

	public void addInfo(String summary, String message) {
		addInfo(summary, message, null);
	}

	public void addInfo(String summary, String message, String id) {
		FacesContext.getCurrentInstance()
				.addMessage(id, new FacesMessage(FacesMessage.SEVERITY_INFO, summary, message));
	}

	protected void changeLocale() {
		if (getLanguageCanonical() != null
				&& (getLanguageCanonical().contains("it") || getLanguageCanonical().contains("en"))) {
			getLocalManager().changeLocale(getLanguageCanonical());
		} 
	}

	public void addWarn(String summary, String message) {
		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_WARN, summary, message));
	}

	public void addError(String summary, String message) {
		summary = summary == null ? OthalaUtil.getWordBundle("validator_summary") : summary;
		log.warn(String.format("%s %s", summary,message));
		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, message));
	}

	public void addError(String id, String summary, String message) {
		summary = summary == null ? OthalaUtil.getWordBundle("validator_summary") : summary;
		FacesContext.getCurrentInstance().addMessage(id,
				new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, message));
	}

	public void addGenericError(Exception e, String dsErrorLog) {
		log.error(dsErrorLog, e);
		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_ERROR, OthalaUtil.getWordBundle("validator_summary"), OthalaUtil
						.getWordBundle("exception_base")));
	}

	public void addOthalaExceptionError(OthalaException e, String dsErrorLog) {
		log.error(dsErrorLog, e);

		FacesContext.getCurrentInstance().addMessage(
				null,
				new FacesMessage(FacesMessage.SEVERITY_ERROR, OthalaUtil.getWordBundle("validator_summary"), OthalaUtil
						.getWordBundle(e)));
	}

	public void addFatal(String summary, String message) {

		FacesContext.getCurrentInstance().addMessage(null,
				new FacesMessage(FacesMessage.SEVERITY_FATAL, summary, message));
	}

	protected String getQueryStringParm(String key) {
		HttpServletRequest hsr = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext()
				.getRequest();
		if (hsr.getParameter(key) != null) {
			return hsr.getParameter(key).toString();
		} else {
			return null;
		}

	}

	protected String getLang() {
		return localManager.getLanguage();
	}

	protected void redirectHome() {
		try {
			FacesContext.getCurrentInstance().getExternalContext()
					.redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath() + "/home");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void redirectCheckOut() {
		try {
			FacesContext
					.getCurrentInstance()
					.getExternalContext()
					.redirect(
							FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()
									+ "/checkout");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String redirectCart() {
		try {
			FacesContext
					.getCurrentInstance()
					.getExternalContext()
					.redirect(
							FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath() + "/"
									+ OthalaUtil.getWordBundle("catalogo_mycart"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	protected void deleteCart(CartFlowBean cart) {

		cart.getCart().clear();
		cart.setAddressFat(null);
		cart.setAddressSpe(null);
		cart.setArticleSel(null);
		cart.setDeliveryCost(null);
		cart.setDetailProduct(null);
		cart.setDetailProductFull(null);
		cart.setIdPayment(0);
		cart.setIdTypeDelivery(0);
		cart.setPcScontoCoupon(0);
		cart.setPcScontoFidelity(0);
		cart.setTotalPriceOrdeNoDiscount(null);
		cart.setTotalPriceOrder(null);
		cart.setAmtDiscount(null);
		cart.setDeliveryCost(null);
		cart.setFidelityCard(null);
		cart.setCoupon(null);

	}

	protected HttpServletResponse getResponse() {
		ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
		HttpServletResponse response = (HttpServletResponse) context.getResponse();
		return response;
	}

	protected HttpServletRequest getRequest() {
		ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
		HttpServletRequest request = (HttpServletRequest) context.getRequest();

		return request;
	}

	protected Map<String, Object> getSessionMap() {
		return OthalaUtil.getSessionMap();
	}

	protected OrderFullDTO findOrderById(List<OrderFullDTO> orders, int idOrder) {
		if (orders == null) {
			return null;
		}
		for (OrderFullDTO order : orders) {
			if (order.getIdOrder().intValue() == idOrder) {
				return order;
			}
		}
		return null;
	}

	protected String getURLCart() {
		String url = String.format("http://%s%s/cart", getRequest().getServerName(), getRequest().getContextPath());
		return url;
	}

	protected void calcolaPrezzoCarrello() {
		BigDecimal totalPrice = BigDecimal.ZERO;
		getCartFlowBean().setCheckoutCart(false);
		for (ArticleFullDTO art : getCartFlowBean().getCart()) {
			totalPrice = (art.getPriceDiscounted().multiply(new BigDecimal(art.getQtBooked()))).add(totalPrice);

		}
		if (getCartFlowBean().getDeliveryCost() != null
				&& getCartFlowBean().getDeliveryCost().getImportoSpese() != null) {
			totalPrice = totalPrice.add(getCartFlowBean().getDeliveryCost().getImportoSpese());

		}

		getCartFlowBean().setTotalPriceOrder(totalPrice);

	}

}
