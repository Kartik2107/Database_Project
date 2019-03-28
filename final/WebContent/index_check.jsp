<%@ page import="java.sql.*"%>

<%
String s=request.getParameter("val");
if(s==null || s.trim().equals("")){
out.print("Please enter the username");
}
else{
try{
	Class.forName("org.postgresql.Driver");
	String dbURL = "jdbc:postgresql://localhost/project2";
	String dbUser = "postgres";
	String dbPass = "new password";
	Connection con=null;
	con= DriverManager.getConnection(dbURL, dbUser, dbPass);
	PreparedStatement ps=con.prepareStatement("select user_id from accounts where user_id=?");
	//out.print(s);
	ps.setInt(1,Integer.parseInt(s));
	ResultSet rs=ps.executeQuery();
	int i=0;
	while(rs.next()){
		out.print("Username already exists, try again");
	}
	con.close();
	}catch(Exception e){e.printStackTrace();}
}
%>