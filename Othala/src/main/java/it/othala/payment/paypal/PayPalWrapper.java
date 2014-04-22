package it.othala.payment.paypal;

import it.othala.cartflow.model.CartFlowBean;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import paypalnvp.core.PayPal;
import paypalnvp.core.PayPal.Environment;
import paypalnvp.fields.Currency;
import paypalnvp.fields.Payment;
import paypalnvp.fields.PaymentAction;
import paypalnvp.fields.PaymentItem;
import paypalnvp.profile.BaseProfile;
import paypalnvp.profile.Profile;
import paypalnvp.request.SetExpressCheckout;

public class PayPalWrapper {

	private static Properties prop = null;
	private static Environment environment = null;
	

	private void loadProp() throws IOException {
		if (prop == null) {
			try (InputStream input = Thread.currentThread().getContextClassLoader()
					.getResourceAsStream("paypal.properties")) {

				prop = new Properties();
				prop.load(input);
			}
		}

	}

	public PayPalWrapper() throws IOException {
		loadProp();
	}

	public SetExpressCheckoutDTO setExpressCheckout(CartFlowBean cart,String locale) {
		Profile user = new BaseProfile.Builder(prop.getProperty("Username"), prop.getProperty("Password")).signature(
				prop.getProperty("Signature")).build();

		/* create new instance of paypal nvp */

		PayPal pp = new PayPal(user, getEnvironment());

		
		/* create set express checkout - the first paypal request */
		FacesContext context = FacesContext.getCurrentInstance();
		HttpServletRequest request = (HttpServletRequest) context.getExternalContext().getRequest();
		String remoteHost = request.getServerName();
		
		String contextPath = request.getContextPath();

		String returnUrl = prop.getProperty("returnUrl").replace("#{request.remoteHost}", remoteHost)
				.replace("#{request.contextPath}", contextPath);
		String cancelUrl = prop.getProperty("cancelUrl").replace("#{request.remoteHost}", remoteHost)
				.replace("#{request.contextPath}", contextPath);
		String imageUrl=prop.getProperty("imageUrl").replace("#{request.remoteHost}", remoteHost)
				.replace("#{request.contextPath}", contextPath);
		String propertRedirect="redirectUrl"+prop.getProperty("environment");
		String redirectUrl=prop.getProperty(propertRedirect);
		
		
		
		PaymentItem item=null;
		List<PaymentItem> items=new ArrayList<>();
		for (int i=0;i<=cart.getCart().size()-1;i++)
		{
			item=new PaymentItem();
			item.setDescription(cart.getCart().get(i).getPrdFullDTO().getDescription());
			item.setAmount(cart.getCart().get(i).getPrdFullDTO().getRealPrice().toString());
			item.setQuantity(cart.getCart().get(i).getQtBooked());
			items.add(item);
		}
		//Payment payment = new Payment(cart.getTotalPriceOrder().toString());
		Payment payment = new Payment(cart.getTotalPriceOrder().toString(),items);		
		payment.setCurrency(Currency.EUR);
		payment.setAllowingNote(true);
		payment.setLocalCode(locale.toUpperCase());
		payment.setSuppressingShippingAddress();
		
		
		
	
		
		
		//payment.setHandlingAmount(amount.toString());


		SetExpressCheckout setEC = new SetExpressCheckout(payment, returnUrl, cancelUrl);
		setEC.setImage(imageUrl);
		setEC.setPaymentAction(PaymentAction.SALE);
		
		

		/* send request and set response */
		pp.setResponse(setEC);

		/* now you have set express checkout containting */
		/* request and response as well */
		Map<String, String> response = setEC.getNVPResponse();
		StringBuilder sn=new StringBuilder();
		for(String e : response.keySet()) {
            sn.append(String.format("%s=%s;", e,response.get(e).toString()));
        }
		
		
		SetExpressCheckoutDTO setExpChecktDTO=new SetExpressCheckoutDTO(); 
		if (response.get("ACK").toString().equalsIgnoreCase("Success")) {
			setExpChecktDTO.setToken(response.get("TOKEN").toString());
			redirectUrl=redirectUrl.replace("#{token}", response.get("TOKEN").toString());
			setExpChecktDTO.setRedirectUrl(redirectUrl);
			
			setExpChecktDTO.setOkMessage(sn.toString());
			
		} else {
			setExpChecktDTO.setKoMessage(sn.toString());
			setExpChecktDTO.setToken(null);
			
		}
		return setExpChecktDTO;
	}

	private static Environment getEnvironment() {
		if (environment == null) {
			String env = prop.getProperty("environment");
			environment = Environment.valueOf(env);
		}
		return environment;
	}
	
	
}
