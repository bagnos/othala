package it.othala.execption;


public class StockNotPresentException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_stockNotPresentException";

	public StockNotPresentException() {
		/*String prd=StringUtils.collectionToCommaDelimitedString(productsNoStocked);*/
		
		super(KEY_MESSAGE, new Object[] {});
		// TODO Auto-generated constructor stub

	}

}
