package it.othala.execption;

public class CouponBurntException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_couponBurntException";

	public CouponBurntException(String idCoupon) {
		/*String prd=StringUtils.collectionToCommaDelimitedString(productsNoStocked);*/
		
		super(KEY_MESSAGE, new Object[] {idCoupon});
		// TODO Auto-generated constructor stub

	}
}