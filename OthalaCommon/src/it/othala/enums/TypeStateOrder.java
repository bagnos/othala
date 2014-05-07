package it.othala.enums;

public enum TypeStateOrder {
	INSERITO(1), IN_LAVORAZIONE(2), PAGATO(3), SPEDITO(4), ANNULLATO(5), RECESSO(6);

	private int stato;

	private TypeStateOrder(int stato) {
		this.stato = stato;
	}

	public int getState() {
		return stato;
	}

}
