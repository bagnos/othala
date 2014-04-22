package it.othala.payment.paypal;

public class SetExpressCheckoutDTO {
	private String token;
	private String redirectUrl;	
	private String okMessage;
	private String koMessage;
	
	public String getKoMessage() {
		return koMessage;
	}
	public void setKoMessage(String koMessage) {
		this.koMessage = koMessage;
	}
	public String getOkMessage() {
		return okMessage;
	}
	public void setOkMessage(String okMessage) {
		this.okMessage = okMessage;
	}
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	
	
}
