package it.othala.execption;

public class UserAlReadyActivatedException extends OthalaException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3415594102509119972L;
	private String user;

	private static final String KEY_MESSAGE = "exception_userAlReadyActivatedException";

	public String getUser() {
		return user;
	}

	public UserAlReadyActivatedException(String user) {
		super(KEY_MESSAGE, new Object[] { user });
		// TODO Auto-generated constructor stub
		this.user = user;
	}

}
