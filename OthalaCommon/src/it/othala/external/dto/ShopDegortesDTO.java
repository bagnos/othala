package it.othala.external.dto;

public class ShopDegortesDTO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer codMagaz;
	private String DesNegozio;
	private String txMail;
	public Integer getCodMagaz() {
		return codMagaz;
	}
	public void setCodMagaz(Integer codMagaz) {
		this.codMagaz = codMagaz;
	}
	public String getDesNegozio() {
		return DesNegozio;
	}
	public void setDesNegozio(String desNegozio) {
		DesNegozio = desNegozio;
	}
	public String getTxMail() {
		return txMail;
	}
	public void setTxMail(String txMail) {
		this.txMail = txMail;
	}
}
