<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Home.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
String reviewer=(String)session.getAttribute("user_id");//jisne review kiya
String reviewed =request.getParameter("revd");
String rating=request.getParameter("rating");
String review=request.getParameter("review");
System.out.println("in add review");
System.out.println(reviewer);
System.out.println(rating);
System.out.println(review);
Home.addReview(reviewer,reviewed,rating,review);
String redirectURL = "Seller.jsp?revhyp="+reviewed;
response.sendRedirect(redirectURL);
%>