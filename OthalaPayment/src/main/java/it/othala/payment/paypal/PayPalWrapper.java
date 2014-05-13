package it.othala.payment.paypal;

import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalFailureException;
import it.othala.payment.paypal.exception.PayPalFundingFailureException;
import it.othala.payment.paypal.exception.PayPalPaymentRefusedException;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import paypalnvp.core.PayPal;
import paypalnvp.core.PayPal.Environment;
import paypalnvp.fields.Currency;
import paypalnvp.fields.Payment;
import paypalnvp.fields.PaymentAction;
import paypalnvp.fields.PaymentItem;
import paypalnvp.profile.Profile;
import paypalnvp.request.DoExpressCheckoutPayment;
import paypalnvp.request.GetExpressCheckoutDetails;
import paypalnvp.request.SetExpressCheckout;

//import javax.servlet.http.HttpServletRequest;

public class PayPalWrapper {

	private String returnUrl = null;
	private String cancelUrl = null;
	private String imageUrl = null;
	private String redirectUrl = null;
	private final String L_PAYMENTREQUEST_0_DESCn = "L_PAYMENTREQUEST_0_DESC";
	private final String L_PAYMENTREQUEST_0_AMTm = "L_PAYMENTREQUEST_0_AMT";
	private final String L_PAYMENTREQUEST_0_QTYm = "L_PAYMENTREQUEST_0_QTY";
	private final String L_PAYMENTREQUEST_0_NUMBERm = "L_PAYMENTREQUEST_0_NUMBER";
	private final String L_ERRORCODEn = "L_ERRORCODE";
	private final String L_SHORTMESSAGEn = "L_SHORTMESSAGE";
	private final String L_LONGMESSAGEn = "StringL_LONGMESSAGE";
	private List<String> errorCodes;
	private String errorMessage;
	private Map<String, String> paymentDetails;
	public static final String COMPLETED_STATUS = "Completed";

	private PayPal pp = null;

	public PayPalWrapper(Environment env, Profile profile) {

		pp = new PayPal(profile, env);
	}

