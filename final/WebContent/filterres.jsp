<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Home.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
System.out.println("in filter res");

String name_search=request.getParameter("name_search");
String category=request.getParameter("category");
System.out.println("filterres------");
System.out.println("category->"+category);

String price=request.getParameter("price");
String used=request.getParameter("used");
System.out.println("price->"+price);
System.out.println("used->"+used);

String subcat=request.getParameter("subcat");
String gear=request.getParameter("gears");
String shockers=request.getParameter("shockers");
String brakes=request.getParameter("brakes");
String roll=request.getParameter("roll");
String branch=request.getParameter("branch");
String acad=request.getParameter("acad");
String year=request.getParameter("year");

//out.print("<h3>ashlulz</h3>");
/* System.out.println("gear->"+gear);
System.out.println("price->"+price);
System.out.println("used->"+used); 
System.out.println("shockers->"+shockers); 
System.out.println("brakes->"+brakes); 
 */
//System.out.println(pop1);
//System.out.println(cuis);
System.out.println("filterres------");



List<item_details> dumres=new ArrayList<>();

if(category.matches("Electronics")){
	dumres=Home.filter_and_search_res_Electronics(price, used, subcat,name_search);
	//System.out.println(dumres.size());
	out.println("<input type=\"hidden\" name=\"name_search\" id=\"name_search\" value=\""+name_search+"\">");
	for(int i=0;i<dumres.size();i++){
		item_details obj=new item_details();
		obj=dumres.get(i);
		
		out.print("<div class=\"single-content\">");
	    out.print("<div style=\"width:100%; height:300px; padding-top:50px\" class=\"form-inline\">");
	    out.println("<div style=\"width:30%; height:250px\">");
	/*   out.print("<img src='data:image/jpeg;base64,"+obj.get_product_image()+"' class=\"img-fluid\"/>"); */
	    out.println("<img style=\"width:80%; height:250px; border-radius:10px;\" src='data:image/jpeg;base64,"+obj.get_product_image()+"' alt=\"\">");
	    out.println("</div>");
	    out.println("<div style=\"width:70%; height:250px\">");
	    out.println(" <h3>"+obj.get_product_name()+"</h3>");
        out.println("<b>Seller</b> : <a href=\"Seller.jsp?revhyp="+obj.get_seller_id()+"\">"+obj.get_seller_name()+"</a><br><br>");
	    out.println("<b>Subcategory</b> : "+obj.get_subcat()+"<br>");
	    if(obj.get_used()>12){
	    	out.println("<b>Used</b> :"+ obj.get_used()/12 +" Years and "+obj.get_used()%12+" Months<br><br>");
	    }
	    else{
	    	out.println("<b>Used</b> :"+ obj.get_used()+" Months<br><br>");
	    }
	    out.println("<font size=\"5\"><b>Price</b> : Rs."+ obj.get_price()+"</font>");
 out.println("<form method='post' id='gg2' action='ProductDetail.jsp'>");
        
        out.println("<button class=\"view-more\" name='product_id' value='"+obj.get_product_id()+"'>View More</button>");
        out.println("</form>");	    out.println(" </div>");
	    out.println("</div>");
	    out.println("</div>");
	}
}
else if(category.matches("Cycles")){

	dumres=Home.filter_and_search_res_cycle(price, used, gear, shockers, brakes,name_search);
	out.println("<input type=\"hidden\" name=\"name_search\" id=\"name_search\" value=\""+name_search+"\">");

	System.out.println(dumres.size());
	for(int i=0;i<dumres.size();i++){
		item_details obj=new item_details();
		obj=dumres.get(i);
		out.print("<div class=\"single-content\">");
	    out.print("<div style=\"width:100%; height:300px; padding-top:50px\" class=\"form-inline\">");
	    out.println("<div style=\"width:30%; height:250px\">");
	/*   out.print("<img src='data:image/jpeg;base64,"+obj.get_product_image()+"' class=\"img-fluid\"/>"); */
	    out.println("<img style=\"width:80%; height:250px; border-radius:10px;\" src='data:image/jpeg;base64,"+obj.get_product_image()+"' alt=\"\">");
	    out.println("</div>");
	    out.println("<div style=\"width:70%; height:250px\">");
	    out.println(" <h3>"+obj.get_product_name()+"</h3>");
        out.println("<b>Seller</b> : <a href=\"Seller.jsp?revhyp="+obj.get_seller_id()+"\">"+obj.get_seller_name()+"</a><br><br>");
	    
	    if(obj.get_gears().matches("g")){
	          out.println("<b>Geared</b><br>");
	    }
	    else{
	          out.println("<b>Single Speed</b><br>");
	    }
	    if(obj.get_shockers().matches("f")){
	          out.println("<b>Shockers</b> : Front<br>");
	    }
	    else if(obj.get_shockers().matches("b")){
	          out.println("<b>Shockers</b> :Back<br>");
	    }
	    else{
	          out.println("<b>Shockers</b> :Front and Back<br>");

	    }
	    if(obj.get_brakes().matches("v")){
	          out.println("<b>Brake Type</b> : V Brakes<br>");
	    }
	    else if(obj.get_brakes().matches("p")){
	          out.println("<b>Brake Type</b> : Power Brakes<br>");
	    }
	    else{
	          out.println("<b>Brake Type</b> : Disk Brakes<br>");
	    }
	    
	    if(obj.get_used()>12){
	    	out.println("<b>Used</b> :"+ obj.get_used()/12 +" Years and "+obj.get_used()%12+" Months<br><br>");
	    }
	    else{
	    	out.println("<b>Used</b> :"+ obj.get_used()+" Months<br><br>");
	    }
	    out.println("<font size=\"5\"><b>Price</b> : Rs."+ obj.get_price()+"</font>");
 out.println("<form method='post' id='gg2' action='ProductDetail.jsp'>");
        
        out.println("<button class=\"view-more\" name='product_id' value='"+obj.get_product_id()+"'>View More</button>");
        out.println("</form>");	    out.println(" </div>");
	    out.println("</div>");
	    out.println("</div>");
	}
}
else if(category.matches("Food")){

	System.out.println("in food filterres");
	dumres=Home.filter_and_search_res_Food(price, used,name_search);
	out.println("<input type=\"hidden\" name=\"name_search\" id=\"name_search\" value=\""+name_search+"\">");

	System.out.println(dumres.size());
	for(int i=0;i<dumres.size();i++){
		item_details obj=new item_details();
		obj=dumres.get(i);
		out.print("<div class=\"single-content\">");
	    out.print("<div style=\"width:100%; height:300px; padding-top:50px\" class=\"form-inline\">");
	    out.println("<div style=\"width:30%; height:250px\">");
	/*   out.print("<img src='data:image/jpeg;base64,"+obj.get_product_image()+"' class=\"img-fluid\"/>"); */
	    out.println("<img style=\"width:80%; height:250px; border-radius:10px;\" src='data:image/jpeg;base64,"+obj.get_product_image()+"' alt=\"\">");
	    out.println("</div>");
	    out.println("<div style=\"width:70%; height:250px\">");
	    out.println(" <h3>"+obj.get_product_name()+"</h3>");
        out.println("<b>Seller</b> : <a href=\"Seller.jsp?revhyp="+obj.get_seller_id()+"\">"+obj.get_seller_name()+"</a><br><br>");
	    /*----------------------------  */
	    out.println("<b>Quantity/Units</b> : "+obj.get_units()+"<br>");
	          
	    /* ----------------------------- */
	    if(obj.get_used()>12){
	    	out.println("<b>Expiry Date</b> :"+ obj.get_used()/12 +" Years and "+obj.get_used()%12+" Months<br><br>");
	    }
	    else{
	    	out.println("<b>Expiry Date</b> :"+ obj.get_used()+" Months<br><br>");
	    }
	    out.println("<font size=\"5\"><b>Price</b> : Rs."+ obj.get_price()+"</font>");
 out.println("<form method='post' id='gg2' action='ProductDetail.jsp'>");
        
        out.println("<button class=\"view-more\" name='product_id' value='"+obj.get_product_id()+"'>View More</button>");
        out.println("</form>");	    out.println(" </div>");
	    out.println("</div>");
	    out.println("</div>");
	}

}
else if(category.matches("Book")){

	dumres=Home.filter_and_search_res_books(price, used, acad, branch, year,name_search);
	out.println("<input type=\"hidden\" name=\"name_search\" id=\"name_search\" value=\""+name_search+"\">");

	System.out.println(dumres.size());
	for(int i=0;i<dumres.size();i++){
		item_details obj=new item_details();
		obj=dumres.get(i);
		out.print("<div class=\"single-content\">");
	    out.print("<div style=\"width:100%; height:300px; padding-top:50px\" class=\"form-inline\">");
	    out.println("<div style=\"width:30%; height:250px\">");
	/*   out.print("<img src='data:image/jpeg;base64,"+obj.get_product_image()+"' class=\"img-fluid\"/>"); */
	    out.println("<img style=\"width:80%; height:250px; border-radius:10px;\" src='data:image/jpeg;base64,"+obj.get_product_image()+"' alt=\"\">");
	    out.println("</div>");
	    out.println("<div style=\"width:70%; height:250px\">");
	    out.println(" <h3>"+obj.get_product_name()+"</h3>");
        out.println("<b>Seller</b> : <a href=\"Seller.jsp?revhyp="+obj.get_seller_id()+"\">"+obj.get_seller_name()+"</a><br><br>");
	    /*----------------------------  */
	    if(obj.get_book_academic().matches("na")){
	    	out.println("<b>Type</b> : Non-academic <br>");
	    }
	    else{
	    	out.println("<b>Type</b> : Academic<br>");
	        out.println("<b>Branch</b> : "+obj.get_book_branch()+"<br>");
	        if(obj.get_book_year()==1){
	        	out.println("<b>Academic Year</b> : 1st Year<br>");
	        }
	        else if(obj.get_book_year()==2){
	        	out.println("<b>Academic Year</b> : 2nd Year<br>");
	        }
	        else if(obj.get_book_year()==3){
	        	out.println("<b>Academic Year</b> : 3rd Year<br>");
	        }
	        else if(obj.get_book_year()==4){
	        	out.println("<b>Academic Year</b> : 4th Year<br>");
	        }
	    }	          
	    /* ----------------------------- */
	    if(obj.get_used()>12){
	    	out.println("<b>Used</b> :"+ obj.get_used()/12 +" Years and "+obj.get_used()%12+" Months<br><br>");
	    }
	    else{
	    	out.println("<b>Used</b> :"+ obj.get_used()+" Months<br><br>");
	    }
	    out.println("<font size=\"5\"><b>Price</b> : Rs."+ obj.get_price()+"</font>");
 out.println("<form method='post' id='gg2' action='ProductDetail.jsp'>");
        
        out.println("<button class=\"view-more\" name='product_id' value='"+obj.get_product_id()+"'>View More</button>");
        out.println("</form>");	    out.println(" </div>");
	    out.println("</div>");
	    out.println("</div>");
	}

}
else if(category.matches("Mattress")){


	dumres=Home.filter_and_search_res_mattress(price, used, roll,name_search);
	out.println("<input type=\"hidden\" name=\"name_search\" id=\"name_search\" value=\""+name_search+"\">");

	System.out.println(dumres.size());
	for(int i=0;i<dumres.size();i++){
		item_details obj=new item_details();
		obj=dumres.get(i);
		out.print("<div class=\"single-content\">");
	    out.print("<div style=\"width:100%; height:300px; padding-top:50px\" class=\"form-inline\">");
	    out.println("<div style=\"width:30%; height:250px\">");
	/*   out.print("<img src='data:image/jpeg;base64,"+obj.get_product_image()+"' class=\"img-fluid\"/>"); */
	    out.println("<img style=\"width:80%; height:250px; border-radius:10px;\" src='data:image/jpeg;base64,"+obj.get_product_image()+"' alt=\"\">");
	    out.println("</div>");
	    out.println("<div style=\"width:70%; height:250px\">");
	    out.println(" <h3>"+obj.get_product_name()+"</h3>");
        out.println("<b>Seller</b> : <a href=\"Seller.jsp?revhyp="+obj.get_seller_id()+"\">"+obj.get_seller_name()+"</a><br><br>");
	    /*----------------------------  */
	    if(obj.get_roll().matches("r")){
	    	out.println("<b>Rollable</b><br>");
	    }
	    else{
	    	out.println("<b>Stiff</b><br>");
	    }
	    /* ----------------------------- */
	    if(obj.get_used()>12){
	    	out.println("<b>Expiry Date</b> :"+ obj.get_used()/12 +" Years and "+obj.get_used()%12+" Months<br><br>");
	    }
	    else{
	    	out.println("<b>Expiry Date</b> :"+ obj.get_used()+" Months<br><br>");
	    }
	    out.println("<font size=\"5\"><b>Price</b> : Rs."+ obj.get_price()+"</font>");
 out.println("<form method='post' id='gg2' action='ProductDetail.jsp'>");
        
        out.println("<button class=\"view-more\" name='product_id' value='"+obj.get_product_id()+"'>View More</button>");
        out.println("</form>");	    out.println(" </div>");
	    out.println("</div>");
	    out.println("</div>");
	}


}
else if(category.matches("Other")){

	dumres=Home.filter_and_search_res_others(price, used,name_search);
	out.println("<input type=\"hidden\" name=\"name_search\" id=\"name_search\" value=\""+name_search+"\">");

	System.out.println(dumres.size());
	for(int i=0;i<dumres.size();i++){
		item_details obj=new item_details();
		obj=dumres.get(i);
		out.print("<div class=\"single-content\">");
	    out.print("<div style=\"width:100%; height:300px; padding-top:50px\" class=\"form-inline\">");
	    out.println("<div style=\"width:30%; height:250px\">");
	/*   out.print("<img src='data:image/jpeg;base64,"+obj.get_product_image()+"' class=\"img-fluid\"/>"); */
	    out.println("<img style=\"width:80%; height:250px; border-radius:10px;\" src='data:image/jpeg;base64,"+obj.get_product_image()+"' alt=\"\">");
	    out.println("</div>");
	    out.println("<div style=\"width:70%; height:250px\">");
	    out.println(" <h3>"+obj.get_product_name()+"</h3>");
        out.println("<b>Seller</b> : <a href=\"Seller.jsp?revhyp="+obj.get_seller_id()+"\">"+obj.get_seller_name()+"</a><br><br>");
	    /*----------------------------  */
	    out.println("<b>Quantity/Units</b> : "+obj.get_units()+"<br>");
	          
	    /* ----------------------------- */
	    if(obj.get_used()>12){
	    	out.println("<b>Used</b> :"+ obj.get_used()/12 +" Years and "+obj.get_used()%12+" Months<br><br>");
	    }
	    else{
	    	out.println("<b>Used</b> :"+ obj.get_used()+" Months<br><br>");
	    }
	    out.println("<font size=\"5\"><b>Price</b> : Rs."+ obj.get_price()+"</font>");
 out.println("<form method='post' id='gg2' action='ProductDetail.jsp'>");
        
        out.println("<button class=\"view-more\" name='product_id' value='"+obj.get_product_id()+"'>View More</button>");
        out.println("</form>");	    out.println(" </div>");
	    out.println("</div>");
	    out.println("</div>");
	}

}


%>