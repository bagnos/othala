package it.othala.payment.paypal;

import it.othala.cartflow.model.CartFlowBean;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.util.ArrayList;
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
import paypalnvp.fields.ShipToAddress;
import paypalnvp.profile.BaseProfile;
import paypalnvp.profile.Profile;
import paypalnvp.request.DoExpressCheckoutPayment;
import paypalnvp.request.GetExpressCheckoutDetails;
import paypalnvp.request.SetExpressCheckout;

public class PayPalWrapper {

	private static Properties prop = null;
	private static Environment environment = null;
	private String returnUrl = null;
	private String cancelUrl = null;
	private String imageUrl = null;
	private String redirectUrl = null;
	private final String L_PAYMENTREQUEST_0_DESCn = "L_PAYMENTREQUEST_0_DESC";
	private final String L_PAYMENTREQUEST_0_AMTm = "L_PAYMENTREQUEST_0_AMT";
	private final String L_PAYMENTREQUEST_0_QTYm = "L_PAYMENTREQUEST_0_QTY";
	private final String L_PAYMENTREQUEST_0_NUMBERm = "L_PAYMENTREQUEST_0_NUMBERm";
	private final String L_ERRORCODEn = "L_ERRORCODE";
	private final String L_SHORTMESSAGEn = "L_SHORTMESSAGE";
	private final String L_LONGMESSAGEn = "StringL_LONGMESSAGE";
	private List<String> errorCodes;
	private String errorMessage;

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

	public SetExpressCheckoutDTO setExpressCheckout(CartFlowBean cart, String locale, String idOrder)
			throws MalformedURLException, UnsupportedEncodingException, PayPalException {

		SetExpressCheckoutDTO setExpChecktDTO = null;
		PayPal pp = new PayPal(getProfile(), getEnvironment());

		updateUrl();

		Payment payment = getPayment(cart, locale, idOrder);

		SetExpressCheckout setEC = new SetExpressCheckout(payment, returnUrl, cancelUrl);
		setEC.setImage(imageUrl);
		setEC.setPaymentAction(PaymentAction.SALE);

		pp.setResponse(setEC);

		Map<String, String> response = setEC.getNVPResponse();
		if (response != null && !response.isEmpty()) {
			setExpChecktDTO = getExpressCheckOutDTO(response, redirectUrl);
		}

		return setExpChecktDTO;
	}

	public DoExpressCheckoutPaymentDTO doExpressCheckoutPayment(GetExpressCheckoutDetailsDTO details)
			throws MalformedURLException, UnsupportedEncodingException, PayPalException, PayPalFundingFailureException {
		PayPal pp = new PayPal(getProfile(), getEnvironment());

		DoExpressCheckoutPayment doCheck = new DoExpressCheckoutPayment(details.getToken(), PaymentAction.SALE,
				details.getPayerid());
		doCheck.setUSESESSIONPAYMENTDETAILS(true);
		pp.setResponse(doCheck);
		Map<String, String> response = doCheck.getNVPResponse();
		return getDoExpressCheckoutPaymentDTO(response);
	}

	public GetExpressCheckoutDetailsDTO getExpressCheckoutDetails(String token) throws MalformedURLException,
			UnsupportedEncodingException, PayPalException {
		GetExpressCheckoutDetails getExpress = new GetExpressCheckoutDetails(token);
		PayPal pp = new PayPal(getProfile(), getEnvironment());
		pp.setResponse(getExpress);
		Map<String, String> response = getExpress.getNVPResponse();
		GetExpressCheckoutDetailsDTO detailDto = getExpressCheckOutDetailsDTO(response);
		return detailDto;
	}

	private static Environment getEnvironment() {
		if (environment == null) {
			String env = prop.getProperty("environment");
			environment = Environment.valueOf(env);
		}
		return environment;
	}

