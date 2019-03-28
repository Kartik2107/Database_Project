package Home;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

public class Home {

	static Connection getConnection() {
		String dbURL = "jdbc:postgresql://localhost/project2";
		String dbUser = "postgres";
		String dbPass = "12345";
		Connection connection=null;
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
		} catch(ClassNotFoundException cnfe){
			System.out.println("JDBC Driver not found");
		} catch(SQLException sqle){
			System.out.println("Error in getting connetcion from the database");
		}

		return connection;
	}

	static void closeConnection(Connection connection) {
		try{
			connection.close();
		} catch(SQLException sqle) {
			System.out.println("Error in close database connetcion");
		}
	}
		
	public static void addPhoto(String first_name,InputStream inputStream){

		Connection connection=null;

		try{
			System.out.println("bach gye");
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into product_images values(7,?)",ResultSet.TYPE_SCROLL_INSENSITIVE);
//			pstmt.setString(2,first_name);
			if (inputStream != null) {
				pstmt.setBinaryStream(1,inputStream);
			}
			
			int rs= pstmt.executeUpdate();
            
			/*	while (rs.next()){

			}*/

		} catch(SQLException sqle){
			System.out.println("SQL exception in add photo"+sqle);
		} finally{
			closeConnection(connection);
		}

		return;
	}
	
	public static int get_counter_pfs() {
		int res = 0;

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select sum(units) from products natural join inventory",ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				res=rs.getInt(1);
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting localities  in function getlocalities");
		} finally{
			closeConnection(connection);
		}
		return res;

	}
	
	public static int get_counter_stn() {
		int res = 0;

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select sum(units_sold) from trade",ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				res=rs.getInt(1);
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting localities  in function getlocalities");
		} finally{
			closeConnection(connection);
		}
		return res;

	}
	
	public static int get_counter_ru() {
		int res = 0;

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select count(user_id) from users",ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				res=rs.getInt(1);
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting localities  in function getlocalities");
		} finally{
			closeConnection(connection);
		}
		return res;

	}
	public static int get_counter_money() {
		int res = 0;

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select sum(selling_price) from trade",ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				res=rs.getInt(1);
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting localities  in function getlocalities");
		} finally{
			closeConnection(connection);
		}
		return res;

	}
	
	public static List<item_details> filter_and_search_res_Electronics(String cost,String used,String subcat,String name){
		//cost l2h h2l ""
		//used n2o o2n ""
		
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q;
			
			q="select product_id,product_name,category,price_offered,time_used,subcat,seller_id,name,encode(T.image,'base64') from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ " natural join category_electronics "
					+ " natural join users where user_id=seller_id and T.product_id=product_id";
			if(!(name.isEmpty() || name.matches(""))) {
				q+=" and product_name='"+name+"' ";
			}
			if(!subcat.isEmpty()) {
				q+=" and subcat='"+subcat+"' ";
			}
			
			if(cost.isEmpty()) {
				if(used.matches("n2o")) {
					q+=" order by time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=" order by time_used desc";
				}
			}
			else {
				if(cost.matches("l2h")) {
					q+=" order by price_offered asc";
					
				}
				else if(cost.matches("h2l")) {
					q+=" order by price_offered desc";
				}
				if(used.matches("n2o")) {
					q+=",time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=",time_used desc";
				}
			}
			System.out.println(q);
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs1= pstmt1.executeQuery();
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_category(rs1.getString(3));
				obj.set_price(rs1.getInt(4));
				obj.set_used(rs1.getInt(5));
				obj.set_subcat(rs1.getString(6));
				obj.set_seller_id(rs1.getInt(7));
				obj.set_seller_name(rs1.getString(8));
				obj.set_product_image(rs1.getString(9));
				item_list.add(obj);
			}
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function filter_and_search_res_electornics"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}
	
	
	public static List<item_details> filter_and_search_res_Food(String cost,String used,String name){
		//cost l2h h2l ""
		//used n2o , new means less usage time ""
		
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q;
			
			q="select product_id,product_name,price_offered,time_used,seller_id,name,encode(T.image,'base64'),category from products natural join "
					+ "inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ "natural join users where user_id=seller_id and category='Food' and T.product_id=product_id ";
			
			
			if(!(name.isEmpty() || name.matches(""))) {
				q+=" and product_name='"+name+"' ";
			}
			if(cost.isEmpty()) {
				if(used.matches("n2o")) {
					q+="order by time_used asc";
				}
				else if(used.matches("o2n")) {
					q+="order by time_used desc";
				}
			}
			else {
				if(cost.matches("l2h")) {
					q+="order by price_offered asc";
					
				}
				else if(cost.matches("h2l")) {
					q+="order by price_offered desc";
				}
				if(used.matches("n2o")) {
					q+=",time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=",time_used desc";
				}
			}
			System.out.println(q);
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs1= pstmt1.executeQuery();
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_price(rs1.getInt(3));
				obj.set_used(rs1.getInt(4));
				
				obj.set_seller_id(rs1.getInt(5));
				obj.set_seller_name(rs1.getString(6));
				obj.set_product_image(rs1.getString(7));
				obj.set_category(rs1.getString(8));
				item_list.add(obj);
			}
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function filter_and_search_res_food "+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}
	
	public static List<item_details> filter_and_search_res_cycle(String cost,String used,String gear,String Shockers,String Breaks,String name){
		//cost l2h h2l ""
		//used n2o o2n ""
		System.out.println("home function filter cycles");
		System.out.println("used->"+used);
		System.out.println("gear->"+gear);
		System.out.println("Shockers->"+Shockers);
		System.out.println("Brakes->"+Breaks);
		
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q;
			
			q="select product_id,product_name,category,price_offered,time_used,gears,brakes,shockers,seller_id,name,encode(T.image,'base64') from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "

					+ " natural join category_cycles natural join users where user_id=seller_id and T.product_id = product_id ";
			if(!(name.isEmpty() || name.matches(""))) {
				q+=" and product_name='"+name+"' ";
			}
			if(!gear.isEmpty()) {
				q+=" and gears= '"+gear+"' ";
			}
			if(!Shockers.isEmpty()) {
				q+="and shockers= '"+Shockers+"' ";
			}
			if(!Breaks.isEmpty()) {
				q+="and brakes= '"+Breaks+"' ";
			}
			
			if(cost.isEmpty()) {
				if(used.matches("n2o")) {
					q+=" order by time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=" order by time_used desc";
				}
			}
			else {
				if(cost.matches("l2h")) {
					q+=" order by price_offered asc";
					
				}
				else if(cost.matches("h2l")) {
					q+=" order by price_offered desc";
				}
				if(used.matches("n2o")) {
					q+=",time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=",time_used desc";
				}
			}
			System.out.println(q);
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs1= pstmt1.executeQuery();
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_category(rs1.getString(3));
				obj.set_price(rs1.getInt(4));
				obj.set_used(rs1.getInt(5));
				
				obj.set_gears(rs1.getString(6));
				obj.set_brakes(rs1.getString(7));
				obj.set_shockers(rs1.getString(8));
				
				obj.set_seller_id(rs1.getInt(9));
				obj.set_seller_name(rs1.getString(10));
				obj.set_product_image(rs1.getString(11));
				item_list.add(obj);
			}
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function filter_and_search_res_cycle"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}

	public static List<item_details> filter_and_search_res_mattress(String cost,String used,String roll,String name){
		//cost l2h h2l ""
		//used n2o o2n ""
		
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q;
			
			q="select product_id,product_name,category,price_offered,time_used,roll,seller_id,name,encode(T.image,'base64') from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					
					+ " natural join category_mattress natural join users where user_id=seller_id and T.product_id = product_id";
			if(!(name.isEmpty() || name.matches(""))) {
				q+=" and product_name='"+name+"' ";
			}
			if(!roll.isEmpty()) {
				q+=" and roll= '"+roll+"' ";
			}
			
			if(cost.isEmpty()) {
				if(used.matches("n2o")) {
					q+=" order by time_used asc ";
				}
				else if(used.matches("o2n")) {
					q+=" order by time_used desc";
				}
			}
			else {
				if(cost.matches("l2h")) {
					q+=" order by price_offered asc";
					
				}
				else if(cost.matches("h2l")) {
					q+=" order by price_offered desc";
				}
				if(used.matches("n2o")) {
					q+=",time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=",time_used desc";
				}
			}
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs1= pstmt1.executeQuery();
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_category(rs1.getString(3));
				obj.set_price(rs1.getInt(4));
				obj.set_used(rs1.getInt(5));
				
				obj.set_roll(rs1.getString(6));
				
				obj.set_seller_id(rs1.getInt(7));
				obj.set_seller_name(rs1.getString(8));
				obj.set_product_image(rs1.getString(9));
				item_list.add(obj);
			}
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function filter_and_search_res_mattress"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}

	public static List<item_details> filter_and_search_res_books(String cost,String used,String academic, String branch,String y,String name){
		//cost l2h h2l ""
		//used n2o o2n ""
		int year = 0;
		if(!y.isEmpty()) {
			 year=Integer.parseInt(y);
		}
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q;
			
			q="select product_id,product_name,category,price_offered,time_used,year,academic,branch,seller_id,name,encode(T.image,'base64') from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ "natural join category_books natural join users where user_id=seller_id and T.product_id = product_id ";
			if(!(name.isEmpty() || name.matches(""))) {
				q+=" and product_name='"+name+"' ";
			}
			if(!academic.isEmpty()) {
				q+="and academic= '"+academic+"' ";
				if(!(year==0)) {
					q+="and year= "+year+" ";
				}
			}
			if(!branch.isEmpty()) {
				q+="and branch= '"+branch+"' ";
			}

			
			if(cost.isEmpty()) {
				if(used.matches("n2o")) {
					q+=" order by time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=" order by time_used desc";
				}
			}
			else {
				if(cost.matches("l2h")) {
					q+=" order by price_offered asc";
					
				}
				else if(cost.matches("h2l")) {
					q+=" order by price_offered desc";
				}
				if(used.matches("n2o")) {
					q+=",time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=",time_used desc";
				}
			}
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs1= pstmt1.executeQuery();
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_category(rs1.getString(3));
				obj.set_price(rs1.getInt(4));
				obj.set_used(rs1.getInt(5));
				
				obj.set_book_year(rs1.getInt(6));
				obj.set_book_academic(rs1.getString(7));
				obj.set_book_branch(rs1.getString(8));
				
				obj.set_seller_id(rs1.getInt(9));
				obj.set_seller_name(rs1.getString(10));
				obj.set_product_image(rs1.getString(11));
				item_list.add(obj);
			}
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function filter_and_search_res_book"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}

	public static List<item_details> filter_and_search_res_others(String cost,String used,String name){
		//cost l2h h2l ""
		//used n2o o2n ""
		
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q;
			
			q="select product_id,product_name,price_offered,time_used,seller_id,name,encode(T.image,'base64'),category from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ " natural join users where user_id=seller_id and category='Others' and T.product_id = product_id";
			
			if(!(name.isEmpty() || name.matches(""))) {
				q+=" and product_name='"+name+"' ";
			}
			if(cost.isEmpty()) {
				if(used.matches("n2o")) {
					q+=" order by time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=" order by time_used desc";
				}
			}
			else {
				if(cost.matches("l2h")) {
					q+=" order by price_offered asc";
					
				}
				else if(cost.matches("h2l")) {
					q+=" order by price_offered desc";
				}
				if(used.matches("n2o")) {
					q+=",time_used asc";
				}
				else if(used.matches("o2n")) {
					q+=",time_used desc";
				}
			}
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs1= pstmt1.executeQuery();
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_price(rs1.getInt(3));
				obj.set_used(rs1.getInt(4));
				
				obj.set_seller_id(rs1.getInt(5));
				obj.set_seller_name(rs1.getString(6));
				obj.set_product_image(rs1.getString(7));
				obj.set_category(rs1.getString(8));

				item_list.add(obj);
			}
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function filter_and_search_res_others"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}


		
	public static List<item_details> top_hits_electronics(){
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q="select product_id,product_name,category,price_offered,time_used,subcat,seller_id,name,encode(T.image,'base64') from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ "natural join category_electronics natural join users where user_id=seller_id and category='Electronics' and T.product_id=product_id order by time_added desc limit 9";
			
		//		   q="select product_id,product_name,price_offered,time_used,seller_id,name,encode(T.image,'base64') from products natural join "
		//			+ "inventory natural join "
		//			+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
		//			+ "natural join users where user_id=seller_id and category='Food' and T.product_id=product_id ";
			
			
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
			ResultSet rs1= pstmt1.executeQuery();
			
			
			
			
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_category(rs1.getString(3));
				obj.set_price(rs1.getInt(4));
				obj.set_used(rs1.getInt(5));
				obj.set_subcat(rs1.getString(6));
				obj.set_seller_id(rs1.getInt(7));
				obj.set_seller_name(rs1.getString(8));
				obj.set_product_image(rs1.getString(9));
				item_list.add(obj);
			}
			
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function tophits_electornics"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}
	
	public static List<item_details> top_hits_cycle(){
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q="select product_id,product_name,category,price_offered,time_used,gears,brakes,shockers,seller_id,name,encode(T.image,'base64') from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ "natural join category_cycles natural join users where user_id=seller_id and category='Cycle' and T.product_id = product_id order by time_added desc limit 9";
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
			ResultSet rs1= pstmt1.executeQuery();
			
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_category(rs1.getString(3));
				obj.set_price(rs1.getInt(4));
				obj.set_used(rs1.getInt(5));
				
				obj.set_gears(rs1.getString(6));
				obj.set_brakes(rs1.getString(7));
				obj.set_shockers(rs1.getString(8));
				
				obj.set_seller_id(rs1.getInt(9));
				obj.set_seller_name(rs1.getString(10));
				obj.set_product_image(rs1.getString(11));
				item_list.add(obj);
			}
			
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in top hit cycles"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}

	public static List<item_details> top_hits_mattress(){
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q="select product_id,product_name,category,price_offered,time_used,roll,seller_id,name,encode(T.image,'base64') from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ " natural join category_mattress natural join users where user_id=seller_id and category='Mattress' and T.product_id = product_id order by time_added desc limit 9";
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
			ResultSet rs1= pstmt1.executeQuery();
			
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_category(rs1.getString(3));
				obj.set_price(rs1.getInt(4));
				obj.set_used(rs1.getInt(5));
				
				obj.set_roll(rs1.getString(6));
				
				obj.set_seller_id(rs1.getInt(7));
				obj.set_seller_name(rs1.getString(8));
				obj.set_product_image(rs1.getString(9));
				item_list.add(obj);
			}
			
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function top hits mattress"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}

	public static List<item_details> top_hits_books(){
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q="select product_id,product_name,category,price_offered,time_used,year,academic,branch,seller_id,name,encode(T.image,'base64')from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ " natural join category_books natural join users where user_id=seller_id and category='Book' and T.product_id = product_id order by time_added desc limit 9";
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
			ResultSet rs1= pstmt1.executeQuery();
			
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_category(rs1.getString(3));
				obj.set_price(rs1.getInt(4));
				obj.set_used(rs1.getInt(5));
				
				obj.set_book_year(rs1.getInt(6));
				obj.set_book_academic(rs1.getString(7));
				obj.set_book_branch(rs1.getString(8));
				
				obj.set_seller_id(rs1.getInt(9));
				obj.set_seller_name(rs1.getString(10));
				obj.set_product_image(rs1.getString(11));
				item_list.add(obj);
			}
			
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function books top hits"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}

	public static List<item_details> top_hits_food(){
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q="select product_id,product_name,price_offered,time_used,seller_id,name,encode(T.image,'base64'),category from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ " natural join users where user_id=seller_id and category='Food' and T.product_id = product_id order by time_added desc limit 9";
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
			ResultSet rs1= pstmt1.executeQuery();
			
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_price(rs1.getInt(3));
				obj.set_used(rs1.getInt(4));
				
				obj.set_seller_id(rs1.getInt(5));
				obj.set_seller_name(rs1.getString(6));
				obj.set_product_image(rs1.getString(7));
				obj.set_category(rs1.getString(8));
				item_list.add(obj);
			}
			
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function food top hits"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}
	
	public static List<item_details> top_hits_others(){
		List<item_details> item_list=new ArrayList<>();
		PreparedStatement pstmt1;
		Connection connection=null;
		try {
			connection=getConnection();
			String q="select product_id,product_name,price_offered,time_used,seller_id,name,encode(T.image,'base64'),category from products natural join inventory natural join "
					+ "(select product_id,image from product_images natural join (select product_id,min(time_image) from product_images group by product_id)as U where U.min=time_image) as T "
					+ " natural join users where user_id=seller_id and category='Others' and T.product_id = product_id order by time_added desc limit 9";
			pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
			ResultSet rs1= pstmt1.executeQuery();
			
			while (rs1.next()){
				item_details obj=new item_details();
				obj.set_product_id(rs1.getInt(1));
				obj.set_product_name(rs1.getString(2));
				obj.set_price(rs1.getInt(3));
				obj.set_used(rs1.getInt(4));
				
				obj.set_seller_id(rs1.getInt(5));
				obj.set_seller_name(rs1.getString(6));
				obj.set_product_image(rs1.getString(7));
				
				obj.set_category(rs1.getString(8));
				item_list.add(obj);
			}
			
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in top hits others"+sqle);
		} finally{
			closeConnection(connection);
		}
		return item_list;
	}

	
	public static String pics() {
		System.out.println("aa gya");
		Connection connection=null;
		String imgBytes = null;
		try{
			connection=getConnection();
			PreparedStatement ps = connection.prepareStatement("SELECT encode(image,'base64') FROM product_images WHERE product_id = 5",ResultSet.TYPE_SCROLL_INSENSITIVE);
//			System.out.println("hellohello");
			//ps.setString(1, id);
		//	System.out.println(ps.toString());
			ResultSet rs = ps.executeQuery();
			if (rs != null) {
				rs.next();
			        imgBytes = rs.getString(1);
//			        System.out.println("whups");
			        // use the data in some way here
			}
			ps.close();
		
		} catch(SQLException sqle){
			System.out.println("SQL exception in pics->"+sqle);
		} finally{
			closeConnection(connection);
		}
        return imgBytes;
	}


