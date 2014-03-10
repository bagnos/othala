package it.othala.enums;

public enum TypeCustomerState {
	DISATTIVATO(1), ATTIVATO(2), CESSATO(3), RESET_PSW(4);

	private int stato;

	private TypeCustomerState(int stato) {
		this.stato = stato;
	}

	public int getState() {
		return stato;
	}

}
