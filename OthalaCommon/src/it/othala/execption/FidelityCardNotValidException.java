package it.othala.execption;

public class FidelityCardNotValidException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_fidelityCardNotValidException";

	public FidelityCardNotValidException(String idFidelity) {
		/*String prd=StringUtils.collectionToCommaDelimitedString(productsNoStocked);*/
		
		super(KEY_MESSAGE, new Object[] {idFidelity});
		// TODO Auto-generated constructor stub

	}
	
}
