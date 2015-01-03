package it.othala.service.interfaces;

import it.othala.dto.MessageIpnDTO;

public interface IMessageIpnService {

	public void insertMessageIpn(MessageIpnDTO messageIpn);

	public Boolean getIdTransaction(String idTransaction);

}
