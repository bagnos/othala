package it.othala.execption;


public class RefoundPresentException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_rimborsoPresente";

	public RefoundPresentException() {
		/*String prd=StringUtils.collectionToCommaDelimitedString(productsNoStocked);*/
		
		super(KEY_MESSAGE, new Object[] {});
		// TODO Auto-generated constructor stub

	}

}