	public SetExpressCheckoutDTO setExpressCheckout(OrderPayPalDTO cart) throws MalformedURLException,
			UnsupportedEncodingException, PayPalException {

		SetExpressCheckoutDTO setExpChecktDTO = null;

		Payment payment = getPayment(cart);

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
	/**
	 * 
	 * @param details
	 * @return
	 * restituita in caso di errore 10486 da PayPal,typically an invalid or maxed out credit card
	 * @throws PayPalFundingFailureException
	 * restituito in caso di errore imprevisto da PayPal
	 * @throws PayPalException
	 * restituito in caso di errore gestito da PayPal, ACK=Failure
	 * @throws PayPalFailureException
	 * Pagamento non effettuato, stato interno PayPal deny, refused, ecc...
	 * @throws PayPalPaymentRefusedException
	 */

	public DoExpressCheckoutPaymentDTO doExpressCheckoutPayment(GetExpressCheckoutDetailsDTO details)
			throws  PayPalFundingFailureException, PayPalException, PayPalFailureException, PayPalPaymentRefusedException {

		DoExpressCheckoutPayment doCheck = new DoExpressCheckoutPayment(details.getToken(), PaymentAction.SALE,
				details.getPayerid(), details.getAmount().toString(), details.getCurrencyCode());
		// doCheck.setUSESESSIONPAYMENTDETAILS(true);
		doCheck.setPaymentDetails(paymentDetails);
		try {
			pp.setResponse(doCheck);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			throw new PayPalException(e);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			throw new PayPalException(e);
		}
		Map<String, String> response = doCheck.getNVPResponse();
		return getDoExpressCheckoutPaymentDTO(response);
	}

	public GetExpressCheckoutDetailsDTO getExpressCheckoutDetails(String token) throws MalformedURLException,
			UnsupportedEncodingException, PayPalException {
		GetExpressCheckoutDetails getExpress = new GetExpressCheckoutDetails(token);

		pp.setResponse(getExpress);
		Map<String, String> response = getExpress.getNVPResponse();
		GetExpressCheckoutDetailsDTO detailDto = getExpressCheckOutDetailsDTO(response);
		return detailDto;
	}

	public static Environment getEnvironment(String env) {

		Environment environment = Environment.valueOf(env);

		return environment;
	}

	private Payment getPayment(OrderPayPalDTO cart) {
		PaymentItem item = null;
		List<PaymentItem> items = new ArrayList<PaymentItem>();
		String description;
		for (int i = 0; i <= cart.getAricles().size() - 1; i++) {
			item = new PaymentItem();
			description = String.format("%s %s %S", cart.getAricles().get(i).getPrdFullDTO().getDescription(), cart
					.getAricles().get(i).getTxSize(), cart.getAricles().get(i).getTxColor());
			item.setDescription(description);
			item.setAmount(cart.getAricles().get(i).getPrdFullDTO().getRealPrice().toString());
			item.setQuantity(cart.getAricles().get(i).getQtBooked());
			item.setItemNumber(cart.getAricles().get(i).getPrdFullDTO().getMerchantCode());

			items.add(item);
		}
		// Payment payment = new Payment(cart.getTotalPriceOrder().toString());
		Payment payment = new Payment(cart.getTotalPriceOrder().toString(), items);
		payment.setCurrency(Currency.EUR);
		payment.setAllowingNote(true);
		payment.setLocalCode(cart.getLocale().toUpperCase());
		// payment.setOverrideShippingAddress();
		payment.setSuppressingShippingAddress();
		payment.setCustomField(cart.getIdOrder());
		payment.setShippingAmount(cart.getDeliveryCost().getImportoSpese().toString());
		payment.setPaymentRequestITEMAMT(cart.getTotalItemOrder().toString());

		/*
		 * String country = locale;
		 * 
		 * payment.setShipToAddress(cart.getAddressSpe().getNome() + " " +
		 * cart.getAddressSpe().getCognome(), cart .getAddressSpe().getVia(),
		 * cart.getAddressSpe().getComune(), cart.getAddressSpe().getCap(), cart
		 * .getAddressSpe().getProvincia(),
		 * country,cart.getAddressSpe().getTel());
		 */
		return payment;
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
			throws PayPalException, PayPalFundingFailureException, PayPalFailureException, PayPalPaymentRefusedException {
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
			verifyFailurePayment(checkDTO);
		} else {
			updateError(response);

			if (isFundinFailure()) {

				throw new PayPalFundingFailureException(errorMessage, getRedirctUrl(checkDTO.getToken()));
			} else {
				throw new PayPalFailureException(sn.toString(), errorMessage);
			}

		}
		return checkDTO;
	}
	
	private void verifyFailurePayment(DoExpressCheckoutPaymentDTO checkDTO) throws PayPalPaymentRefusedException
	{
		checkDTO.setFailedPaymenet(false);
		if (checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS().equalsIgnoreCase("Denied")
				|| checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS().equalsIgnoreCase("Failed")
				|| checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS().equalsIgnoreCase("Refused")) {
			
			throw new PayPalPaymentRefusedException(checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS());
		}
		
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
			getExpressCheckoutDetailsDTO.setCurrencyCode(response.get("CURRENCYCODE").toString());
			getExpressCheckoutDetailsDTO.setAmount(new BigDecimal(response.get("PAYMENTREQUEST_0_AMT").toString()));
			getExpressCheckoutDetailsDTO.setItemAmount(new BigDecimal(response.get("PAYMENTREQUEST_0_ITEMAMT")
					.toString()));
			getExpressCheckoutDetailsDTO.setShipAmount(new BigDecimal(response.get("PAYMENTREQUEST_0_SHIPPINGAMT")
					.toString()));

			/*
			 * getExpressCheckoutDetailsDTO.getShippingAddress().setCap(
			 * response.get("PAYMENTREQUEST_0_SHIPTOZIP").toString());
			 * 
			 * String[] nomeCompleto =
			 * response.get("PAYMENTREQUEST_0_SHIPTONAME"
			 * ).toString().split(" ");
			 * 
			 * getExpressCheckoutDetailsDTO.getShippingAddress().setNome(
			 * nomeCompleto[0]);
			 * getExpressCheckoutDetailsDTO.getShippingAddress(
			 * ).setCognome(nomeCompleto[1]);
			 * getExpressCheckoutDetailsDTO.getShippingAddress().setVia(
			 * (response.get("PAYMENTREQUEST_0_SHIPTOSTREET").toString()));
			 * getExpressCheckoutDetailsDTO
			 * .getShippingAddress().setProvincia(response
			 * .get("PAYMENTREQUEST_0_STATE"));
			 * getExpressCheckoutDetailsDTO.getShippingAddress().setNazione(
			 * response.get("PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE"));
			 * 
			 * getExpressCheckoutDetailsDTO.getShippingAddress().setComune(response
			 * .get("PAYMENTREQUEST_0_SHIPTOCITY"));
			 * getExpressCheckoutDetailsDTO
			 * .getShippingAddress().setTel(response.
			 * get("PAYMENTREQUEST_0_SHIPTOPHONENUM"));
			 */
			updateCart(response, getExpressCheckoutDetailsDTO);

			getExpressCheckoutDetailsDTO.setOkMessage(sn.toString());

		} else {
			updateError(response);
			throw new PayPalException(sn.toString(), errorMessage);

		}

		return getExpressCheckoutDetailsDTO;
	}

