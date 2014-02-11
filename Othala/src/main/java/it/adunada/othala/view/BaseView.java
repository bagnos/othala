package it.adunada.othala.view;

public abstract class BaseView {
	/**
	 *dentro il content del .xhtml inserire {@code <f:metadata>
	 * <f:viewAction action="sampleView.doInit" /> </f:metadata>}
	 * il metodo doInit verr� inocato alla prima richesta sulla pagina, no postback di default.
	 * Pu� essere utilizzato per inizializzare la view. 
	 * @return
	 */
	public abstract String doInit();
}
