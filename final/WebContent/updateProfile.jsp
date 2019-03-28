<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Home.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
String uname=(String)session.getAttribute("user_id");
String pass=request.getParameter("pass");
/* String mail=request.getParameter("mail"); */
String phone=request.getParameter("phone"); 
String hno=request.getParameter("hno");
System.out.println("in update profile");
System.out.println(uname);
System.out.println(pass);
System.out.println(phone);
System.out.println(hno);
users inter=new users();
inter.setu_id(Integer.parseInt(uname));
inter.setu_passwd(pass);
inter.setu_hostel(hno);
inter.setu_phone(phone);
Home.update_profile(inter);
String redirectURL = "Profile.jsp";
response.sendRedirect(redirectURL);
%>