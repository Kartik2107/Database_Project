<%@page import="Home.Home"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String a =Home.pics();
System.out.println("hello main disp.jsp");
out.print("<img src='data:image/jpeg;base64,"+a+"'/>");
%>

</body>
</html>