	/*
	 * private Profile getProfile() { Profile user = new
	 * BaseProfile.Builder(prop.getProperty("Username"),
	 * prop.getProperty("Password")).signature(
	 * prop.getProperty("Signature")).build(); return user; }
	 */

	private boolean isFundinFailure() {
		return (errorMessage).contains("10486");

	}

	private void updateCart(Map<String, String> response, GetExpressCheckoutDetailsDTO details) {
		int i = 0;

		ItemCartDTO item = null;
		String key = null;
		paymentDetails = new Hashtable<String, String>();
		while (true) {
			key = L_PAYMENTREQUEST_0_DESCn + i;
			if (response.containsKey(key)) {
				item = new ItemCartDTO();
				item.setDescription(response.get(key));
				paymentDetails.put(key, response.get(key));
				paymentDetails.put("L_DESC" + i, response.get(key));

				key = L_PAYMENTREQUEST_0_QTYm + i;
				item.setQta(Integer.valueOf(response.get(key)));
				paymentDetails.put(key, response.get(key));

				key = L_PAYMENTREQUEST_0_AMTm + i;
				item.setPrice(new BigDecimal(response.get(key)));
				paymentDetails.put(key, response.get(key));

				key = L_PAYMENTREQUEST_0_NUMBERm + i;
				item.setCode(response.get(key));
				paymentDetails.put(key, response.get(key));
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
		errorCodes = new ArrayList<String>();

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

	/*
	private void updateState(DoExpressCheckoutPaymentDTO checkDTO) {
		checkDTO.setStatePayPal(TypeStatePayPal.COMPLETED);
		if (checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS().equalsIgnoreCase("In progress")
				|| checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS().equalsIgnoreCase("Pending verification")
				|| checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS().equalsIgnoreCase("Processing")) {
			checkDTO.setStatePayPal(TypeStatePayPal.PROCESSING);
			return;
		}
		if (checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS().equalsIgnoreCase("Denied")
				|| checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS().equalsIgnoreCase("Failed")
				|| checkDTO.getPAYMENTINFO_0_PAYMENTSTATUS().equalsIgnoreCase("Refused")) {
			checkDTO.setStatePayPal(TypeStatePayPal.REFUSED);
			return;
		}
	}*/
	


}
