<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link href="styleDash.css" rel="stylesheet" type="text/css"></link>
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
   <br><br><br><br>
   
   <table cellpadding="3" cellspacing="3" border=1>
	   <tr>
	   </tr>
	   <tr >
	   <td><b>Id</b></td>
	   <td><b>Course Name</b></td>
	   <td><b>Exams</b></td>
	   </tr>
	 
   <% 
   
	   ServletContext cn3=getServletContext();
  		try{
  			
  			Connection cn1=(Connection)cn3.getAttribute("mycon");
  			Statement st=cn1.createStatement();
  			Statement st1=cn1.createStatement();
  			ResultSet rs=st.executeQuery("select * from course");
  			
  			while(rs.next()){
  				ResultSet rs1=st1.executeQuery("select examid from exam where cname='"+rs.getString("cname")+"'");
  				%>
  				<tr bgcolor="#70C499">

	<td><%=rs.getInt("id") %></td>
	<td><%=rs.getString("cname") %></td>
	<%
	while(rs1.next()){%>
		<td><%=rs1.getString(1) %></td>
	<% }%>
	
	
	</tr>
  			<% }
  		}
  		catch(Exception e){
  			e.getStackTrace();
  		}
   
   %>
  </table>
   </div>     
   
</body>
</html>