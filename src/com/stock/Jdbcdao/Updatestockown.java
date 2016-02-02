package com.stock.Jdbcdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.stock.api.Stockown;
import com.stock.exceptions.DaoException;

public class Updatestockown extends BaseDAO{
	
	public Updatestockown(Stockown stock) throws DaoException, SQLException{
		
		
		
		try {
			Connection conn = getConnection();
			PreparedStatement psAdd = null;
			PreparedStatement psAdd2 = null;
			PreparedStatement psAdd3 = null;
			ResultSet rs = null;
			ResultSet rs2 = null;
			ResultSet rs3 = null;
			conn.setAutoCommit(false);
			psAdd=conn.prepareStatement(SQLQueries.CHECK_STOCKOWN);
			psAdd.setString(1, stock.getStocksymbol());
			psAdd.setString(2, stock.getStockusername());
			rs = psAdd.executeQuery();
		if(rs.next()){
			int newquantity = rs.getInt(3)+ stock.getStockcompanyquantity();
			psAdd2=conn.prepareStatement(SQLQueries.INSERT_STOCKOWN);
			psAdd2.setInt(1, newquantity);
			psAdd2.setString(2, stock.getStocksymbol());
			psAdd2.setString(3, stock.getStockusername());
			psAdd2.executeUpdate();
			conn.commit();
		
		}
		
		else{
			int quantity = stock.getStockcompanyquantity();
			double ratepurchased = stock.getStocktotalcost()/quantity;
		
			
			psAdd3=conn.prepareStatement(SQLQueries.UPDATE_STOCKOWN);
			psAdd3.setString(1,stock.getStocksymbol());
			psAdd3.setString(2,stock.getStockcompanyname());
			psAdd3.setInt(3,stock.getStockcompanyquantity());
			psAdd3.setDouble(4,ratepurchased);
			psAdd3.setString(5,stock.getStockusername());
			psAdd3.executeUpdate();
			conn.commit();
		}	
		
		
		
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void Updatevirtualmoney(String username, String totalbuycost) throws SQLException{
		PreparedStatement psAdd = null;
		PreparedStatement psAdd2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		try {
			Connection conn = getConnection();
			conn.setAutoCommit(false);
			psAdd=conn.prepareStatement(SQLQueries.CHECK_USER);
			psAdd.setString(1, username);
			rs = psAdd.executeQuery();
		if(rs.next()){
			Double currentmoney = rs.getDouble(4);
			double totalcost = Double.parseDouble(totalbuycost);
			double updatedvirtualmoney = currentmoney - totalcost;
			psAdd2 = conn.prepareStatement(SQLQueries.UPDATE_VIRTUAL_MONEY);
			psAdd2.setDouble(1, updatedvirtualmoney);
			psAdd2.setString(2,username);
			psAdd2.executeUpdate();
			conn.commit();
			
		}
		
		
		
		
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
