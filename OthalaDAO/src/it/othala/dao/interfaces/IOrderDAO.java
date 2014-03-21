package it.othala.dao.interfaces;

import it.othala.dto.OrderFullDTO;

import java.util.List;
import java.sql.Date;

public interface IOrderDAO {

	public List<OrderFullDTO> getOrders(Integer idOrder,Integer idUser,Integer idStato, Date dtDatada, Date dtDataA);
	
	public Integer insertOrder(OrderFullDTO orderFull);
	
	public void insertOrdersArticles(OrderFullDTO orderFull);
	
	public void insertStatesOrders(OrderFullDTO orderFull);
	
}
