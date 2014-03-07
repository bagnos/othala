package it.othala.execption;

public  class OthalaException extends Exception {
	private static final long serialVersionUID = 1L;
	
	
	private Object[] parms;
	private String keyMessage; 
	public String getKeyMessage() {
		return keyMessage;
	}

	public Object[] getParms() {
		return parms;
	}

	public OthalaException(String dsErrore, Throwable cause) {
		super(dsErrore, cause);
	}

	public OthalaException(String keyMessage,Object[] parms) {
		super();
		this.parms=parms;
		this.keyMessage=keyMessage;

	}
	
	public OthalaException() {

		super();

	}

}
