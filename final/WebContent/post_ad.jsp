<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Home.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.InputStream"%>

<%
System.out.println("-----------inpostad backed---------------");
String category = request.getParameter("catpass");
System.out.println(category);

String seller_temp=(String)session.getAttribute("user_id");
int seller_id=Integer.parseInt(seller_temp);
System.out.println(seller_id);

String product_name=request.getParameter("name");
System.out.println(product_name);
System.out.println(request.getParameter("age"));

int used=Integer.parseInt(request.getParameter("age"));
int no_of_units=Integer.parseInt(request.getParameter("units"));
String description=request.getParameter("description");
int price=Integer.parseInt(request.getParameter("price"));

item_details obj=new item_details();//initializing the object 

//filling the object 
obj.set_product_name(product_name);
obj.set_category(category);
obj.set_description(description);
obj.set_price(price);
obj.set_used(used);
obj.set_units(no_of_units);

if(category.matches("1")){//electronics
	String subcat=request.getParameter("subcategory");
	obj.set_subcat(subcat);
	InputStream inputStream1 = null;
	Part filePart1 = request.getPart("ePhoto1");
	if (filePart1 != null) {
	   inputStream1 = filePart1.getInputStream();
	   obj.get_inp1().add(inputStream1);
	}

	InputStream inputStream2 = null;
	Part filePart2 = request.getPart("ePhoto2");
	if (filePart2 != null) {
	   inputStream2 = filePart2.getInputStream();
	   obj.get_inp1().add(inputStream2);

	}
	InputStream inputStream3 = null;
	Part filePart3 = request.getPart("ePhoto3");
	if (filePart3 != null) {
	   inputStream3 = filePart3.getInputStream();
	   obj.get_inp1().add(inputStream3);

	}
	InputStream inputStream4 = null;
	Part filePart4 = request.getPart("ePhoto4");
	if (filePart4 != null) {
	   inputStream4 = filePart4.getInputStream();
	   obj.get_inp1().add(inputStream4);

	}
	InputStream inputStream5 = null;
	Part filePart5 = request.getPart("ePhoto5");
	if (filePart5 != null) {
	   inputStream5 = filePart5.getInputStream();
	   obj.get_inp1().add(inputStream5);

	}
	
	//filling the object
	Home.ad_post(obj, category);
}
else if(category.matches("2")){//food
	InputStream inputStream1 = null;
	Part filePart1 = request.getPart("fPhoto1");
	if (filePart1 != null) {
	   inputStream1 = filePart1.getInputStream();
	   obj.get_inp1().add(inputStream1);
	}

	InputStream inputStream2 = null;
	Part filePart2 = request.getPart("fPhoto2");
	if (filePart2 != null) {
	   inputStream2 = filePart2.getInputStream();
	   obj.get_inp1().add(inputStream2);

	}
	InputStream inputStream3 = null;
	Part filePart3 = request.getPart("fPhoto3");
	if (filePart3 != null) {
	   inputStream3 = filePart3.getInputStream();
	   obj.get_inp1().add(inputStream3);

	}
	InputStream inputStream4 = null;
	Part filePart4 = request.getPart("fPhoto4");
	if (filePart4 != null) {
	   inputStream4 = filePart4.getInputStream();
	   obj.get_inp1().add(inputStream4);

	}
	InputStream inputStream5 = null;
	Part filePart5 = request.getPart("fPhoto5");
	if (filePart5 != null) {
	   inputStream5 = filePart5.getInputStream();
	   obj.get_inp1().add(inputStream5);
	}

}
else if(category.matches("3")){//cycle
	String gears=request.getParameter("gear");
	String shockers=request.getParameter("shockers");
	String brakes=request.getParameter("brakes");
	obj.set_gears(gears);
	obj.set_shockers(shockers);
	obj.set_brakes(brakes);
	InputStream inputStream1 = null;
	Part filePart1 = request.getPart("cPhoto1");
	if (filePart1 != null) {
	   inputStream1 = filePart1.getInputStream();
	   obj.get_inp1().add(inputStream1);
	}

	InputStream inputStream2 = null;
	Part filePart2 = request.getPart("cPhoto2");
	if (filePart2 != null) {
	   inputStream2 = filePart2.getInputStream();
	   obj.get_inp1().add(inputStream2);

	}
	InputStream inputStream3 = null;
	Part filePart3 = request.getPart("cPhoto3");
	if (filePart3 != null) {
	   inputStream3 = filePart3.getInputStream();
	   obj.get_inp1().add(inputStream3);

	}
	InputStream inputStream4 = null;
	Part filePart4 = request.getPart("cPhoto4");
	if (filePart4 != null) {
	   inputStream4 = filePart4.getInputStream();
	   obj.get_inp1().add(inputStream4);

	}
	InputStream inputStream5 = null;
	Part filePart5 = request.getPart("cPhoto5");
	if (filePart5 != null) {
	   inputStream5 = filePart5.getInputStream();
	   obj.get_inp1().add(inputStream5);
	}
}
else if(category.matches("4")){//mattress
	String roll=request.getParameter("roll");
	obj.set_roll(roll);
	InputStream inputStream1 = null;
	Part filePart1 = request.getPart("mPhoto1");
	if (filePart1 != null) {
	   inputStream1 = filePart1.getInputStream();
	   obj.get_inp1().add(inputStream1);
	}

	InputStream inputStream2 = null;
	Part filePart2 = request.getPart("mPhoto2");
	if (filePart2 != null) {
	   inputStream2 = filePart2.getInputStream();
	   obj.get_inp1().add(inputStream2);

	}
	InputStream inputStream3 = null;
	Part filePart3 = request.getPart("mPhoto3");
	if (filePart3 != null) {
	   inputStream3 = filePart3.getInputStream();
	   obj.get_inp1().add(inputStream3);

	}
	InputStream inputStream4 = null;
	Part filePart4 = request.getPart("mPhoto4");
	if (filePart4 != null) {
	   inputStream4 = filePart4.getInputStream();
	   obj.get_inp1().add(inputStream4);

	}
	InputStream inputStream5 = null;
	Part filePart5 = request.getPart("mPhoto5");
	if (filePart5 != null) {
	   inputStream5 = filePart5.getInputStream();
	   obj.get_inp1().add(inputStream5);
	}
}
else if(category.matches("5")){//book
	String branch=request.getParameter("branch");
	int year=Integer.parseInt(request.getParameter("year"));
	String acad=request.getParameter("type");
	obj.set_book_academic(acad);
	obj.set_book_branch(branch);
	obj.set_book_year(year);
	
	InputStream inputStream1 = null;
	Part filePart1 = request.getPart("bPhoto1");
	if (filePart1 != null) {
	   inputStream1 = filePart1.getInputStream();
	   obj.get_inp1().add(inputStream1);
	}

	InputStream inputStream2 = null;
	Part filePart2 = request.getPart("bPhoto2");
	if (filePart2 != null) {
	   inputStream2 = filePart2.getInputStream();
	   obj.get_inp1().add(inputStream2);

	}
	InputStream inputStream3 = null;
	Part filePart3 = request.getPart("bPhoto3");
	if (filePart3 != null) {
	   inputStream3 = filePart3.getInputStream();
	   obj.get_inp1().add(inputStream3);

	}
	InputStream inputStream4 = null;
	Part filePart4 = request.getPart("bPhoto4");
	if (filePart4 != null) {
	   inputStream4 = filePart4.getInputStream();
	   obj.get_inp1().add(inputStream4);

	}
	InputStream inputStream5 = null;
	Part filePart5 = request.getPart("bPhoto5");
	if (filePart5 != null) {
	   inputStream5 = filePart5.getInputStream();
	   obj.get_inp1().add(inputStream5);
	}

}
else if(category.matches("6")){//others
	
	InputStream inputStream1 = null;
	Part filePart1 = request.getPart("sPhoto1");
	if (filePart1 != null) {
	   inputStream1 = filePart1.getInputStream();
	   obj.get_inp1().add(inputStream1);
	}

	InputStream inputStream2 = null;
	Part filePart2 = request.getPart("sPhoto2");
	if (filePart2 != null) {
	   inputStream2 = filePart2.getInputStream();
	   obj.get_inp1().add(inputStream2);

	}
	InputStream inputStream3 = null;
	Part filePart3 = request.getPart("sPhoto3");
	if (filePart3 != null) {
	   inputStream3 = filePart3.getInputStream();
	   obj.get_inp1().add(inputStream3);

	}
	InputStream inputStream4 = null;
	Part filePart4 = request.getPart("sPhoto4");
	if (filePart4 != null) {
	   inputStream4 = filePart4.getInputStream();
	   obj.get_inp1().add(inputStream4);

	}
	InputStream inputStream5 = null;
	Part filePart5 = request.getPart("sPhoto5");
	if (filePart5 != null) {
	   inputStream5 = filePart5.getInputStream();
	   obj.get_inp1().add(inputStream5);
	}

	
}

%>