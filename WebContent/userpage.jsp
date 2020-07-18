<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<% 
	String nm=(String)session.getAttribute("name");
	String ps=(String)session.getAttribute("password");
	
	String psw="",ty="";
	ServletContext cn=getServletContext();
	try{
		Connection cn1=(Connection)cn.getAttribute("mycon");
		PreparedStatement pr=cn1.prepareStatement("select password, Type from user where Email= ?");
		String typ="Admin";
		pr.setString(1,nm);
		ResultSet rs=pr.executeQuery();
		if(rs.next()){
			psw=rs.getString(1);
			ty=rs.getString(2);
			if(psw.equals(ps)){
				if(ty.equals(typ)){
				response.sendRedirect("adminHome.jsp");}
				else{
					response.sendRedirect("studentHome.jsp");
				}
				out.write(""+ty);
				
			}
			else
			{
				out.write("incorrect");
				
			}
		}
		
	}catch(Exception e1){
		e1.printStackTrace();
	}
	
%>
</body>
</html>