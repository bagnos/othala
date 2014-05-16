package it.othala.dto;

public class MailPropertiesDTO {
	private String pathImgLogo;
	private String pathImgPayment;
	private String basePathThumbinalsArticle;
	private String companyName;
	private String contextRoot;
	private String fromMail;
	private String dnsSite;
	private String boardUrl;
	
	
	
	public String getDnsSite() {
		return dnsSite;
	}
	public void setDnsSite(String dnsSite) {
		this.dnsSite = dnsSite;
	}
	public String getBoardUrl() {
		return boardUrl;
	}
	public void setBoardUrl(String boardUrl) {
		this.boardUrl = boardUrl;
	}
	public String getFromMail() {
		return fromMail;
	}
	public void setFromMail(String fromMail) {
		this.fromMail = fromMail;
	}
	public String getContextRoot() {
		return contextRoot;
	}
	public void setContextRoot(String contextRoot) {
		this.contextRoot = contextRoot;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getBasePathThumbinalsArticle() {
		return basePathThumbinalsArticle;
	}
	public void setBasePathThumbinalsArticle(String basePathThumbinalsArticle) {
		this.basePathThumbinalsArticle = basePathThumbinalsArticle;
	}
	public String getPathImgLogo() {
		return pathImgLogo;
	}
	public void setPathImgLogo(String pathImgLogo) {
		this.pathImgLogo = pathImgLogo;
	}
	public String getPathImgPayment() {
		return pathImgPayment;
	}
	public void setPathImgPayment(String pathImgPayment) {
		this.pathImgPayment = pathImgPayment;
	}
	
	
}
