<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Home.*" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

int b_id = Integer.parseInt(request.getParameter("buyer"));
int s_id = Integer.parseInt((String)session.getAttribute("user_id"));
int p_id =  Integer.parseInt(request.getParameter("p_id"));
double price = Float.parseFloat(request.getParameter("price"));
//Timestamp sold_on = 2018-11-05 08:45:03.462082;
String startDateStr = request.getParameter("date");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//surround below line with try catch block as below code throws checked exception
java.util.Date startDate = sdf.parse(startDateStr);
java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime()); 
int units_sold = Integer.parseInt(request.getParameter("units"));
int rating = Integer.parseInt(request.getParameter("rating"));
String review = (String)request.getParameter("review");
System.out.println("----item sold starts-----");
System.out.println("bid->"+b_id);
System.out.println("pid->"+p_id);
System.out.println("sid->"+s_id);
System.out.println("price->"+price);
System.out.println("date->"+sqlStartDate);
System.out.println("units->"+units_sold);
System.out.println("rating->"+rating);
System.out.println("review->"+review);
System.out.println("----item sold ends-----");		
Home.item_sold_details(b_id, s_id,p_id, price, sqlStartDate, units_sold, rating, review);
response.sendRedirect("Ads.jsp");
%>

</body>
</html>