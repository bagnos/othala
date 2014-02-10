package it.othala.execption;

public class OthalaBlockingException extends OthalaException {

	private static final long serialVersionUID = -2916047600164795558L;

	public OthalaBlockingException(String dsErrore, Throwable cause) {
		super(dsErrore, cause);
	}

	public OthalaBlockingException(String dsErrore) {

		super(dsErrore);

	}

}
