package com.stock.Jdbcdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.stock.entity.User;
import com.stock.exceptions.DaoException;

public class LoginValidate extends BaseDAO{

	public LoginValidate() throws DaoException {
		super();
		// TODO Auto-generated constructor stub
	}

	public User LoginCheck(String username, String password) throws SQLException{
				User user = new User();
		try {
			Connection connection=getConnection();
			ResultSet rs = null;
			PreparedStatement psAdd = null;
			connection.setAutoCommit(false);
			
			
			
			if (username != null && password != null) {
				psAdd=connection.prepareStatement(SQLQueries.CHECK_USER);
				psAdd.setString(1,username);
				rs = psAdd.executeQuery();
				while(rs.next()){
					user.setUserName(rs.getString(1));
					user.setPassword(rs.getString(2));
					user.setMoney(rs.getDouble(4));
				}
				
				
				
				
				}
							
			
				
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		}}
	
	
	

