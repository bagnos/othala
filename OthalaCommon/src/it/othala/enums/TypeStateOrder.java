package it.othala.enums;

public enum TypeStateOrder {
	INSERITO(1), CANCELEDREVERSAL(2), COMPLETED(3), DENIED(4), EXPIRED(5), FAILED(6), INPROGRESS(7), PARTIALLYREFUNDED(
			8), PENDING(9), REFUNDED(10), REVERSED(11), PROCESSED(12), VOIDED(13), COMPLETEDFUNDSHELD(14), SPEDITO(15);

	private int stato;

	private TypeStateOrder(int stato) {
		this.stato = stato;
	}

	public int getState() {
		return stato;
	}

	public String getDescrState(int idState) {
		String state = valueOf(idState).toString().replace("-", "");
		return state;
	}

	public static TypeStateOrder valueOf(int idState) {
		for (TypeStateOrder type : TypeStateOrder.values()) {
			if (type.getState() == idState) {
				return type;
			}
		}
		return null;
	}

	public static int getIdFromDescription(String state) {
		TypeStateOrder type = TypeStateOrder.valueOf(state.replace("-", "").toUpperCase());
		return type.getState();
	}

}
