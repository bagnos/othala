package it.othala.dao;

import it.othala.dao.interfaces.IOrderDAO;
import it.othala.dto.OrderFullDTO;
import it.othala.dto.StateOrderDTO;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class OrderDAO extends SqlSessionDaoSupport implements IOrderDAO  {

	@Override
	public List<OrderFullDTO> getOrders(Integer idOrder, Integer idUser,
			Integer idStato, Date dtDatada, Date dtDataA) {
		
		HashMap<String, Object> mapOrder = new HashMap<>();
		mapOrder.put("idOrder", idOrder);
		mapOrder.put("idUser", idUser);
		mapOrder.put("idStato", idStato);
		mapOrder.put("dtDatada", dtDatada);
		mapOrder.put("dtDataA", dtDataA);

		// recupero prodotti
		List<OrderFullDTO> listOrder = getSqlSession().selectList(
				"it.othala.order.queries.listOrder", mapOrder);
		
		return listOrder;
	}

	@Override
	public Integer insertOrder(OrderFullDTO orderFull) {
		
		getSqlSession().insert("it.othala.order.queries.insertOrder",
				orderFull);
		
		return orderFull.getIdOrder();
	}

	@Override
	public void insertOrdersArticles(OrderFullDTO orderFull) {
		
		getSqlSession().insert("it.othala.order.queries.insertOrdersArticles",
				orderFull);
		
		}

	@Override
	public void insertStatesOrders(OrderFullDTO orderFull) {
		
		getSqlSession().insert("it.othala.order.queries.insertStatesOrders",
				orderFull);
		
		}

	@Override
	public void updateStatesOrders(StateOrderDTO stateOrder) {
		
		getSqlSession().insert("it.othala.order.queries.updateStatesOrders",
				stateOrder);
		
	}

}
