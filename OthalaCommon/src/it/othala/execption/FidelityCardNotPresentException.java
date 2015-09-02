package it.othala.execption;

public class FidelityCardNotPresentException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_fidelityCardNotPresentException";

	public FidelityCardNotPresentException(String idFidelity) {
		/*String prd=StringUtils.collectionToCommaDelimitedString(productsNoStocked);*/
		
		super(KEY_MESSAGE, new Object[] {idFidelity});
		// TODO Auto-generated constructor stub

	}
}
