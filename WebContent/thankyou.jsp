<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Thank you for taking the test...</h1>

<%
String e=(String)session.getAttribute("exid");
		String m=(String)session.getAttribute("name");
		System.out.println(""+m);
		float i=0,total=0;
		try{
ServletContext cn3=getServletContext();
		Connection cn4=(Connection)cn3.getAttribute("mycon");
		Statement st3=cn4.createStatement();
		Statement st4=cn4.createStatement();
		//ResultSet rs3=st3.executeQuery("select * from question where Examname='"+e+"'");
		ResultSet rs4=st4.executeQuery("select * from answer where examid='"+e+"' and type='s'");
		while(rs4.next()){
			int correct=Integer.parseInt(rs4.getString(3));
			total++;
			if(correct==rs4.getInt(5)){
				i++;
			}
		}
		float per=(i/total)*100;%>
		Your marks is =<%=per%>%
		<%PreparedStatement pr=cn4.prepareStatement("insert into result values(?,?,?,?,?,?)");
		pr.setString(1,m);
		pr.setString(2,e);
		pr.setFloat(3,i);
		pr.setFloat(4,total);
		String perr=per+"%";
		pr.setString(5,perr);
		String pri=m+e;
		pr.setString(6,pri);
		int v3=pr.executeUpdate();
		if(v3>0){
			System.out.println(""+v3);
		}
}catch(Exception exx)
		{
			exx.getMessage();
		}
		
%>

</body>
</html>