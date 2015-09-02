package it.othala.external.dto;

public class FidelityCardDegortesDTO {
	
	public String getCliente() {
		return Cliente;
	}
	public void setCliente(String cliente) {
		Cliente = cliente;
	}
	public String getIndirEmail() {
		return IndirEmail;
	}
	public void setIndirEmail(String indirEmail) {
		IndirEmail = indirEmail;
	}
	public String getCodZona() {
		return CodZona;
	}
	public void setCodZona(String codZona) {
		CodZona = codZona;
	}
	String IndirEmail;
	String CodZona;
	String Cliente;
}
