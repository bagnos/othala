package it.othala.execption;


public class BarcodeNotPresentException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_barcodeNotPresentException";

	public BarcodeNotPresentException(String txBarcode) {
		/*String prd=StringUtils.collectionToCommaDelimitedString(productsNoStocked);*/
		
		super(KEY_MESSAGE, new Object[] {txBarcode});
		// TODO Auto-generated constructor stub

	}

}