	private Payment getPayment(CartFlowBean cart, String locale, String idOrder) {
		PaymentItem item = null;
		List<PaymentItem> items = new ArrayList<>();
		String description;
		for (int i = 0; i <= cart.getCart().size() - 1; i++) {
			item = new PaymentItem();
			description = String.format("%s %s %S", cart.getCart().get(i).getPrdFullDTO().getDescription(), cart
					.getCart().get(i).getTxSize(), cart.getCart().get(i).getTxColor());
			item.setDescription(description);
			item.setAmount(cart.getCart().get(i).getPrdFullDTO().getRealPrice().toString());
			item.setQuantity(cart.getCart().get(i).getQtBooked());
			item.setItemNumber(cart.getCart().get(i).getPrdFullDTO().getMerchantCode());

			items.add(item);
		}
		// Payment payment = new Payment(cart.getTotalPriceOrder().toString());
		Payment payment = new Payment(cart.getTotalPriceOrder().toString(), items);
		payment.setCurrency(Currency.EUR);
		payment.setAllowingNote(true);
		payment.setLocalCode(locale.toUpperCase());
		payment.setOverrideShippingAddress();
		// payment.setSuppressingShippingAddress();
		payment.setCustomField(idOrder);

		String country = locale;

		payment.setShipToAddress(cart.getAddressSpe().getNome() + " " + cart.getAddressSpe().getCognome(), cart
				.getAddressSpe().getVia(), cart.getAddressSpe().getComune(), cart.getAddressSpe().getCap(), cart
				.getAddressSpe().getProvincia(), country,cart.getAddressSpe().getTel());

		return payment;
	}

	private void updateUrl() {
		FacesContext context = FacesContext.getCurrentInstance();
		HttpServletRequest request = (HttpServletRequest) context.getExternalContext().getRequest();
		String remoteHost = request.getServerName();
		String contextPath = request.getContextPath();
		returnUrl = prop.getProperty("returnUrl").replace("#{request.remoteHost}", remoteHost)
				.replace("#{request.contextPath}", contextPath);
		cancelUrl = prop.getProperty("cancelUrl").replace("#{request.remoteHost}", remoteHost)
				.replace("#{request.contextPath}", contextPath);
		imageUrl = prop.getProperty("imageUrl").replace("#{request.remoteHost}", remoteHost)
				.replace("#{request.contextPath}", contextPath);
		String propertRedirect = "redirectUrl" + prop.getProperty("environment");
		redirectUrl = prop.getProperty(propertRedirect);

	}

	private SetExpressCheckoutDTO getExpressCheckOutDTO(Map<String, String> response, String redirectUrl)
			throws PayPalException {
		StringBuilder sn = new StringBuilder();
		for (String e : response.keySet()) {
			sn.append(String.format("%s=%s;", e, response.get(e).toString()));
		}

		SetExpressCheckoutDTO setExpChecktDTO = new SetExpressCheckoutDTO();
		if (response.get("ACK").toString().equalsIgnoreCase("Success")) {
			setExpChecktDTO.setToken(response.get("TOKEN").toString());
			redirectUrl = redirectUrl.replace("#{token}", response.get("TOKEN").toString());
			setExpChecktDTO.setRedirectUrl(redirectUrl);

			setExpChecktDTO.setOkMessage(sn.toString());

		} else {
			updateError(response);
			throw new PayPalException(sn.toString(), errorMessage);

		}

		return setExpChecktDTO;
	}

	private DoExpressCheckoutPaymentDTO getDoExpressCheckoutPaymentDTO(Map<String, String> response)
			throws PayPalException, PayPalFundingFailureException {
		StringBuilder sn = new StringBuilder();
		for (String e : response.keySet()) {
			sn.append(String.format("%s=%s;", e, response.get(e).toString()));
		}
		DoExpressCheckoutPaymentDTO checkDTO = new DoExpressCheckoutPaymentDTO();
		if (response.get("ACK").toString().equalsIgnoreCase("Success")) {
			checkDTO.setPAYMENTINFO_0_TRANSACTIONID(response.get("PAYMENTINFO_0_TRANSACTIONID"));
			checkDTO.setNote(response.get("NOTE"));
			checkDTO.setPAYMENTINFO_0_PAYMENTSTATUS(response.get("PAYMENTINFO_0_PAYMENTSTATUS"));
			checkDTO.setPAYMENTINFO_0_PENDINGREASON(response.get("PAYMENTINFO_0_PENDINGREASON"));
		} else {
			updateError(response);
			if (isFundinFailure()) {

				throw new PayPalFundingFailureException(errorMessage, getRedirctUrl(checkDTO.getToken()));
			} else {
				throw new PayPalException(sn.toString(), errorMessage);
			}

		}
		return checkDTO;
	}

