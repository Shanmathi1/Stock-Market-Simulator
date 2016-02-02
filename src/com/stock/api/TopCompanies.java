package com.stock.api;


import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;

import com.stock.entity.TopCompany;

import java.util.ArrayList;
import java.util.List;

public class TopCompanies {

	
	
	private static ArrayList<TopCompany> topCompanies = new ArrayList<TopCompany>();
	public static ArrayList<TopCompany> getTopCompanies(){
		TopCompany[] topcompany = new TopCompany[12];
		try{
			
			URL yahoofin = new URL("http://download.finance.yahoo.com/d/quotes.csv?s=%40%5EDJI,DOV,GOOG,YHOO,IBM,FEDIX,AAPL,ORCL,MSFT,ERIC,INFY,WFC,TTM&f=nsl1op&e=.csv");

			URLConnection data = yahoofin.openConnection();
			Scanner input = new Scanner(data.getInputStream());
			int j=0;
			
			while(input.hasNextLine()){
				// each line from csv file
				String line = input.nextLine().replace("\"", "");
				String[] word = line.split(",");
				
				
				int i=0;
			    
				System.out.println(topcompany.length);
				
				topcompany[j]= new TopCompany();
					topcompany[j].setCompanyName(word[i]);
					topcompany[j].setSymbol(word[i+1]);
					topcompany[j].setLatestValue(Double.parseDouble(word[i+2]));
					topcompany[j].setOpenValue(word[i+3]);
					topcompany[j].setCloseValue(word[i+4]);
					
				//	topCompanies.addAll(0, topcompany)
			topCompanies.add(topcompany[j]);
			
			j++;
				//topCompanies.add(topcompany);
				System.out.println(topCompanies.get(1).getCompanyName());
				System.out.println(topCompanies.get(1).getSymbol());
				System.out.println(topCompanies.get(1).getLatestValue());
				System.out.println(topCompanies.get(1).getOpenValue());
				System.out.println(topCompanies.get(1).getCloseValue());
							
				
			}
			
			
		}
		catch(Exception e){
			System.err.println(e);
		}
		return topCompanies;
}
		
	public static void main(String args[]){
		ArrayList<TopCompany> topCompanies = getTopCompanies();
		//System.out.println(topCompanies.get(0).getCompanyName());
		
	}
	
}

	

