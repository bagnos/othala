package it.othala.service;

import it.othala.dao.interfaces.IMessagelIpnDAO;
import it.othala.dto.MessageIpnDTO;
import it.othala.service.interfaces.IMessageIpnService;

public class MessageIpnService implements IMessageIpnService {

	private IMessagelIpnDAO messageIpnDAO;

	public void setMessageIpnDAO(IMessagelIpnDAO messageIpnDAO) {
		this.messageIpnDAO = messageIpnDAO;
	}

	@Override
	public void insertMessageIpn(MessageIpnDTO messageIpn) {

		messageIpnDAO.insertMessageIpn(messageIpn);

	}

	@Override
	public Boolean getIdTransaction(long idOrder, String idTransaction) {

		Integer qtIdTransaction = messageIpnDAO.getIdTransaction(idOrder,
				idTransaction);

		if (qtIdTransaction > 0) {
			return true;
		} else {
			return false;
		}

	}

}
