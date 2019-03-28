<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Home.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
int p_id=Integer.parseInt((String)request.getParameter("del_id"));
// System.out.println(p_id);
Home.delete_item(p_id);
response.sendRedirect("Ads.jsp");
%>
</body>
</html>