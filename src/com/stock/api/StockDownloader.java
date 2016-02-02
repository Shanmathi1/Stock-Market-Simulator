package com.stock.api;
import java.util.GregorianCalendar;
import java.util.Calendar;
import java.util.Date;
import java.util.ArrayList;
import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Scanner;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;

/*
 * Program that fetches historic data
 */
public class StockDownloader{
	
	public static final int DATE = 0;
	public static final int OPEN = 1;
	public static final int HIGH = 2;
	public static final int LOW = 3;
	public static final int CLOSE = 4;
	public static final int VOLUME = 5;
	public static final int ADJCLOSE = 6;
	
	private ArrayList<GregorianCalendar> dates;
	private ArrayList<Double> opens;
	private ArrayList<Double> highs;
	private ArrayList<Double> lows;
	private ArrayList<Double> closes;
	private ArrayList<Integer> volumes;
	private ArrayList<Double> adjCloses;
	
	public StockDownloader(String symbol, GregorianCalendar start, GregorianCalendar end){
		dates = new ArrayList<GregorianCalendar>();
		opens = new ArrayList<Double>();
		highs = new ArrayList<Double>();
		lows = new ArrayList<Double>();
		closes = new ArrayList<Double>();
		volumes = new ArrayList<Integer>();
		adjCloses = new ArrayList<Double>();
		
		String url = "http://real-chart.finance.yahoo.com/table.csv?s="+symbol+ 
				"&d="+end.get(Calendar.MONTH)+
				"&e="+end.get(Calendar.DAY_OF_WEEK)+
				"&f="+end.get(Calendar.YEAR)+
				"&g=d&a="+start.get(Calendar.MONTH)+
				"&b="+start.get(Calendar.DAY_OF_MONTH)+
				"&c="+start.get(Calendar.YEAR)+"&ignore=.csv";

		try{
			URL fin = new URL(url);
			BufferedInputStream bis = new BufferedInputStream(fin.openStream());
	        FileOutputStream fis = new FileOutputStream("src/test.csv");
	        byte[] buffer = new byte[1024];
	        int count=0;
	        while((count = bis.read(buffer,0,1024)) != -1)
	        {
	            fis.write(buffer, 0, count);
	        }
	        fis.close();
	        bis.close();
	        System.out.println("File Downloaded");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
	try{
		
		URL yahoofin = new URL(url);
		URLConnection data = yahoofin.openConnection();
		Scanner input = new Scanner(data.getInputStream());
		
		if(input.hasNext())//skip header
			input.nextLine();
		
		while(input.hasNextLine()){
			// each line from csv file
			String line = input.nextLine();
			String[] words = line.split(",");
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = df.parse(words[0]);
			GregorianCalendar cal = new GregorianCalendar();
			cal.setTime(date);
			
			// store data in separate ArrayList
			dates.add(cal);
			opens.add(Double.parseDouble(words[1]));
			highs.add(Double.parseDouble(words[2]));
			lows.add(Double.parseDouble(words[3]));
			closes.add(Double.parseDouble(words[4]));
			volumes.add(Integer.parseInt(words[5]));
			adjCloses.add(Double.parseDouble(words[6]));
			
			System.out.println(line);
			
		}
		
	}
	catch(Exception e){
		System.err.println(e);
	}
	
	}
	
	public ArrayList<GregorianCalendar> getDates(){
		return dates;
	}
	
	public ArrayList<Double> getOpens(){
		return opens;
	}
	
	public ArrayList<Double> getHighs(){
		return highs;
	}
	
	public ArrayList<Double> getLows(){
		return lows;
	}
	
	public ArrayList<Double> getCloses(){
		return closes;
	}
	
	public ArrayList<Integer> getVolumes(){
		return volumes;
	}
	
	public ArrayList<Double> getAdjCloses(){
		return adjCloses;
	}
}