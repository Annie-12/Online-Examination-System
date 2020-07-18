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
   <form>
    
    <table id="table" cellpadding="3" cellspacing="3" border="1">
	   <tr>
	   </tr>
	   <tr >
	   
	   <td><b>Course Name</b></td>
	   <td><b>Exam name</b></td>
	   <td><b>Date</b></td>
	   <td><b>start time</b></td>
	   <td><b>End time</b></td>
	   </tr>
    <%
    
    String date,st,et;
    ServletContext cn=getServletContext();
		try{
			
			Connection cn1=(Connection)cn.getAttribute("mycon");
			Statement st1=cn1.createStatement();
			ResultSet rs=st1.executeQuery("select * from exam");
			while(rs.next()){
				date=rs.getString(3);
				
				%>
				
				<tr bgcolor="#70C499">
	
				

<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>


</tr>

<% 
			 }
		}
		catch(Exception e){
			e.getStackTrace();
		}%>
    
    </table>
    </form>
    
            
    </div>
    <div class="right">
    <form>
    <table>
    <tr><td>Select course name</td><td> <select name="n1">
    <option>Select..</option>
    <%
    ServletContext cn3=getServletContext();
    try{
			
			Connection cn1=(Connection)cn3.getAttribute("mycon");
			Statement st2=cn1.createStatement();
			ResultSet rs=st2.executeQuery("select cname from course");
			while(rs.next()){%>
				<option><%=rs.getString(1)%></option>
			<% }
    }catch(Exception e){
    	e.getStackTrace();
    }
    %>
    </select>
    </td></tr>
    <tr><td>Search exam</td><td><input type="submit" name="b10" value="Search"/></td></tr>
    </table>
   
   </form>
    <%
    if(request.getParameter("b10")!=null){
    	String cna=(String)request.getParameter("n1");%>
    	<jsp:useBean id="abc" class="beanPack.Exam"></jsp:useBean>
    	<jsp:setProperty property="cname" name="abc" value="<%=cna%>"></jsp:setProperty>
    	
    	<jsp:setProperty property="data" name="abc" value="0"></jsp:setProperty><%} %>
    <form >
    <table>
   <%  String cna=(String)request.getParameter("n1");%>
    <tr><td>Course name</td><td><%=cna%></td></tr>
    <tr><td>Select Exam</td><td><select name="n2">
    <option>Select...</option>
    <%
    try {
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","Ananya@12");
		 Statement st4=con.createStatement();
		 ResultSet rs=st4.executeQuery("select * from exam where cname='"+cna+"'");
		while(rs.next()) {%>
			 <option><%=rs.getString(2)%></option>
			 
		<% }
		
	}catch(Exception e) {
		e.getStackTrace();
		
	}
    
    %>
    <option>
	</option>    
    </select></td></tr>
    <tr><td></td><td><input type="submit" name="b11"/></td></tr>
    </table>
    
    </form>
    <%
    String exid=(String)request.getParameter("n2");
    
	String date1=null,st1=null,et1=null;
    ServletContext cn4=getServletContext();
    try{
			
			Connection cn1=(Connection)cn4.getAttribute("mycon");
			Statement st2=cn1.createStatement();
			 ResultSet rs=st2.executeQuery("select * from exam where examid='"+exid+"'");
			 while(rs.next()){
				 date1=rs.getString(3);
				 st1=rs.getString(4);
				 et1=rs.getString(5);
			 }
			
    }
    catch(Exception e){
    	e.getStackTrace();
    }
    
    if(request.getParameter("b11")!=null){
    	session.setAttribute("exid",exid);
    	session.setAttribute("d1", date1);
    	session.setAttribute("s1",st1);
    	session.setAttribute("e1",et1);
    	response.sendRedirect("examtimevalidation.jsp");
    }
    
    %>
    
    </div>
    </div>
</body>
</html>