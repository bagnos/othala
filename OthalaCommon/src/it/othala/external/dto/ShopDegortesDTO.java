package it.othala.external.dto;

public class ShopDegortesDTO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer codMagaz;
	private String DescrizioneNegozio;
	private String txMail;
	public Integer getCodMagaz() {
		return codMagaz;
	}
	public void setCodMagaz(Integer codMagaz) {
		this.codMagaz = codMagaz;
	}
	public String getDescrizioneNegozio() {
		return DescrizioneNegozio;
	}
	public void setDescrizioneNegozio(String descrizioneNegozio) {
		DescrizioneNegozio = descrizioneNegozio;
	}
	public String getTxMail() {
		return txMail;
	}
	public void setTxMail(String txMail) {
		this.txMail = txMail;
	}
}
