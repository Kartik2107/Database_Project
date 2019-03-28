
<%@ page import="java.util.*"%>
<%@ page import="Home.*" %>
<%@ page import="java.net.URLDecoder" %>

<% 

String sender = request.getParameter("sender");
String receiver = request.getParameter("receiver");
String msg = request.getParameter("msg");
//System.out.println(msg);
//String message=URLDecoder.decode(msg);
System.out.println("->>>>>>>>>>>>>>>>>>>>>>>>>>>"+msg);
Home.sendMessage(Integer.parseInt(sender), Integer.parseInt(receiver), msg);

%>