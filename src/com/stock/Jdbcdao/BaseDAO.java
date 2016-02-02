package com.stock.Jdbcdao;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

import com.stock.exceptions.DaoException;


	public abstract class BaseDAO {
		/**
		 * Database Driver
		 */
		private static String driver;
		/**
		 * Database url
		 */
		private static String url;
		/**
		 * username to connect to Database
		 */
		private static String username;
		/**
		 * password to connect to database
		 */
		private static String password;
		
		/**
		 * @throws DaoException
		 */
		public BaseDAO() throws DaoException {
			 /*
			  * read all database related information
			  * for database.properties file
			  */
			ResourceBundle res = ResourceBundle.getBundle("com.stock.Jdbcdao.Database");
			driver  = res.getString("driver");
			url  = res.getString("url");
			username  = res.getString("username");
			password = res.getString("password");
			
						
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
		 		throw new DaoException(e.getMessage(), e);
			}
		}
		
		/**
		 * @return
		 * @throws DaoException
		 */
		public Connection getConnection( ) throws DaoException {
			try {
				return DriverManager.getConnection(url,username,password);
				
			} catch (SQLException e) {
				
				throw new DaoException(e.getMessage(),e);
			}
		}
		
		/**
		 * @param con
		 * @throws DaoException
		 */
		
		public void closeConnection(Connection con) throws DaoException {
			if( con != null ){
				try {
					con.close();
				} catch (SQLException e) {
					throw new DaoException(e.getMessage(),e);
				}
			}
		}
		
		/**
		 * @param stmt
		 * @throws DaoException
		 */
		public void closeStatement(Statement stmt) throws DaoException {
			if( stmt != null ){
				try {
					stmt.close();
				} catch (SQLException e) {
					throw new DaoException(e.getMessage(),e);
				}
			}
		}
	}

