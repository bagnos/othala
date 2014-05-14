package it.othala.dao.interfaces;

public interface IMessagelIpn {
	public int insertMessage(long idOrder,String idTransaction,String message);
	public int getIdTransaction(long idOrder,String idTransaction);
}