public static void addAccount(String id,String name,String phone,String email,String hostel,String password,InputStream a1){
		
		Connection connection=null;
		Connection connection2=null;
		
		try{
			connection=getConnection();
			connection2=getConnection();
			PreparedStatement pstmt2=connection2.prepareStatement("insert into accounts values(?,?,0)",ResultSet.TYPE_SCROLL_INSENSITIVE);
			pstmt2.setInt(1, Integer.parseInt(id));
			pstmt2.setString(2, password);
			pstmt2.executeUpdate();
			PreparedStatement pstmt= connection.prepareStatement("insert into users values(?,?,?,?,?,0,0,?)",ResultSet.TYPE_SCROLL_INSENSITIVE);
			pstmt.setInt(1, Integer.parseInt(id));
			pstmt.setString(2, name);
			pstmt.setString(3,phone);
			pstmt.setString(4,email);
			pstmt.setString(5,hostel);
			pstmt.setBinaryStream(6, a1);
//			if (inputStream != null) {
//				pstmt.setBinaryStream(6,inputStream);
//			}
			
			//System.out.println(id + " " + password );
			
			pstmt.executeUpdate();
			
		
			
		} catch(SQLException sqle){
			System.out.println("SQL exception in addAccount->"+sqle);
		} finally{
			closeConnection(connection);
			closeConnection(connection2);
		}
		
		return;
	}

