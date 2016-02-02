package com.stock.Jdbcdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.stock.exceptions.DaoException;



public class BuyVirtualMoney extends BaseDAO {

	public BuyVirtualMoney()throws DaoException {
		// TODO Auto-generated constructor stub
		
			super();
			// TODO Auto-generated constructor stub
		}
	public ResultSet BuyvirtualMoney(String username,Double Money) throws SQLException{
		
		PreparedStatement psAdd = null;
		ResultSet rs = null;
		try {
			Connection conn = getConnection();
			conn.setAutoCommit(false);
			psAdd=conn.prepareStatement(SQLQueries.UPDATE_VIRTUAL_MONEY);
			psAdd.setDouble(1, Money);
			psAdd.setString(2, username);
			
			psAdd.executeUpdate();
			conn.commit();
			
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

		
	}
	}


