package it.othala.enums;

public enum TypeGroupSiteImages {
	CAROUSEL(0), NEWARRIVALS(1),TABNAV(2) ;
	private int gruppo;

	private TypeGroupSiteImages(int gruppo) {
		this.gruppo = gruppo;
	}

	public int getGruppo() {
		return gruppo;
	}

	public static String getDescrGruppo(int idGruppo) {
		String gruppo = valueOf(idGruppo).toString().replace("-", "");
		return gruppo;
	}

	public static TypeStateProduct valueOf(int idGruppo) {
		for (TypeStateProduct type : TypeStateProduct.values()) {
			if (type.getState() == idGruppo) {
				return type;
			}
		}
		return null;
	}


}