public static int checkPassword(String id,String password){
		int res=0;
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select password1 from account where user_id=?",ResultSet.TYPE_SCROLL_INSENSITIVE);
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			//System.out.println(id + " " + password );
			while (rs.next()){
			
				String s = rs.getString(1);
				//System.out.println("s= "+s);

				
				if(s.equals(password))
				{	res=1;
				//System.out.println(res);
				}
			}
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting top courses list");
		} finally{
			closeConnection(connection);
		}
		
		return res;
	}


public static void ad_post(item_details obj,String cat){
	
	PreparedStatement pstmt1;
	PreparedStatement pstmt2;
	PreparedStatement pstmt3;
	PreparedStatement pstmt4;
	Connection connection=null;
	try {
		connection=getConnection();
		String q_prod= "insert into products (product_name,category,description,price_offered,time_added,time_used)values(?,?,?,?,current_timestamp,?)";
		String q_inventory = "insert into inventory values((select product_id from products where time_added = (select max(time_added) from products)),?,?)" ;
		String q_images = "insert into product_images values((select product_id from products where time_added = (select max(time_added) from products)),?,current_timestamp)" ;
		System.out.println(q_prod);
		System.out.println(q_inventory);
		System.out.println(q_images);
		
		pstmt1= connection.prepareStatement(q_prod,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt1.setString(1, obj.get_product_name());
		pstmt1.setString(2, obj.get_category());
		pstmt1.setString(3, obj.get_description());
		pstmt1.setDouble(4, obj.get_price());
		pstmt1.setInt(5, obj.get_used());
		
		pstmt2= connection.prepareStatement(q_inventory,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt2.setInt(1, obj.get_seller_id());
		pstmt2.setInt(2,obj.get_units());
		
		pstmt1.executeUpdate();
		pstmt2.executeUpdate();
		System.out.println(obj.inp1.size());
		for(int i=0;i<obj.inp1.size();i++) {
			pstmt3= connection.prepareStatement(q_images,ResultSet.TYPE_SCROLL_INSENSITIVE);
			pstmt3.setBinaryStream(1,obj.inp1.get(i));
			pstmt3.executeUpdate();
		}
		
		String q_category ;
		if(cat.equals("1")) {
			q_category = "insert into category_electronics values((select product_id from products where time_added = (select max(time_added) from products)),?)" ;
			pstmt4= connection.prepareStatement(q_category,ResultSet.TYPE_SCROLL_INSENSITIVE);
			pstmt4.setString(1, obj.get_subcat());
			pstmt4.executeUpdate();
		}
		else if(cat.equals("4")) {
			q_category = "insert into category_mattress values((select product_id from products where time_added = (select max(time_added) from products)),?)" ;
			pstmt4= connection.prepareStatement(q_category,ResultSet.TYPE_SCROLL_INSENSITIVE);
			pstmt4.setString(1, obj.get_roll());
			pstmt4.executeUpdate();
		}
		else if(cat.equals("3")) {
			q_category = "insert into category_cycles values((select product_id from products where time_added = (select max(time_added) from products)),?,?,?)" ;
			pstmt4= connection.prepareStatement(q_category,ResultSet.TYPE_SCROLL_INSENSITIVE);
			pstmt4.setString(1, obj.get_gears());
			pstmt4.setString(2, obj.get_brakes());
			pstmt4.setString(3, obj.get_shockers());
			
			pstmt4.executeUpdate();
		}
		else if(cat.equals("5")) {
			q_category = "insert into category_books values((select product_id from products where time_added = (select max(time_added) from products)),?,?,?)" ;
			pstmt4= connection.prepareStatement(q_category,ResultSet.TYPE_SCROLL_INSENSITIVE);
			pstmt4.setInt(1, obj.get_book_year());
			pstmt4.setString(2, obj.get_book_academic());
			pstmt4.setString(3, obj.get_book_branch());
			
			pstmt4.executeUpdate();
		}

		
		
	} catch(SQLException sqle){
		System.out.println("SQL exception when getting restaurant details list  in function ad_post"+sqle);
	} finally{
		closeConnection(connection);
	}
}

public static item_details get_item(int p_id){
	
	PreparedStatement pstmt;
	PreparedStatement pstmt1;
	PreparedStatement pstmt2;
	
	Connection connection=null;
	Connection connection1=null;
	Connection connection2=null;
	item_details bud=new item_details();
	try {
		connection=getConnection();
		connection1=getConnection();
		connection2=getConnection();
		
		String q1= "select category from products where product_id=?";
		pstmt1 = connection1.prepareStatement(q1,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt1.setInt(1,p_id);
		ResultSet rs1= pstmt1.executeQuery();
		String cat="";
		while (rs1.next()){
			cat = rs1.getString(1);
		}
		System.out.println(cat);

		String q="select product_id,product_name,category,description,price_offered,time_used,user_id,name,phone ";
		
		if(cat.matches("Electronics")) {
			q=q+ " ,subcat from category_electronics natural join ";
		}
		else if(cat.matches("Cycle")) {
			q=q+ " ,gears,brakes,shockers from category_cycles natural join ";
		}
		else if(cat.matches("Mattress")) {
			q=q+ " ,roll from category_mattress natural join ";
		}
		else if(cat.matches("Book")) {
			q=q+ " ,year,academic,branch from category_books natural join";
		}
		else {
			q+=" from ";
		}
				
		q=q + " products natural join inventory natural join users where product_id=? and user_id=seller_id ";
				
		
		
		
		pstmt= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt.setInt(1,p_id);

		if(cat.matches("Electronics")) {
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString(2));
				bud.set_product_id(rs.getInt(1));
				bud.set_product_name(rs.getString(2));
				bud.set_category(rs.getString(3));
				bud.set_description(rs.getString(4));
				bud.set_price(rs.getInt(5));
				bud.set_used(rs.getInt(6));
				bud.set_seller_id(rs.getInt(7));
				bud.set_seller_name(rs.getString(8));
				bud.set_seller_phone(rs.getString(9));
				bud.set_subcat(rs.getString(10));
			}
		}
		else if(cat.matches("Cycle")) {
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				bud.set_product_id(rs.getInt(1));
				bud.set_product_name(rs.getString(2));
				bud.set_category(rs.getString(3));
				bud.set_description(rs.getString(4));
				bud.set_price(rs.getInt(5));
				bud.set_used(rs.getInt(6));
				bud.set_seller_id(rs.getInt(7));
				bud.set_seller_name(rs.getString(8));
				bud.set_seller_phone(rs.getString(9));			
				bud.set_gears(rs.getString(10));
				bud.set_brakes(rs.getString(11));
				bud.set_shockers(rs.getString(12));
			}
		}
		else if(cat.matches("Mattress")) {
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				bud.set_product_id(rs.getInt(1));
				bud.set_product_name(rs.getString(2));
				bud.set_category(rs.getString(3));
				bud.set_description(rs.getString(4));
				bud.set_price(rs.getInt(5));
				bud.set_used(rs.getInt(6));
				bud.set_seller_id(rs.getInt(7));
				bud.set_seller_name(rs.getString(8));
				bud.set_seller_phone(rs.getString(9));	
				bud.set_roll(rs.getString(10));
			}
		}
		else if(cat.matches("Book")) {
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				bud.set_product_id(rs.getInt(1));
				bud.set_product_name(rs.getString(2));
				bud.set_category(rs.getString(3));
				bud.set_description(rs.getString(4));
				bud.set_price(rs.getInt(5));
				bud.set_used(rs.getInt(6));
				bud.set_seller_id(rs.getInt(7));
				bud.set_seller_name(rs.getString(8));
				bud.set_seller_phone(rs.getString(9));		
				bud.set_book_year(rs.getInt(10));
				bud.set_book_academic(rs.getString(11));
				bud.set_book_branch(rs.getString(12));
			}
		}
		else {
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				bud.set_product_id(rs.getInt(1));
				bud.set_product_name(rs.getString(2));
				bud.set_category(rs.getString(3));
				bud.set_description(rs.getString(4));
				bud.set_price(rs.getInt(5));
				bud.set_used(rs.getInt(6));
				bud.set_seller_id(rs.getInt(7));
				bud.set_seller_name(rs.getString(8));
				bud.set_seller_phone(rs.getString(9));			
			}
		}
		
		
		String q2 =  "select product_id,encode(image,'base64') from product_images where product_id=?";
		
		pstmt2= connection2.prepareStatement(q2,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt2.setInt(1,p_id);

		ResultSet rs2 = pstmt2.executeQuery();
		
		while(rs2.next()) {
			System.out.println("in rs2 res");
			bud.out1.add(rs2.getString(2));
		}	
		System.out.println(pstmt);
		System.out.println(pstmt1);
		System.out.println(pstmt2);
			
	} catch(SQLException sqle){
		System.out.println("SQL exception detailed object"+sqle);
	} finally{
		closeConnection(connection);
		closeConnection(connection2);
		closeConnection(connection1);
	}
	return bud;
}

