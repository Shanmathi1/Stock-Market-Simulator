package com.stock.Jdbcdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.mysql.jdbc.Statement;
import com.stock.entity.User;
import com.stock.exceptions.DaoException;

public class RegistrationJDBCImpl extends BaseDAO {

	public RegistrationJDBCImpl() throws DaoException {
		super();
	}
	
	public void addUser(User user) throws DaoException {
		Connection connection=getConnection();
		System.out.println("Database connected"+user.getUserName());
		PreparedStatement psAdd = null;
		try
		{
			connection.setAutoCommit(false);
			psAdd=connection.prepareStatement(SQLQueries.ADD_USER);
			psAdd.setString(1,user.getUserName());
			psAdd.setString(2, user.getPassword());
			psAdd.setString(3, user.getEmail());
			psAdd.executeUpdate();
			connection.commit();

		}
		catch(SQLException exception)
		{
			throw new DaoException("Unable to add activity"+exception,exception.getCause());
		}
		finally
		{
			closeConnection(connection);
			closeStatement(psAdd);
		}
	}
	}

