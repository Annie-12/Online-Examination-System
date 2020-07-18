<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidte");
if(session.getAttribute("name")==null){
	response.sendRedirect("home.jsp");
}
%>
<%
String nm=(String)session.getAttribute("name");
String ps=(String)session.getAttribute("ps");
String mail=(String)session.getAttribute("mail");
String add=(String)session.getAttribute("add");
String dob=(String)session.getAttribute("dob");
ServletContext cn=getServletContext();
try{
	Connection cn1=(Connection)cn.getAttribute("mycon");
	Statement st=cn1.createStatement();
	
	ResultSet rs=st.executeQuery("select * from user");
	
	while(rs.next()){
		
	}
	rs.last();
	int count=rs.getRow()+1;
	PreparedStatement pr=cn1.prepareStatement("insert into user values(?,?,?,?,?,?,?)");
	pr.setInt(1,count);
	pr.setString(2, nm);
	pr.setString(3, ps);
	pr.setString(4,mail);
	pr.setString(5,add);
	pr.setString(6,dob);
	pr.setString(7,"student");
	int v=pr.executeUpdate();
	if(v>0){
		out.write("<script type='text/javascript'>alert('you have registered succesfully')</script>");
		}
	else
		out.write(""+v);
	
}catch(Exception e){
	e.getStackTrace();
}
%>
</body>
</html>