package it.othala.enums;

public enum TypeAddress {
	FATTURAZIONE(1), SPEDIZIONE(2);

	private int address;

	private TypeAddress(int address) {
		this.address = address;
	}

	public int getAddress() {
		return address;
	}

}
