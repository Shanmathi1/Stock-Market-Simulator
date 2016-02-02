package com.stock.entity;

import java.util.ArrayList;
import java.util.List;

public class User {
 private String userName;
 private String password;
 private String email;
 private double money;
 private List<Stock> Stocks = new ArrayList<Stock>();
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}

public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getEmail() {
	return email;
}
public double getMoney(){
	return money;
	
}
public void setEmail(String email) {
	this.email = email;
}
public List<Stock> getStocks() {
	return Stocks;
}
public void setStocks(List<Stock> stocks) {
	Stocks = stocks;
}
public void setMoney(Double money) {
	this.money = money;
} 
 
}
