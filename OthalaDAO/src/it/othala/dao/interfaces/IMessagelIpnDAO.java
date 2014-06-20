package it.othala.dao.interfaces;

import it.othala.dto.MessageIpnDTO;

public interface IMessagelIpnDAO {
	public void insertMessageIpn(MessageIpnDTO messageIpn);
	public int getIdTransaction(long idOrder, String idTransaction,String status);
	
}
