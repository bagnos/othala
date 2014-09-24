package it.othala.enums;

public enum TypeStateOrder {
	UNKNOWN(0), INSERITO(1), CANCELEDREVERSAL(2) {
		@Override
		public String toString() {
			return "CANCELED-REVERSAL";
		}

	},
	COMPLETED(3), DENIED(4), EXPIRED(5), FAILED(6), INPROGRESS(7) {
		@Override
		public String toString() {
			return "IN-PROGRESS";
		}

	},
	PARTIALLYREFUNDED(8) {
		public String toString() {
			return "PARTIALLY-REFUNDED";
		}
	},
	PENDING(9), REFUNDED(10), REVERSED(11), PROCESSED(12), VOIDED(13), COMPLETEDFUNDSHELD(14) {
		@Override
		public String toString() {
			return "COMPLETED-FUNDS-HELD";
		}

	},
	SPEDITO(15),
	ANNULLATO_DA_MERCHANT(16){
		@Override
		public String toString() {
			return "ANNULLATO DA MERCHANT";
		}
	},
	REQUEST_REFOUND(100)
	{
		@Override
		public String toString() {
			return "RICHIESTO RESO";
		}
		
	},
	REFOUND_COMPLETED(101)
	{
		@Override
		public String toString() {
			return "EFFETTUATO RESO";
		}
		
	},
	REFOUND_REFUSED(102)
	{
		@Override
		public String toString() {
			return "RESO RIFIUTATO";
		}
		
	}
	;

	private int stato;

	private TypeStateOrder(int stato) {
		this.stato = stato;
	}

	public int getState() {
		return stato;
	}

	public static String getDescrState(int idState) {
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

	public static TypeStateOrder fromString(String dsState) {

		TypeStateOrder result = UNKNOWN;
		for (TypeStateOrder state : values()) {
			if (state.toString().equalsIgnoreCase(dsState)) {
				result = state;
				;
				break;
			}
		}
		return result;
	}

}
