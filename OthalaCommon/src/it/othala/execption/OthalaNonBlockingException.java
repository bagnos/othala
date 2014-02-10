package it.othala.execption;

public class OthalaNonBlockingException extends OthalaException {

	
	private static final long serialVersionUID = -2326689340493930992L;

	public OthalaNonBlockingException(String dsErrore, Throwable cause) {
		super(dsErrore, cause);
	}

	public OthalaNonBlockingException(String dsErrore) {

		super(dsErrore);

	}
	
}
