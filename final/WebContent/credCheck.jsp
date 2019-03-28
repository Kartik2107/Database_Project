<%@ page import="java.sql.*"%>

<%
String s=request.getParameter("val");
String p=request.getParameter("pass");
if(s==null || s.trim().equals("")){
out.print("Please enter the username");
}
else{
try{
	//System.out.println("------------------------------------------------");
Class.forName("org.postgresql.Driver");
String dbURL = "jdbc:postgresql://localhost/project2";
String dbUser = "postgres";
String dbPass = "new password";
Connection con=null;
//Connection con2=null;
con= DriverManager.getConnection(dbURL, dbUser, dbPass);

//con2= DriverManager.getConnection(dbURL, dbUser, dbPass);
PreparedStatement ps=con.prepareStatement("select user_id from accounts where user_id=? and password=? and block_status=0",ResultSet.TYPE_SCROLL_INSENSITIVE);
//out.print(s);
ps.setInt(1,Integer.parseInt(s));
ps.setString(2,p);

ResultSet rs=ps.executeQuery();
while(rs.next()){
	out.print("a");
}

//PreparedStatement ps2=con2.prepareStatement("select user_id from account where user_id=? and password1=? and admin='0'",ResultSet.TYPE_SCROLL_INSENSITIVE);
//out.print(s);
//ps2.setString(1,s);
//ps2.setString(2,p);

//ResultSet rs2=ps2.executeQuery();
//while(rs2.next()){
//	out.print("a");
//}

con.close();
//con2.close();
}catch(Exception e){e.printStackTrace();}
}
%>