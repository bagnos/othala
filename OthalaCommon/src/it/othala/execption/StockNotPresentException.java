package it.othala.execption;

import java.util.List;

import org.springframework.util.StringUtils;

public class StockNotPresentException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String KEY_MESSAGE = "exception_stockNotPresentException";

	public StockNotPresentException(List<String> productsNoStocked) {
		
		super(KEY_MESSAGE, new Object[] {StringUtils.collectionToCommaDelimitedString(productsNoStocked)});
		// TODO Auto-generated constructor stub

	}

}
