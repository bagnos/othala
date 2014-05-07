package it.othala.payment.paypal;

public enum TypeStatePayPal {
	COMPLETED(1), PRCESSING(2), REFUSED(3);

	private int stato;

	private TypeStatePayPal(int stato) {
		this.stato = stato;
	}

	public int getState() {
		return stato;
	}

}