	private GetExpressCheckoutDetailsDTO getExpressCheckOutDetailsDTO(Map<String, String> response)
			throws PayPalException {
		StringBuilder sn = new StringBuilder();
		for (String e : response.keySet()) {
			sn.append(String.format("%s=%s;", e, response.get(e).toString()));
		}

		GetExpressCheckoutDetailsDTO getExpressCheckoutDetailsDTO = new GetExpressCheckoutDetailsDTO();
		if (response.get("ACK").toString().equalsIgnoreCase("Success")) {
			getExpressCheckoutDetailsDTO.setToken(response.get("TOKEN").toString());
			getExpressCheckoutDetailsDTO.setCustom(response.get("PAYMENTREQUEST_0_CUSTOM").toString());
			getExpressCheckoutDetailsDTO.setPayerid(response.get("PAYERID").toString());
			getExpressCheckoutDetailsDTO.setEmail(response.get("EMAIL").toString());
			getExpressCheckoutDetailsDTO.setCorrelationid(response.get("CORRELATIONID").toString());
			getExpressCheckoutDetailsDTO.setFirstname(response.get("FIRSTNAME").toString());
			getExpressCheckoutDetailsDTO.setLastname(response.get("LASTNAME").toString());
			getExpressCheckoutDetailsDTO.setAmount(new BigDecimal(response.get("PAYMENTREQUEST_0_AMT").toString()));

			getExpressCheckoutDetailsDTO.getShippingAddress().setCap(
					response.get("PAYMENTREQUEST_0_SHIPTOZIP").toString());

			String[] nomeCompleto = response.get("PAYMENTREQUEST_0_SHIPTONAME").toString().split(" ");

			getExpressCheckoutDetailsDTO.getShippingAddress().setNome(nomeCompleto[0]);
			getExpressCheckoutDetailsDTO.getShippingAddress().setCognome(nomeCompleto[1]);
			getExpressCheckoutDetailsDTO.getShippingAddress().setVia(
					(response.get("PAYMENTREQUEST_0_SHIPTOSTREET").toString()));
			getExpressCheckoutDetailsDTO.getShippingAddress().setProvincia(response.get("PAYMENTREQUEST_0_STATE"));
			getExpressCheckoutDetailsDTO.getShippingAddress().setNazione(
					response.get("PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE"));

			getExpressCheckoutDetailsDTO.getShippingAddress().setComune(response.get("PAYMENTREQUEST_0_SHIPTOCITY"));
			getExpressCheckoutDetailsDTO.getShippingAddress().setTel(response.get("PAYMENTREQUEST_0_SHIPTOPHONENUM"));

			updateCart(response, getExpressCheckoutDetailsDTO);

			getExpressCheckoutDetailsDTO.setOkMessage(sn.toString());

		} else {
			updateError(response);
			throw new PayPalException(sn.toString(), errorMessage);

		}

		return getExpressCheckoutDetailsDTO;
	}

	private Profile getProfile() {
		Profile user = new BaseProfile.Builder(prop.getProperty("Username"), prop.getProperty("Password")).signature(
				prop.getProperty("Signature")).build();
		return user;
	}

	private boolean isFundinFailure() {
		return (errorMessage).contains("10486");

	}

	private void updateCart(Map<String, String> response, GetExpressCheckoutDetailsDTO details) {
		int i = 0;

		ItemCartDTO item = null;
		String key = null;
		while (true) {
			key = L_PAYMENTREQUEST_0_DESCn + i;
			if (response.containsKey(key)) {
				item = new ItemCartDTO();
				item.setDescription(response.get(key));
				key = L_PAYMENTREQUEST_0_QTYm + i;
				item.setQta(Integer.valueOf(response.get(key)));
				key = L_PAYMENTREQUEST_0_AMTm + i;
				item.setPrice(new BigDecimal(response.get(key)));
				key = L_PAYMENTREQUEST_0_NUMBERm + i;
				item.setCode(response.get(key));
				details.getShoppingCartOrder().add(item);
				i++;
			} else {
				break;
			}
		}

	}

	private void updateError(Map<String, String> response) {
		StringBuilder sb = new StringBuilder();
		int i = 0;
		String key = null;
		errorCodes = new ArrayList<>();

		while (true) {
			key = L_ERRORCODEn + i;
			if (response.containsKey(key)) {
				sb.append(response.get(key));
				errorCodes.add(response.get(key));

				sb.append(System.getProperty(";"));
				key = L_SHORTMESSAGEn + i;
				sb.append(response.get(key));
				sb.append(System.getProperty(";"));
				key = L_LONGMESSAGEn + i;
				sb.append(response.get(key));
				sb.append(System.getProperty("line.separator"));
				i++;
			} else {
				break;
			}
		}
		errorMessage = sb.toString();

	}

	public String getRedirctUrl(String token) {
		redirectUrl = redirectUrl.replace("token", token);
		return redirectUrl;
	}

}
