<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sq"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<sq:setDataSource var ="db" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost:3306/projects" user="root" password="Ananya@12"/>



<sq:update var="rs" dataSource="${db}">

insert into user values(?,?,?,?,?,?,?);
<sq:param value="${1}"></sq:param>
<sq:param value="${'admin'}"></sq:param>
<sq:param value="${'1234'}"></sq:param>
<sq:param value="${'admin@gmail.com'}"></sq:param>
<sq:param value="${'Kolkata' }"></sq:param>
<sq:param value="${'10/12/1998'}"></sq:param>
<sq:param value="${'Admin'}"></sq:param>

</sq:update>
<c:if test="${rs!=null }">
<c:out value="ins"></c:out>
</c:if>
</body>
</html>