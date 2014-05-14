package it.othala.service.interfaces;

public interface IPaymentService {

	public void insertMessage(long idOrder,String idTransaction,String message);
	public boolean exitsIdTransaction(long idOrder,String idTransaction);
	
}
