package it.othala.dao.typehandlers;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class UtilDateTypeHandler implements TypeHandler<java.util.Date> {

	private static Log log = LogFactory.getLog(UtilDateTypeHandler.class);

	@Override
	public java.util.Date getResult(ResultSet rs, String columnName)
			throws SQLException {
		// TODO Auto-generated method stub

		Date date = rs.getDate(columnName);
		return getDate(date);

	}

	@Override
	public java.util.Date getResult(CallableStatement cs, int columnIndex)
			throws SQLException {
		// TODO Auto-generated method stub
		Date date = cs.getDate(columnIndex);
		return getDate(date);
	}

	@Override
	public java.util.Date getResult(ResultSet rs, int columnIndex)
			throws SQLException {
		// TODO Auto-generated method stub
		Date date = rs.getDate(columnIndex);
		return getDate(date);
	}

	@Override
	public void setParameter(PreparedStatement ps, int i, java.util.Date value,
			JdbcType arg3) throws SQLException {
		// TODO Auto-generated method stub
		Date date = null;
		java.util.Date dateUtil = null;

		if (value != null) {
			dateUtil = (java.util.Date) value;

			date = new Date(dateUtil.getTime());

		}

		ps.setDate(i, date);

		if (log.isTraceEnabled()) {
			log.trace("columnIndex=" + i);
			log.trace("date value=" + date);
			log.trace("dateUtil value=" + dateUtil);
		}
	}

	private java.util.Date getDate(Date date) {
		java.util.Date dateUtil = null;

		if (date != null) {

			dateUtil = new Date(date.getTime());
		}

		if (log.isTraceEnabled()) {
			log.trace("date value=" + date);
			log.trace("dateUtil value=" + dateUtil);
		}

		return dateUtil;

	}

}
