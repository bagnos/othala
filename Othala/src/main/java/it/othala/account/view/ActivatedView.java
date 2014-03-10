package it.othala.account.view;

import it.othala.execption.UserAlReadyActivatedException;
import it.othala.execption.UserNotFoundException;
import it.othala.service.factory.OthalaFactory;
import it.othala.util.HelperCrypt;
import it.othala.view.BaseView;
import it.othala.web.utils.OthalaUtil;

import javax.faces.bean.ManagedBean;

@ManagedBean
public class ActivatedView extends BaseView {

	private String message;
	private boolean success;

	public boolean isSuccess() {
		return success;
	}

	public String getMessage() {
		return message;
	}

	@Override
	public String doInit() {

		String user = getQueryStringParm("u");
		success = false;

		if (user != null) {

			user = HelperCrypt.decrypt(user);
			try {
				OthalaFactory.getAccountServiceInstance().activatedAccount(user);
				message = OthalaUtil.getWordBundle("account_confirmActivated", new Object[] { user });
				success = true;
			} catch (UserNotFoundException | UserAlReadyActivatedException e) {

				log.error("errore nell'attivazione", e);

				addError(OthalaUtil.getWordBundle("account_errorActivated"),
						OthalaUtil.getWordBundle(e.getKeyMessage(), new Object[] { user }));

				return null;
			}

		} else {

			addError(OthalaUtil.getWordBundle("account_errorActivated"),
					OthalaUtil.getWordBundle("account_usersEmptyActivated"));
		
		}

		return null;
	}

}
