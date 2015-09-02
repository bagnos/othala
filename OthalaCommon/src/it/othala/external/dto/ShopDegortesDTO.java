package it.othala.external.dto;

public class ShopDegortesDTO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer CodMag;
	private String DesNegozio;
	private Integer QtaGiacUmMag;


	public String getDesNegozio() {
		return DesNegozio;
	}
	public void setDesNegozio(String desNegozio) {
		DesNegozio = desNegozio;
	}
	public Integer getCodMag() {
		return CodMag;
	}
	public void setCodMag(Integer codMag) {
		CodMag = codMag;
	}
	public Integer getQtaGiacUmMag() {
		return QtaGiacUmMag;
	}
	public void setQtaGiacUmMag(Integer qtaGiacUmMag) {
		QtaGiacUmMag = qtaGiacUmMag;
	}


}
