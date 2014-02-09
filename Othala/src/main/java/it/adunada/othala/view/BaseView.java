package it.adunada.othala.view;

public abstract class BaseView {
	/**
	 * inserire nella parte xhtml prima di h:head {@code <f:metadata>
	 * <f:viewAction action="# sampleView.doInit}" /> </f:metadata>}
	 * il metodo doInit verrà inocato alla prima richesta sulla pagina, no postback di default. 
	 * @return
	 */
	public abstract String doInit();
}
