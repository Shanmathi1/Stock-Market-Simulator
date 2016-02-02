package com.stock.entity;

public class TopCompany {
	
	String companyName;
	String Symbol;
	double latestValue;
	String openValue;
	String closeValue;
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
		
	}
	public String getSymbol() {
		return Symbol;
	}
	public void setSymbol(String symbol) {
		Symbol = symbol;
	}
	public double getLatestValue() {
		return latestValue;
	}
	public void setLatestValue(double latestValue) {
		this.latestValue = latestValue;
	}
	public String getOpenValue() {
		return openValue;
	}
	public void setOpenValue(String openValue) {
		this.openValue = openValue;
	}
	public String getCloseValue() {
		return closeValue;
	}
	public void setCloseValue(String closeValue) {
		this.closeValue = closeValue;
	}

}
