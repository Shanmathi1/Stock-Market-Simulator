package com.stock.Jdbcdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.stock.exceptions.DaoException;

public class SellStockDAO extends BaseDAO {

	public SellStockDAO() throws DaoException {
		super();
		// TODO Auto-generated constructor stub
	}

	public void Sellownstock(String username,int newQuantity,String Symbol) throws SQLException{
		
		PreparedStatement psAdd = null;
		ResultSet rs = null;
		try {
			
		
			Connection conn = getConnection();
			conn.setAutoCommit(false);
			psAdd=conn.prepareStatement(SQLQueries.GET_COMPANY_STOCKOWN);
			psAdd.setString(1, username);
			psAdd.setString(2, Symbol);
			rs = psAdd.executeQuery();
			int Quantity=0;
			if(rs.next()){
				Quantity = rs.getInt(3);
				System.out.println(Quantity);
			}
			Quantity-=newQuantity;
			if (Quantity==0)
			{
				psAdd=conn.prepareStatement(SQLQueries.DELETE_COMPANY);
				psAdd.setString(1, username);
				psAdd.setString(2, Symbol);
				psAdd.executeUpdate();
				conn.commit();
			}
			else
			{
				psAdd=conn.prepareStatement(SQLQueries.INSERT_STOCKOWN);
				psAdd.setInt(1, Quantity);
				psAdd.setString(2, Symbol);
				psAdd.setString(3, username);
				psAdd.executeUpdate();
				conn.commit();
			}
			
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
}
