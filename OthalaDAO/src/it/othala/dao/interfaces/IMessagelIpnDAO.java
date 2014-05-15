package it.othala.dao.interfaces;

public interface IMessagelIpnDAO {
	public int insertMessage(long idOrder,String idTransaction,String message);
	public int getIdTransaction(long idOrder,String idTransaction);
}
