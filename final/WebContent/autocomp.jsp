<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Home.Home"%>
 <% 
 String category=request.getParameter("category");
 String res=Home.findres(category);
 out.print(res);
 %>