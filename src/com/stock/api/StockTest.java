package com.stock.api;
import java.util.GregorianCalendar;
import java.util.ArrayList;
import java.util.Calendar;


public class StockTest {

	public static void main(String[] args){
		
		GregorianCalendar start = new GregorianCalendar(2013,9,4);
		
		GregorianCalendar end = new GregorianCalendar(2015,9,4);
		
		StockDownloader test = new StockDownloader("IBM",start,end);
		
		//ArrayList<GregorianCalendar> dates = test.getDates();
		
		Stock facebook = StockFetcher.getStock("FFIDX");
		System.out.println("Company: FB ");
		System.out.println("Price: " + facebook.getPrice());
		System.out.println("Volume: " + facebook.getVolume()); 
		System.out.println("P/E: " + facebook.getPe());
		System.out.println("EPS: " + facebook.getEps());
		System.out.println("Year Low: " + facebook.getWeek52low());
		System.out.println("Year High: " + facebook.getWeek52high());
		System.out.println("Day Low: " + facebook.getDaylow());
		System.out.println("Day High: " + facebook.getDayhigh());
		System.out.println("50 Day Moving Av: " + facebook.getMovingav50day());
		System.out.println("Market Cap: " + facebook.getMarketcap());
		System.out.println("Company Name: " + facebook.getCompanyname()); 

	}
}
