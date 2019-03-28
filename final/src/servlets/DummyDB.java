package servlets;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import Home.Home;

public class DummyDB {
	int totalCountries;
	//private String data = "the chocolate room, hello,PizzaExpress,Barbeque Nation";
	String data="";
	//private List<String> countries=new ArrayList<String>();
	private List<String> countries;
	
	public DummyDB(String category) {
		countries=new ArrayList<String>();
		data=Home.findres(category);
		StringTokenizer st = new StringTokenizer(data, ",");
		while(st.hasMoreTokens()) {
			countries.add(st.nextToken().trim());
		}
		totalCountries = countries.size();
	}
	
	public List<String> getData(String query) {
		//System.out.println("mein aaaa gaya");
		String country = null;
		//System.out.println("mein aaaa gaya");
		//data=Home.findres();
		//System.out.println(query);
		query = query.toLowerCase();
		List<String> matched = new ArrayList<String>();
		for(int i=0; i<totalCountries; i++) {
			country = countries.get(i).toLowerCase();
			//System.out.println(country);
			if(country.startsWith(query)) {
				//System.out.println(country);
				matched.add(countries.get(i));
			}
		}
		//System.out.println("hello");
		//System.out.println(matched);
		return matched;
	}
}

