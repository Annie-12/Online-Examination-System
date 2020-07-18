<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.Date" import="java.util.Calendar" import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<% 
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidte");
if(session.getAttribute("name")==null){
	response.sendRedirect("home.jsp");
}
%>
<%
String dt=(String)session.getAttribute("d1");
Date date1 = Calendar.getInstance().getTime();  
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
String strDate = dateFormat.format(date1);  
out.write(""+strDate);
String exid=(String)session.getAttribute("exid");
int i=0;
String st1=(String)session.getAttribute("s1");
String ed1=(String)session.getAttribute("e1");
Date s2=Calendar.getInstance().getTime();
DateFormat ss=new SimpleDateFormat("hh:mm");
String st2=ss.format(s2);
if(dt.equals(strDate) )
{
	session.setAttribute("e1",ed1);
	System.out.println("examval"+ed1);
	session.setAttribute("s1",st1);
	session.setAttribute("exid",exid);
	session.setAttribute("index",i);
	response.sendRedirect("continue.jsp");
}
else
{%>
	<script >alert('Current date time does not match');
	window.location.href = 'Examtable.jsp?';
	
	</script>
<%}
out.write(""+st2);
%>
<span id="i1"><%=dt%></span>





</body>
</html>