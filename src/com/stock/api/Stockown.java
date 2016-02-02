package com.stock.api;

public class Stockown {
	
	
	private String symbol;
	private String companyname;
	private int quantity;
	private double totalcost;
	private String username;
	
	public void setStockown(String symbol, String companyname, String quantity,String totalcost, String username){
		
		this.symbol = symbol;
		this.companyname = companyname;
		this.quantity = Integer.parseInt(quantity);
		this.totalcost = Double.parseDouble(totalcost);
		this.username = username;
		
	}
public String getStocksymbol(){
		
		return symbol;
			
	}
public String getStockcompanyname(){
	
	
	return companyname;
	
}
public int getStockcompanyquantity(){
	
	
	return quantity;
	
}
public double getStocktotalcost(){
	
	
	return totalcost;
}
public String getStockusername(){
	
	return username;
		
}

}
