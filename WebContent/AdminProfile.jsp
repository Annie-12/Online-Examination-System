<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="styleDash.css" rel="stylesheet" type="text/css"></link>
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
	String mail=(String)session.getAttribute("name");
	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	response.setHeader("Expires","0");
%>
<header>
    <nav>
    <h1> Admin </h1>
        <ul>
        <li><a href="adminHome.jsp">HOME</a></li>
        <li><form action="logout"><input type="submit" name="b5" value="Logout"/></form></li>
                </ul>
    </nav>
    </header>
    <div id="divide"></div>
    <div class="col1">
    <ul>
    <li><a href="AdminProfile.jsp">Profile</a></li>
    <li><a href="AddExam.jsp">Add Examination</a></li>
    <li><a href="AddQ.jsp">Add Question</a></li>
    <li><a href="ViewCourseAdmin.jsp">View all courses</a></li>
    <li><a href="ViewResult.jsp">View Students' Result</a></li>
    </ul>
    </div>
    <div class="main">
    <br><br><br><br><br><br><br>
   <center>
    <form>
    
  	
  <% 	ServletContext cn=getServletContext();
  		try{
  			
  			Connection cn1=(Connection)cn.getAttribute("mycon");
  			Statement st=cn1.createStatement();
  			ResultSet rs=st.executeQuery("select * from user where Email='"+mail+"'");
  			while(rs.next()){
  				%>
  				<table border=1>
  				<tr bgcolor="#70C499">
  	<td>Name</td>
  				

	<td><%=rs.getString(2) %></td></tr>
	<tr bgcolor="#70C499"><td>Email</td><td><%=rs.getString(4) %></td></tr>
	<tr bgcolor="#70C499"><td>Address</td><td><%=rs.getString(5) %></td></tr>
	<tr bgcolor="#70C499"><td>Date of birth</td><td><%=rs.getString(6) %></td></tr>
  			<% }
  		}
  		catch(Exception e){
  			e.getStackTrace();
  		}%>
  	</table>
  	</form>
  	</center>
  	</div>
  	
</body>
</html>