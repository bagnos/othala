package it.othala.enums;

public enum TypeStateProduct {
	INSERITO(0), CANCELLATO(3),PUBBLICATO(1) ;
	private int stato;

	private TypeStateProduct(int stato) {
		this.stato = stato;
	}

	public int getState() {
		return stato;
	}

	public static String getDescrState(int idState) {
		String state = valueOf(idState).toString().replace("-", "");
		return state;
	}

	public static TypeStateProduct valueOf(int idState) {
		for (TypeStateProduct type : TypeStateProduct.values()) {
			if (type.getState() == idState) {
				return type;
			}
		}
		return null;
	}


}
