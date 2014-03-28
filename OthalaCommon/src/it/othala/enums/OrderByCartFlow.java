package it.othala.enums;

public enum OrderByCartFlow {
	PREZZOASC(1), PREZZODESC(2);

	private int stato;

	private OrderByCartFlow(int stato) {
		this.stato = stato;
	}

	public int getState() {
		return stato;
	}

}
