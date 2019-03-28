<%
String username=request.getParameter("roll");
session.setAttribute("user_id",username);
session.setAttribute("loggedin","1");
response.sendRedirect("loginPage.jsp");
%>