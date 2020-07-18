<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<form action="startexam1.jsp" target="_blank">
<input type="submit" value="continue"/>

</form>

<br>
<%
String e=(String)session.getAttribute("exid");

out.write("Your exam id is "+e);


ServletContext cn3=getServletContext();
String var1=((String)session.getAttribute("name")).trim();
String str="";
String type="s";
try{
	int i=1;
	Connection cn4=(Connection)cn3.getAttribute("mycon");
	Statement st3=cn4.createStatement();
	ResultSet rs3=st3.executeQuery("select * from question where Examname='"+e+"'");
	while(rs3.next()){
		
		
		PreparedStatement pr2=cn4.prepareStatement("insert into answer values(?,?,?,?,?,?,?)");
		pr2.setString(1,e);
		out.write("qid "+rs3.getInt(8));
		pr2.setInt(2,rs3.getInt(8));
		
		pr2.setString(3,rs3.getString(7));
		out.write("correct"+rs3.getString(7));
		String var2=var1+e+rs3.getInt(8);
		session.setAttribute("pp", var2);
		pr2.setString(4,var2);
		
		out.write("primary for i="+i+"var2");
		pr2.setInt(5,999);
		pr2.setString(6,var1);
		pr2.setString(7,type);
		int v2=pr2.executeUpdate();
		
	}
}catch(Exception e3)
{
	e3.getMessage();
	
}

%>

</body>
</html>