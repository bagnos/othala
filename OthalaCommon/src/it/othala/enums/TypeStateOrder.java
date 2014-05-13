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
	
	public static TypeStateOrder valueOf(int idState)
	{
		for (TypeStateOrder type: TypeStateOrder.values())
		{
			if (type.getState()==idState)
			{
				return type;
			}
		}
		return null;
	}
	
}
