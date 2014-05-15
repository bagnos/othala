package it.othala.web.utils;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.dto.ProfilePayPalDTO;
import it.othala.payment.paypal.dto.OrderPayPalDTO;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

public class PayPalUtil {
	private static Properties prop = null;

	private static void loadProp() throws IOException {
		if (prop == null) {
			try (InputStream input = Thread.currentThread().getContextClassLoader()
					.getResourceAsStream("paypal.properties")) {

				prop = new Properties();
				prop.load(input);
			}
		}

	}

	public static ProfilePayPalDTO getProfile() throws IOException {
		loadProp();
		ProfilePayPalDTO prof = new ProfilePayPalDTO();
		prof.setEnvironment(prop.getProperty("environment"));
		prof.setPassword( prop.getProperty("Password"));
		prof.setSignature(prop.getProperty("Signature"));
		prof.setUserName(prop.getProperty("Username"));
				
		return prof;
	}

	

	public static OrderPayPalDTO getOrderPayPalDTO(CartFlowBean car, String idOrder, String lang) throws IOException {
		OrderPayPalDTO cart = new OrderPayPalDTO();
		cart.setAricles(cart.getAricles());
		cart.setLocale(lang);
		cart.setDeliveryCost(cart.getDeliveryCost());
		cart.setIdOrder(idOrder);
		cart.setTotalItemOrder(cart.getTotalItemOrder());
		cart.setTotalPriceOrder(cart.getTotalPriceOrder());
		loadProp();
		FacesContext context = FacesContext.getCurrentInstance();
		HttpServletRequest request = (HttpServletRequest) context.getExternalContext().getRequest();
		String remoteHost = request.getServerName();
		String contextPath = request.getContextPath();
		cart.setReturnUrl(prop.getProperty("returnUrl").replace("#{request.remoteHost}", remoteHost)
				.replace("#{request.contextPath}", contextPath));
		cart.setCancelUrl(prop.getProperty("cancelUrl").replace("#{request.remoteHost}", remoteHost)
				.replace("#{request.contextPath}", contextPath));
		cart.setImageUrl(prop.getProperty("imageUrl").replace("#{request.remoteHost}", remoteHost)
				.replace("#{request.contextPath}", contextPath));
		String propertRedirect = "redirectUrl" + prop.getProperty("environment");
		cart.setRedirectUrl(prop.getProperty(propertRedirect));
		return cart;
	}

}
