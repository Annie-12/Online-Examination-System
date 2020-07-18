<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
    <br>
    <form>
    <table>
    <tr><td>Select course name</td><td> <select name="n1">
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
    </select>
    </td></tr>
    <tr><td>Search exam</td><td><input type="submit" name="b10" value="Search"/></td></tr>
    </table></form>
    <%
    if(request.getParameter("b10")!=null){
    	String cna=(String)request.getParameter("n1");%>
    	<jsp:useBean id="abc" class="beanPack.Exam"></jsp:useBean>
    	<jsp:setProperty property="cname" name="abc" value="<%=cna%>"></jsp:setProperty>
    	
    	<jsp:setProperty property="data" name="abc" value="0"></jsp:setProperty> <%} %>
    <form>
    <table>
   <%  String cna=(String)request.getParameter("n1");%>
    
    <tr><td>Select Exam</td><td><select name="n2">
    <option>Select...</option>
    <%
    try {
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","Ananya@12");
		 Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery("select * from exam where cname='"+cna+"'");
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
    <tr><td></td><td><input type="submit" name="b66"/></td></tr>
    </table>
    </form>
    <form class="ques">
    <%
    int count=1;
    String exi=request.getParameter("n2");
    String cou="1";
    try {
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","Ananya@12");
		 Statement st=con.createStatement();
		 Statement st2=con.createStatement();
		 ResultSet rs=st.executeQuery("select * from question where Examname='"+exi+"'");
		 ResultSet rs2=st2.executeQuery("select * from exam where examid='"+exi+"'");
		 while(rs2.next()){
			 
			 cou=rs2.getString(1);
			 out.write(""+cou);
			 
		 }
		while(rs.next()) {
		count++;
		
		}}catch(Exception e){
			e.getMessage();
		}
    
    %>
    <table>
    <tr><td>Course Id</td><td><input type="text" name="ci" value="<%=cou%>"/></td></tr>
    <tr><td>Exam Id</td><td><input type="text" name="ei" value="<%=exi%>"/></td></tr>
    <tr><td>Question Id</td><td><input type="text" name="qid" value="<%=count%>"/></td></tr>
    <tr><td >Enter Question</td><td id="qu"><textarea rows="5" cols="30" name="tb"></textarea> </td></tr>
    <tr><td>Option 1:</td><td><input type="text" name="op1"/></td></tr>
    <tr><td>Option 2:</td><td><input type="text" name="op2"/></td></tr>
    <tr><td>Option 3:</td><td><input type="text" name="op3"/></td></tr>
    <tr><td>Option 4:</td><td><input type="text" name="op4"/></td></tr>
    <tr><td>Correct</td><td><input type="text" name="cor"/></td></tr>
    <tr><td></td><td><input type="submit" name="b55"/></td></tr>
    </table>
    </form>
    <%! static int primary1=0; %>
    <%
    	if(request.getParameter("b55")!=null){
    	int qi=Integer.parseInt(request.getParameter("qid"));
    	String exii=request.getParameter("ei");
    	primary1++;
    	String primary=primary1+"admin"+exii;
    	System.out.println("Qid"+qi);
    	int v1=0,v2=0;
    	String str="",str1="";
    	ServletContext cn2=getServletContext();
        try{
    			
    			Connection cn1=(Connection)cn2.getAttribute("mycon");
    			PreparedStatement pr=cn1.prepareStatement("insert into question values(?,?,?,?,?,?,?,?)");
        		pr.setString(1,request.getParameter("ei"));
        		pr.setString(2,request.getParameter("tb"));
        		pr.setString(3,request.getParameter("op1"));
        		pr.setString(4,request.getParameter("op2"));
        		pr.setString(5,request.getParameter("op3"));
        		pr.setString(6,request.getParameter("op4"));
        		pr.setString(7,request.getParameter("cor"));
        		System.out.println("7");
        		pr.setInt(8,qi);
        		System.out.println("8");
        		v1=pr.executeUpdate();
        		System.out.println(""+v1);
        		
        		
        		if(v1>0){
        			PreparedStatement pr2=cn1.prepareStatement("insert into answer values(?,?,?,?,?,?,?)");
            		pr2.setString(1,request.getParameter("ei"));
            		pr2.setInt(2,qi);
            		pr2.setString(3,request.getParameter("cor"));
            		pr2.setString(4,primary);
            		pr2.setInt(5,0);
            		System.out.println(""+5);
            		pr2.setString(6,"admin");
            		pr2.setString(7,"admin");
            		//System.out.println(""+6);
            		v2=pr2.executeUpdate();
            		if(v2>0)
        			response.sendRedirect("Correct.html");
        		
        		}
        		else{
        			response.sendRedirect("error.html");
        		}
        }catch(Exception e1){
        	e1.getStackTrace();
       System.out.println("hi");
        }
        
        }
    %>

    </div>
</body>
</html>