package it.othala.web.utils;

import it.othala.cartflow.model.CartFlowBean;
import it.othala.payment.paypal.OrderPayPalDTO;
import it.othala.payment.paypal.PayPalWrapper;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import paypalnvp.profile.BaseProfile;
import paypalnvp.profile.Profile;

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
	
	public static Profile getProfile() throws IOException {
		loadProp();
		Profile user = new BaseProfile.Builder(prop.getProperty("Username"), prop.getProperty("Password")).signature(
				prop.getProperty("Signature")).build();
		return user;
	}
	
	public static void updateUrl(OrderPayPalDTO cart) throws IOException {
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

	}
	
	public static PayPalWrapper getPayPalWrapper() throws IOException
	{
		PayPalWrapper pBd = new PayPalWrapper(PayPalWrapper.getEnvironment(prop.getProperty("environment")),getProfile());
		return pBd;
	}
	
	public static OrderPayPalDTO getOrderPayPalDTO(CartFlowBean car,String idOrder,String lang) throws IOException {
		OrderPayPalDTO cart = new OrderPayPalDTO();
		cart.setAricles(cart.getAricles());
		cart.setLocale(lang);
		cart.setDeliveryCost(cart.getDeliveryCost());
		cart.setIdOrder(idOrder);
		cart.setTotalItemOrder(cart.getTotalItemOrder());
		cart.setTotalPriceOrder(cart.getTotalPriceOrder());
		updateUrl(cart);
		return cart;
	}
	
}
