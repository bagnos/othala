package it.othala.enums;

public enum ArticleUpdate {
	NUOVO(1), MODIFICATO(2);

	private int stato;

	private ArticleUpdate(int stato) {
		this.stato = stato;
	}

	public int getStato() {
		return stato;
	}

}
