<%@ page import="Home.*" %>
<%	

String sess=(String)session.getAttribute("user_id");
String text=request.getParameter("pehlaMessage");
String id=request.getParameter("hidID");
System.out.println("--------------first messagae-------");
System.out.println(sess);
System.out.println(text);
System.out.println(id);
System.out.println("--------------first messagae ends-------");
Home.sendMessage(Integer.parseInt(sess), Integer.parseInt(id), text);
response.sendRedirect("Message.jsp");
%>