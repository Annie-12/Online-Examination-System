<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link href="styleDsh.css" rel="stylesheet" type="text/css"></link>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidte");
if(session.getAttribute("name")==null){
response.sendRedirect("home.jsp");
}

%>
<header>
    <nav>
    <h1> Student </h1>
        <ul>
        <li><a href="studentHome.jsp">HOME</a></li>
        <li><form action="logout"><input type="submit" name="b5" value="Logout"/></form></li>
        </ul>
    </nav>
    </header>
    <div id="divide"></div>
    <div class="portion">
    <div class="col1">
    <ul>
    <li><a href="StudentProfile.jsp">Profile</a></li>
    <li><a href="Examtable.jsp">Start Examination</a></li>
    <li><a href="result.jsp">Result</a></li>
    </ul>
    </div>
    <div class="main"> 
    <center>
  <h2> CANDIDATE ID:<%=session.getAttribute("name") %></h2><br>
   <form>
    <b>List of given Exam</b>
    <table id="table" cellpadding="3" cellspacing="3" border="1">
	   <tr>
	   </tr>
	   <tr >
	   
	   <td><b>Exam name</b></td>
	   <td><b>Date</b></td>
	   <td><b>Percentage</b></td>
	   </tr>
	   <%
	   String mail=(String)session.getAttribute("name");
	   String ex=(String)session.getAttribute("exid");
	   ServletContext cn=getServletContext();
	   String dtt="";
	   try{
		   Connection cn1=(Connection)cn.getAttribute("mycon");
			Statement st1=cn1.createStatement();
			Statement st2=cn1.createStatement();
			ResultSet rs=st1.executeQuery("select * from result where mail='"+mail+"'");
			
			while(rs.next()){
				String ex2=rs.getString(2);
				
			ResultSet rs2=st2.executeQuery("select * from exam where examid='"+ex2+"'");
			while(rs2.next()){
				
				dtt=rs2.getString(3);
				
			}
			
			%>
				<tr bgcolor="#70C499">
				<td><%=rs.getString(2) %></td>
				<td><%=dtt%></td>
				
				<td><%=rs.getString(5) %></td>


				</tr>

				<% 
							 }
			
	   }catch(Exception e)
	   {
		   e.getMessage();
	   }
	   %>
	   </table>
	   </form>
	   </center>
	   </div>
	   </div>
</body>
</html>