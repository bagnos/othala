package it.othala.execption;

public class OthalaException extends Exception {
	private static final long serialVersionUID = 1L;

	public OthalaException(String dsErrore, Throwable cause) {
		super(dsErrore, cause);
	}

	public OthalaException(String dsErrore) {

		super(dsErrore);

	}

}
