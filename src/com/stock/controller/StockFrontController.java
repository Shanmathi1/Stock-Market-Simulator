package com.stock.controller;



import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stock.Jdbcdao.BuyVirtualMoney;
import com.stock.Jdbcdao.LoginValidate;
import com.stock.Jdbcdao.RegistrationJDBCImpl;
import com.stock.Jdbcdao.SellStockDAO;
import com.stock.Jdbcdao.Updatestockown;
import com.stock.Jdbcdao.Viewvirtualmoney;
import com.stock.api.Stock;
import com.stock.api.StockFetcher;
import com.stock.api.Stockown;
import com.stock.api.TopCompanies;
import com.stock.entity.TopCompany;
import com.stock.entity.User;
import com.stock.exceptions.DaoException;

/**
 * Servlet implementation class FrontController
 */
public class StockFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		    String uri=request.getRequestURI();
		    
		    //RegistrationForm.action servlet to signup a new user
	if(uri.endsWith("RegistrationForm.action"))
		{
			getRegistrationFormAction(request,response);
		}
	//Login.action servlet to authenticate a new user
	if(uri.endsWith("Login.action"))
	{
		try {
			getLoginAction(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	if(uri.endsWith("Retrievecompanystock.action"))
	{
		getCompanystockAction(request,response);
	}
	
	if(uri.endsWith("BuyStock.action"))
	{
	getBuystockAction(request,response);
	}
	
	if(uri.endsWith("BuyMoney.action"))
	{
	BuyMoneyAction(request,response);
	}
	
	if(uri.endsWith("SellStock.action"))
	{
		sellstockAction(request,response);
	}
	
}
	
	private void sellstockAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException{
		String target = "userPage.jsp";
		
		
		String symbol = request.getParameter("symbol");
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		Double totalcost = Double.parseDouble(request.getParameter("totalcost"));
		
		
		HttpSession session = request.getSession(false);
		String username = (String)session.getAttribute("username");

		try {
			Viewvirtualmoney exvirtualMoney = new Viewvirtualmoney();
			ResultSet rsexistingMoney = exvirtualMoney.displayVirtualMoney(username);
			double exmoney = 0;
			if(rsexistingMoney.next()){
				exmoney = rsexistingMoney.getDouble(4);
			}
			totalcost+=exmoney;
			BuyVirtualMoney virtualMoney = new BuyVirtualMoney();
			virtualMoney.BuyvirtualMoney(username, totalcost);
			SellStockDAO sellstock = new SellStockDAO();
			sellstock.Sellownstock(username, quantity, symbol);
			
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(target);
		try {
			dispatcher.forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	private void getBuystockAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException{
		String target = "userPage.jsp";
		
		
		String symbol = request.getParameter("symbol");
		String companyname = request.getParameter("companyname");
		String quantity = request.getParameter("quantity");
		String totalcost = request.getParameter("totalcost");	
		HttpSession session = request.getSession(false);
		String username = (String)session.getAttribute("username");
		Stockown stock = new Stockown();
		stock.setStockown(symbol, companyname, quantity, totalcost, username);
		System.out.println(stock.getStocksymbol());
		System.out.println(stock.getStockcompanyname());
		System.out.println(stock.getStockcompanyquantity());
		System.out.println(stock.getStocktotalcost());
		System.out.println(stock.getStockusername());
		try {
			Updatestockown update = new Updatestockown(stock);
			update.Updatevirtualmoney(username, totalcost);
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(target);
		try {
			dispatcher.forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	private void BuyMoneyAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException{
		String target = "userPage.jsp";
		
		
		Double money = Double.parseDouble(request.getParameter("money"));
		System.out.println(money);
		HttpSession session = request.getSession(false);
		String username = (String)session.getAttribute("username");
System.out.println(username);
		try {
			Viewvirtualmoney exvirtualMoney = new Viewvirtualmoney();
			ResultSet rsexistingMoney = exvirtualMoney.displayVirtualMoney(username);
			double exmoney = 0;
			if(rsexistingMoney.next()){
				exmoney = rsexistingMoney.getDouble(4);
			}
			money+=exmoney;
			BuyVirtualMoney virtualMoney = new BuyVirtualMoney();
			virtualMoney.BuyvirtualMoney(username, money);
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(target);
		try {
			dispatcher.forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void getCompanystockAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException{
		
		
		String symbolvalue = request.getParameter("SymbolName");
		System.out.println(symbolvalue);
		String target = "StockSymbolsearch.jsp";
			Stock stocksymbol = StockFetcher.getStock(symbolvalue);
			System.out.println(stocksymbol.getCompanyname());
			request.setAttribute("CompanySymbol", symbolvalue);
			request.setAttribute("Companyname", stocksymbol.getCompanyname());
			request.setAttribute("price", stocksymbol.getPrice());
			request.setAttribute("volume", stocksymbol.getVolume());
			request.setAttribute("Pe", stocksymbol.getPe());
			request.setAttribute("Eps", stocksymbol.getEps());
			request.setAttribute("Week52low", stocksymbol.getWeek52low());
			request.setAttribute("Week52high", stocksymbol.getWeek52high());
			request.setAttribute("Daylow", stocksymbol.getDaylow());
			request.setAttribute("Dayhigh", stocksymbol.getDayhigh());
            request.setAttribute("Movingav50day", stocksymbol.getMovingav50day());
            request.setAttribute("Marketcap", stocksymbol.getMarketcap());
			
            RequestDispatcher dispatcher=request.getRequestDispatcher(target);
    		try {
				dispatcher.forward(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
	
	private void getLoginAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, SQLException{
		User user = new User();
		try
		{
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			LoginValidate Lv = new LoginValidate();
			
			user = Lv.LoginCheck(username, password);
			System.out.println(user.getPassword());
						
			if ((username.equals(user.getUserName()))&& (password.equals(user.getPassword()))){
				
				HttpSession session = request.getSession();
				session.setAttribute("username", user.getUserName());
				
				String target = "userPage.jsp";
				request.setAttribute("user", user.getUserName());
				request.setAttribute("money",user.getMoney());
				
				//List<TopCompany>topCompanieslist=TopCompanies.getTopCompanies();
				//request.setAttribute("TopCompanyList",topCompanieslist );
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(target);
				dispatcher.forward(request, response);
				
							}
			else{
				request.setAttribute("message","Username or Password incorrect!! Please try again.");
				String target="login.jsp";
				RequestDispatcher dispatcher=request.getRequestDispatcher(target);
				dispatcher.forward(request, response);
				
			}
			}
		catch(DaoException exception)
		{
			String target = "WEB-INF/jsp/addEvent.jsp";
			request.setAttribute("errorMessage", exception.getMessage());
		}
		
	}
	
	
	private void getRegistrationFormAction(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		    String target="/register.jsp";
		try
		{
			
			User user=new User();
			user.setUserName(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setEmail(request.getParameter("email"));
			LoginValidate Lv = new LoginValidate();
			User dbuser = Lv.LoginCheck(request.getParameter("username"), request.getParameter("password"));
			if(dbuser.getUserName()==null)
			{
				RegistrationJDBCImpl registrationJdbcImpl = new RegistrationJDBCImpl();
				registrationJdbcImpl.addUser(user);	
				request.setAttribute("message", "You are registered successfully! Try logging in now.");
			}
			else{
				request.setAttribute("message", "Username already exists. Try with a different Username!!");
			}
			
			
			
		}
		catch(DaoException exception)
		{
			target="WEB-INF/jsp/addEvent.jsp";
			request.setAttribute("errorMessage", exception.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(target);
		dispatcher.forward(request, response);
		
	}
}
