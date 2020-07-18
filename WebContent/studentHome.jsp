<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="styleDsh.css" rel="stylesheet" type="text/css"></link>
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
    <% String mail=(String)session.getAttribute("name"); %>
    <h2 class="main">Welcome <%=mail %></h2>
    </div>
</body>
</html>