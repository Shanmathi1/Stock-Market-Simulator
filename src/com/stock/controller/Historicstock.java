package com.stock.controller;
/*
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Historicstock {
	public static final int DATE = 0;
	public static final int OPEN = 1;
	public static final int HIGH = 2;
	public static final int LOW = 3;
	public static final int CLOSE = 4;
	public static final int VOLUME = 5;
	public static final int ADJCLOSE = 6;
	
	
	private ArrayList<GregorianCalendar> Dates;
	private ArrayList<Double> Opens;
	private ArrayList<Double> Highs;
	private ArrayList<Double> Lows;
	private ArrayList<Double> Closes;
	private ArrayList<Integer> Volumes;
	private ArrayList<Double> AdjCloses;
	
	public Historicstock(String symbol, GregorianCalendar start, GregorianCalendar end){
	
		Dates = new ArrayList<GregorianCalendar>();
		Opens = new ArrayList<Double>();
		Highs = new ArrayList<Double>();
		Lows = new ArrayList<Double>();
		Closes = new ArrayList<Double>();
		Volumes = new ArrayList<Integer>();
		AdjCloses = new ArrayList<Double>();
		
		
	String url = "http://real-chart.finance.yahoo.com/table.csv?s="+
	symbol+
	"&a="+
	start.get(Calendar.MONTH)+
	"&b="+
	start.get(Calendar.DAY_OF_MONTH)+
	"&c="+
	start.get(Calendar.YEAR)+
	"&d="+end.get(Calendar.MONTH)+
	"&e="+
	end.get(Calendar.DAY_OF_MONTH)+
	"&f="+
	end.get(Calendar.YEAR)+
	"&g=d&ignore=.csv";
	
	try {
		URL yahoohist = new URL(url);
		URLConnection data = yahoohist.openConnection();
		Scanner input = new Scanner(data.getInputStream());
		if(input.hasNext())
		input.nextLine();
		
		//input.useDelimiter("\n");
		while(input.hasNext())
		{
		input.useDelimiter(",");
		ArrayList<String> t = new ArrayList<String>();
		t.add(input.next());
	System.out.println(t.get(0));
		
				//String line = input.nextLine();
		//System.out.println(line);
		
		
		}	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	}

	
	
	

}
*/