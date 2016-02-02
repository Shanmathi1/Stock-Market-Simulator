package com.stock.Jdbcdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.stock.exceptions.DaoException;

public class Viewownstock extends BaseDAO {

	

	
	public Viewownstock() throws DaoException {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResultSet Displayownstock(String username) throws SQLException{
		
		PreparedStatement psAdd = null;
		ResultSet rs = null;
		try {
			Connection conn = getConnection();
			conn.setAutoCommit(false);
			psAdd=conn.prepareStatement(SQLQueries.RETRIEVE_STOCKOWN);
			psAdd.setString(1, username);
			rs = psAdd.executeQuery();
			
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
		
		
	}
	
	
}
