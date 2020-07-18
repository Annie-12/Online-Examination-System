<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="styleDash.css" rel="stylesheet" type="text/css"></link>
<title></title>
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
        <li><a href="logout.jsp">LOGOUT</a></li>
                </ul>
    </nav>
    </header>
    <div id="divide"></div>
    <div class="col1">
    <ul>
    <li><a href="AdminProfile.jsp">Profile</a></li>
    <li><a href="AddExam.jsp">Add Examination</a></li>
    <li><a href="AddQ.jsp">Add Question</a></li>
    <li><a href="ViewCourseAdmin.jsp">View all courses</a>
    <li><a href="ViewResult.jsp">View Students' Result</a></li>
    </ul>
    </div>
    <h2 class="main">Welcome Admin</h2>
    
</body>
</html>