public static String findres(String category) {
	// TODO Auto-generated method stub
	Connection connection=null;
	String a = "";
	try{
		connection=getConnection();
		PreparedStatement pstmt= connection.prepareStatement("select distinct product_name from products where category=?",ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt.setString(1, category);
		ResultSet rs= pstmt.executeQuery();
		//System.out.println(id + " " + password );
		while (rs.next()){
//			int id=rs.getInt(1);
			String name = rs.getString(1);
			String res=name+",";
			a=a+res;
		}
		
	} catch(SQLException sqle){
		System.out.println("SQL exception when getting top courses list"+sqle);
	} finally{
		closeConnection(connection);
	}
	return a;
}

public static users user_info(int u_id){
	
	PreparedStatement pstmt1;
	users user =new users();
	System.out.println("user info me id######################->"+u_id);
	Connection connection=null;
	try {
		connection=getConnection();
		String q= "select user_id,name,phone,email,hostel_no,buyer_rating,seller_rating,encode(profile_picture,'base64'),password from users natural join accounts where user_id = ?";

		pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt1.setInt(1,u_id);
		ResultSet rs1 = pstmt1.executeQuery();
		
		while(rs1.next()) {
			user.setu_id(rs1.getInt(1));
			user.setu_name(rs1.getString(2));
			user.setu_phone(rs1.getString(3));
			user.setu_email(rs1.getString(4));
			user.setu_hostel(rs1.getString(5));
			user.setu_buy_rat(rs1.getFloat(6));
			user.setu_sel_rat(rs1.getFloat(7));
			user.setu_image(rs1.getString(8));
			user.setu_passwd(rs1.getString(9));
		}
	} catch(SQLException sqle){
		System.out.println("SQL exception when getting restaurant details list  in function ad_post"+sqle);
	} finally{
		closeConnection(connection);
	}
	
	return user;
}

public static List<reviews> get_user_ratings(int u_id,int role){
	
	System.out.println("review backend");
	System.out.println("uid->"+u_id);
	System.out.println("role"+role);

	PreparedStatement pstmt1;
	List<reviews> rl =new ArrayList<>() ;

	Connection connection=null;
	try {
		connection=getConnection();
		String q = "select reviewer_id,rating,review,role,encode(profile_picture,'base64') from ratings natural join users where reviewer_id = user_id and reviewed_id =? and role =?" ;
		pstmt1= connection.prepareStatement(q,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt1.setInt(1,u_id);
		pstmt1.setInt(2,role);
		ResultSet rs1 = pstmt1.executeQuery();
		while(rs1.next()) {
			reviews r =new reviews();
			r.setr_revid(rs1.getInt(1));
			r.setr_rat(rs1.getFloat(2));
			System.out.println("desc->"+rs1.getString(3));
			r.setr_review(rs1.getString(3));
			r.setr_role(rs1.getInt(4));
			r.setr_photo(rs1.getString(5));
			rl.add(r);
		}
		System.out.println("review backend end->"+rl.size());


	
	} catch(SQLException sqle){
		System.out.println("SQL exception when getting restaurant details list  in function ad_post"+sqle);
	} finally{
		closeConnection(connection);
	}
	
	return rl;
}

public static void update_profile(users u) {
	PreparedStatement pstmt1;
	PreparedStatement pstmt2;
	users usr = u;
	Connection connection=null;
	
	
	try {
		connection=getConnection();
		String querry1 = "update users set (phone,hostel_no)"
				+ " = (?,?) where user_id =?";
		
		pstmt1= connection.prepareStatement(querry1,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
		pstmt1.setString(1,usr.getu_phone());
		pstmt1.setString(2,usr.getu_hostel());
		pstmt1.setInt(3, u.getu_id());
		pstmt1.executeUpdate();
		
		String querry2 = "update accounts set password =? where user_id =?";
		pstmt2= connection.prepareStatement(querry2,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt2.setString(1,usr.getu_passwd());
		pstmt2.setInt(2,usr.getu_id());
		pstmt2.executeUpdate();
	


	
		} catch(SQLException sqle){
			System.out.println("SQL exception when updating profile "+sqle);
		} finally{
			closeConnection(connection);
		}
	
	}


public static void updatePic(int id, InputStream u) {
	PreparedStatement pstmt1;
	Connection connection=null;
	
	
	try {
		connection=getConnection();
		String querry1 = "update users set profile_picture = ? where user_id =?";
		
		pstmt1= connection.prepareStatement(querry1,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
		pstmt1.setInt(2,id);
		pstmt1.setBinaryStream(1, u);
		pstmt1.executeUpdate();
		
		} catch(SQLException sqle){
			System.out.println("SQL exception when updating profile picture "+sqle);
		} finally{
			closeConnection(connection);
		}
	
	}

public static void addReview(String reviewer,String reviewed,String rating,String review) {
	PreparedStatement pstmt1;
	Connection connection=null;
	
	try {
		connection=getConnection();
		String querry1 = "insert into ratings values(?,?,?,?,0)";
		
		pstmt1= connection.prepareStatement(querry1,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt1.setInt(1,Integer.parseInt(reviewer));
		pstmt1.setInt(2,Integer.parseInt(reviewed));
		pstmt1.setDouble(3,Double.parseDouble(rating));
		pstmt1.setString(4,review);
		pstmt1.executeUpdate();
		
		} catch(SQLException sqle){
			System.out.println("SQL exception when add  review "+sqle);
		} finally{
			closeConnection(connection);
		}
	
	}


public static List<Ad_details> postedads(int s_id){
	PreparedStatement pstmt1;
	Connection connection=null;
	
	List<Ad_details> ad = new ArrayList<Ad_details>();
	try {
		connection=getConnection();
		String querry1 = "select product_id,product_name,category,price_offered ,time_added,units,encode(T.image,'base64') "
				+ "from (select product_id,image from product_images natural join (select product_id,min(time_image) "
				+ "from product_images group by product_id)as U where U.min=time_image) as T natural join products natural join inventory natural join product_images "
				+ "where seller_id =? and T.product_id=product_id";
		
		pstmt1= connection.prepareStatement(querry1,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
		
		pstmt1.setInt(1, s_id);
		ResultSet rs = pstmt1.executeQuery();
		
		while(rs.next()) {
			Ad_details ad1 =new Ad_details();
			ad1.seta_product_id(rs.getInt(1));
			ad1.seta_product_name(rs.getString(2));
			ad1.seta_category(rs.getString(3));
			ad1.seta_price(rs.getDouble(4));
			ad1.seta_postedon(rs.getTimestamp(5));
			ad1.seta_unitrem(rs.getInt(6));
			ad1.seta_photo(rs.getString(7));
			ad.add(ad1);
		}
		
		} catch(SQLException sqle){
			System.out.println("SQL exception when posted ads "+sqle);
		} finally{
			closeConnection(connection);
		}
	return ad ;	
}

public static void item_sold_details(int b_id,int s_id,int p_id,double price,Date d,int units_sold,int rating,String review){
	Connection connection1=null;
//	Connection connection2=null;
//	Connection connection3=null;
	PreparedStatement pstmt1 ;
	PreparedStatement pstmt2 ;
	PreparedStatement pstmt3 ;
	
	try {
		connection1=getConnection();
		
		String querry1 = "insert into trade values(?,?,?,?,?,?)" ;
		
		pstmt1= connection1.prepareStatement(querry1,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
		pstmt1.setInt(1, b_id);
		pstmt1.setInt(2, s_id);
		pstmt1.setInt(3, p_id);
		pstmt1.setInt(4, units_sold);
		pstmt1.setDouble(5, price);
		pstmt1.setDate(6, d);
		
		pstmt1.executeUpdate();
		String querry2 = "update inventory set units = units-? where product_id =?";
		String querry3 = "delete from inventory where units = 0 ";
		
		pstmt2= connection1.prepareStatement(querry2,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt2.setInt(1, units_sold);
		pstmt2.setInt(2, p_id);
		pstmt2.executeUpdate();		
		
		pstmt3= connection1.prepareStatement(querry3,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt3.executeUpdate();
		
		PreparedStatement pstmt4 = connection1.prepareStatement("insert into ratings values(?,?,?,?,?)", ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt4.setInt(1, b_id);
		pstmt4.setInt(2, s_id);
		pstmt4.setInt(3, rating);
		pstmt4.setString(4, review);
		pstmt4.setInt(5, 1);
		
		pstmt4.executeUpdate();
		
		} catch(SQLException sqle){
			System.out.println("SQL exception when  item sold details "+sqle);
		} finally{
			closeConnection(connection1);
	//		closeConnection(connection2);
	//		closeConnection(connection3);
		}
	
}

public static void delete_item(int p_id){
	Connection connection1=null;

	PreparedStatement pstmt1 ;
	PreparedStatement pstmt2 ;
	PreparedStatement pstmt3 ;
	PreparedStatement pstmt4 ;
	PreparedStatement pstmt5 ;
	PreparedStatement pstmt6 ;
	PreparedStatement pstmt7 ;

	
	try {
		connection1=getConnection();
		
		String querry1 = "delete from Product_images where product_id=?" ;
		String querry4 = "delete from category_electronics where product_id= ? ";
		String querry5 = "delete from category_books where product_id= ? ";
		String querry6 = "delete from category_cycles where product_id= ? ";
		String querry7 = "delete from category_mattress where product_id= ? ";
		
		pstmt1= connection1.prepareStatement(querry1,ResultSet.TYPE_SCROLL_INSENSITIVE);	
		pstmt1.setInt(1, p_id);
		pstmt1.executeUpdate();

		String querry2 = "delete from inventory where product_id = ?";
		pstmt2= connection1.prepareStatement(querry2,ResultSet.TYPE_SCROLL_INSENSITIVE);
		pstmt2.setInt(1, p_id);
		pstmt2.executeUpdate();
		
		String querry3 = "delete from products where product_id = ?";
		pstmt3= connection1.prepareStatement(querry3,ResultSet.TYPE_SCROLL_INSENSITIVE);	
		pstmt3.setInt(1, p_id);
		pstmt3.executeUpdate();
		
		pstmt4= connection1.prepareStatement(querry4,ResultSet.TYPE_SCROLL_INSENSITIVE);	
		pstmt4.setInt(1, p_id);
		pstmt4.executeUpdate();
		
		pstmt5= connection1.prepareStatement(querry5,ResultSet.TYPE_SCROLL_INSENSITIVE);	
		pstmt5.setInt(1, p_id);
		pstmt5.executeUpdate();
		
		pstmt6= connection1.prepareStatement(querry6,ResultSet.TYPE_SCROLL_INSENSITIVE);	
		pstmt6.setInt(1, p_id);
		pstmt6.executeUpdate();
		
		pstmt7= connection1.prepareStatement(querry7,ResultSet.TYPE_SCROLL_INSENSITIVE);	
		pstmt7.setInt(1, p_id);
		pstmt7.executeUpdate();
		
		} catch(SQLException sqle){
			System.out.println("SQL exception delete review "+sqle);
		} finally{
			closeConnection(connection1);

		}
	
}
public static List<Ad_details> soldads(int s_id){
	PreparedStatement pstmt1;
	Connection connection=null;
	
	List<Ad_details> ad = new ArrayList<Ad_details>();
	try {
		connection=getConnection();
		
		String querry = "select product_id,product_name,category,buyer_id,name,units_sold,selling_price,time,encode(T.image,'base64') "
				+ " from (select product_id,image from product_images natural join (select product_id,min(time_image) "
				+ " from product_images group by product_id)as U where U.min=time_image) as T natural join products natural join trade natural join product_images "
				+ " natural join users where seller_id =? and buyer_id = user_id and T.product_id=product_id";
		
		pstmt1= connection.prepareStatement(querry,ResultSet.TYPE_SCROLL_INSENSITIVE);
		
		
		pstmt1.setInt(1, s_id);
		ResultSet rs = pstmt1.executeQuery();
		
		while(rs.next()) {
			Ad_details ad1 =new Ad_details();
			ad1.seta_product_id(rs.getInt(1));
			ad1.seta_product_name(rs.getString(2));
			ad1.seta_category(rs.getString(3));
			ad1.seta_buyerid(rs.getInt(4));
			ad1.seta_buyer_name(rs.getString(5));
			ad1.seta_unitsold(rs.getInt(6));
			ad1.seta_price(rs.getDouble(7));
			ad1.seta_solddon(rs.getTimestamp(8));
			ad1.seta_photo(rs.getString(9));
			ad.add(ad1);
		}
		
		} catch(SQLException sqle){
			System.out.println("SQL exception sold ads "+sqle);
		} finally{
			closeConnection(connection);
		}
	return ad ;
	
}


public static List<SingleMessage> getMessages(int id1, int id2){
	List<SingleMessage> messages = new ArrayList<>();
	
	Connection connection = null;
	try {
		connection = getConnection();
		
		PreparedStatement pstmt = connection.prepareStatement("select sender_id, receiver_id, message from chats where (sender_id=? and receiver_id=?) or (sender_id=? and receiver_id=?) order by time");
		pstmt.setInt(1, id1);
		pstmt.setInt(2, id2);
		pstmt.setInt(3, id2);
		pstmt.setInt(4, id1);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			SingleMessage obj = new SingleMessage();
			
			obj.setSenderId(rs.getInt(1));
			obj.setReceiverId(rs.getInt(2));
			obj.setMessage(rs.getString(3));
			
			messages.add(obj);
		}
	}
	catch(SQLException sqle){
		System.out.println("SQL exception when retrieving complete messages " +sqle);
	} 
	finally{
		closeConnection(connection);
	}
	return messages;
}


public static List<MessageThumb> sortedMessages(int user){
	List<MessageThumb> recent = new ArrayList<>();
	
	System.out.println("------------------------------------->"+user);
	
	Connection connection = null;
	try {
		connection = getConnection();
		
		PreparedStatement pstmt = connection.prepareStatement("select max(time),id from ((select chats.sender_id as id,time from chats where receiver_id = ?) union (select receiver_id as id,time from chats where sender_id = ?))as foo group by id order by max desc");
		pstmt.setInt(1, user);
		pstmt.setInt(2, user);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			MessageThumb obj = new MessageThumb();
			int user_id = rs.getInt(2);
			obj.setUserId(user_id);
			
			PreparedStatement pstmt2e = connection.prepareStatement("select name, encode(profile_picture, 'base64') from users where user_id=?");
			pstmt2e.setInt(1, user_id);
			ResultSet rs2e = pstmt2e.executeQuery();
			while(rs2e.next()) {
				obj.setUserName(rs2e.getString(1));
				obj.setUserImage(rs2e.getString(2));
			}
			
			PreparedStatement pstmt2 = connection.prepareStatement("select message from chats where time=?");
			pstmt2.setTimestamp(1, rs.getTimestamp(1));
			ResultSet rs2=pstmt2.executeQuery();
			while(rs2.next()){
				obj.setRecentMessage(rs2.getString(1));
			}
			
			recent.add(obj);
		}
	}
	catch(SQLException sqle){
		System.out.println("SQL exception when retrieving recent messages " +sqle);
	} 
	finally{
		closeConnection(connection);
	}
	return recent;
}

public static List<MessageThumb> recentMessages(int user){
	System.out.println("------------------------------------->"+user);

	List<MessageThumb> recent = new ArrayList<>();
	Connection connection = null;
	Connection connection2=null;
	Connection connection3=null;
	try {
		connection = getConnection();
		connection2=getConnection();
		connection3=getConnection();
		PreparedStatement pstmt = connection.prepareStatement("select max(time),id from ((select chats.sender_id as id,time from chats where receiver_id = ?) union (select receiver_id as id,time from chats where sender_id = ?))as foo group by id order by max desc");
		pstmt.setInt(1, user);
		pstmt.setInt(2, user);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			System.out.print("while loop me aaya");
			MessageThumb obj = new MessageThumb();
			int user_id = rs.getInt(2);
			obj.setUserId(user_id);
			
			PreparedStatement pstmt2e = connection2.prepareStatement("select name, encode(profile_picture, 'base64') from users where user_id=?");
			pstmt2e.setInt(1, user_id);
			ResultSet rs2e = pstmt2e.executeQuery();
			while(rs2e.next()) {
				obj.setUserName(rs2e.getString(1));
				obj.setUserImage(rs2e.getString(2));
			}
			
			PreparedStatement pstmt2 = connection3.prepareStatement("select message from chats where time=?");
			pstmt2.setTimestamp(1, rs.getTimestamp(1));
			ResultSet rs2=pstmt2.executeQuery();
			while(rs2.next()){
				obj.setRecentMessage(rs2.getString(1));
			}
			recent.add(obj);
		}
	}
	catch(SQLException sqle){
		System.out.println("SQL exception when retrieving recent messages " +sqle);
	} 
	finally{
		closeConnection(connection2);
		closeConnection(connection3);
		closeConnection(connection);
	}
	return recent;
}


public static void sendMessage(int sender_id, int receiver_id, String message) {
	Connection connection = null;
	
	try {
		connection = getConnection();
		
		PreparedStatement pstmt = connection.prepareStatement("insert into chats values(?, ?, ?, CURRENT_TIMESTAMP)");
		pstmt.setInt(1, sender_id);
		pstmt.setInt(2, receiver_id);
		pstmt.setString(3, message);
		
		pstmt.executeUpdate();
	}
	catch(SQLException sqle) {
		System.out.println("SQL exception when sending message " + sqle);
	}
	finally {
		closeConnection(connection);
	}
}

	// String name,String age,u
}

