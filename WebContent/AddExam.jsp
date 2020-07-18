<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
<%@ page import = "java.io.*,java.util.Date" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
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
   <br><br>
   <form>
   <table>
   <tr><td>Course Name</td><td ><input type="text" name="t10"/></td></tr>
   <tr><td>Course id </td><td><input type="text" name="t11"></td></tr>
     <tr><td></td><td> <input type="submit" id="tab1" value="add course" name="b3"/></td></tr></table>
                </form>
                <br><br>
                <form><table>
   <tr><td>Course Name </td><td> <select name="n1">
     <option>Select..</option>
    <%
    ServletContext cn=getServletContext();
    try{
			
			Connection cn1=(Connection)cn.getAttribute("mycon");
			Statement st=cn1.createStatement();
			ResultSet rs=st.executeQuery("select cname from course");
			while(rs.next()){%>
				<option><%=rs.getString(1)%></option>
			<% }
    }catch(Exception e){
    	e.getStackTrace();
    }
    %>
    </select></td></tr>
 	<tr><td>Exam id 	</td><td><input type="text" name="t12"/></td></tr>
 	<tr><td>Enter date </td><td><input type="date" name="t13"/></td></tr>
   
	<tr><td>Enter start time</td><td><input type="time" name="t14"/></td></tr>
	<tr><td>Enter End time</td><td><input type="time" name="t15"/></td></tr>
    <tr><td></td><td>    <input type="submit" id="tab1" value="add exam" name="b5"/></td></tr>
  
   </table>
   </form>
  
   </div>
   <%
   	
   	if(request.getParameter("b3")!=null){
   		String cna=request.getParameter("t10");
   		int cid=Integer.parseInt(request.getParameter("t11"));
   	   	ServletContext cn2=getServletContext();
   		try{
   			
   			Connection cn1=(Connection)cn2.getAttribute("mycon");
   			
   			PreparedStatement pr=cn1.prepareStatement("insert into course values(?,?)");
   			pr.setInt(1,cid);
   			
   			pr.setString(2,cna);
   			
   					
   			int q=pr.executeUpdate();
   			if(q>0){
   				response.sendRedirect("Correct.html");
   			}
   			else{
   				response.sendRedirect("error.html");
   			}
   			
   		}catch(Exception e){
   			e.getStackTrace();
   			
   		}
   	}
   %>
   <%
   if(request.getParameter("b5")!=null){
	   String cna=request.getParameter("n1");
  		String eid=(request.getParameter("t12"));
  		
  		DateFormat formatter1 = null,formatter2=null,formatter3=null;
        Date date=null,st = null,et=null;
		String d=request.getParameter("t13");

        formatter1 =new SimpleDateFormat("dd-MM-yyyy");
        date =(Date) formatter1.parse(d);
        
        java.sql.Date date1 = new java.sql.Date(date.getTime());
        
        String t1=request.getParameter("t14");
        formatter2=new SimpleDateFormat("hh:mm");
        st=(Date)formatter2.parse(t1);
        java.sql.Time st1 = new java.sql.Time(st.getTime());
        String t2=request.getParameter("t15");
        formatter3=new SimpleDateFormat("hh:mm");
        et=(Date)formatter3.parse(t2);
        java.sql.Time et1 = new java.sql.Time(et.getTime());
	   ServletContext cn3=getServletContext();
	   try{
		   Connection cn4=(Connection)cn3.getAttribute("mycon");
		   PreparedStatement pr=cn4.prepareStatement("insert into exam values(?,?,?,?,?)");
  			pr.setString(1,cna);
  			
  			pr.setString(2,eid);
  			pr.setString(3,d);
  			pr.setString(4,t1);
  			pr.setString(5,t2);
  			int q=pr.executeUpdate();
  			if(q>0){
  				response.sendRedirect("Correct.html");
  			}
  			else{
  				response.sendRedirect("error.html");}
	   }catch(Exception e){
	   e.getStackTrace();}
   }
   // out.write(""+request.getParameter("t14"));
   %>
   
   
   
</body>
</html>