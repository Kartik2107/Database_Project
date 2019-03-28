
<%@ page import="java.util.*"%>
<%@ page import="Home.*" %>
<% 

String s=request.getParameter("sender");
String p=request.getParameter("receiver");
String sess=(String)session.getAttribute("user_id");

List<SingleMessage> messages = Home.getMessages(Integer.parseInt(s), Integer.parseInt(p));

if(!sess.equals("0")){

	for(int i=0; i<messages.size(); i++){
		SingleMessage object = messages.get(i);
		
		if(object.getSenderId() == Integer.parseInt(sess)){	
			out.println("<div class=\"row border text-center ind-msg mt-2 mr-1\" style=\"float:right; background-color:#e5e8e8;\">");
	    	out.println(object.getMessage());
	  		out.println("</div>");
	  		out.println("<br><br>");
		}
		else{
			out.println("<div class=\"row border text-center ind-msg mt-2 ml-1\" style=\"float:left; background-color:#00a591; color:white\">");
			out.print(object.getMessage());
			out.print("</div>");
			out.println("<br><br>");
	    }
	
	}
}



%>