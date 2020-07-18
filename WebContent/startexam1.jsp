<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.ArrayList" import="java.text.DateFormat" import="java.text.SimpleDateFormat" import ="java.util.Date" import ="beanPack.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link href="styleExam.css" rel="stylesheet" type="text/css"></link>
</head>
<body>
<header>
<h1>Online Examination</h1>
</header>
<div id="divide"></div>
<%
String ex=(String)session.getAttribute("exid");
String et=(String)session.getAttribute("e1")+":00";
String st=(String)session.getAttribute("s1");
DateFormat formatter1=new SimpleDateFormat("HH:mm");  
//Date et1=(formatter1.parse(et));
String[] arrOfStr = et.split(":",4); 
String hr=arrOfStr[0];
String min=arrOfStr[1];
String sec=arrOfStr[2];

%>
<div id="r" class="right"><br>
    Exam overs at 
    <span><%=hr%></span>
    <span><%=min%></span>
    <span><%=sec %></span>
    <script>
    
    
    var div = document.getElementById("r");
var spans = div.getElementsByTagName("span");
var mhr=spans[0].innerHTML;
var mmin=spans[1].innerHTML;

var msec=spans[2].innerHTML;
console.log(msec);
var year = new Date().getFullYear();
var mon=new Date().getMonth();
var date=new Date().getDate();

var d = new Date(year,mon,date,mhr,mmin).getTime();

    var x = setInterval(function() {
    	  var now = new Date().getTime();
    	  var distance = d - now;
    	  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    	  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    	  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    	  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    	  document.getElementById("time").innerHTML = days + "d " + hours + "h "
    	  + minutes + "m " + seconds + "s ";
    	 
    	  if (distance < 0) {
    	    clearInterval(x);
    	    document.getElementById("time").innerHTML = "EXPIRED";
    	    window.location.href('thankyou.jsp');
    	  }
    	}, 1000);
    </script>
   <br>
   <br>
    Time remaining::<p id="time"> </p>
    
    
    </div>               
<%!
static int x=0;
static int x1=0;
static int rc=0;
static int var=0;
static int visible=0;
static int count=1;
int flag=0;
int i,c;
static int result=0;
static int index=0;
int[] arr=new int[150];
static ResultSet rs;
ResultSet rs2;

%>
<div class="main">

<%
	String mail=(String)session.getAttribute("name");

	String up=mail+ex;
	ServletContext cn=getServletContext();
	try{
		Connection cn1=(Connection)cn.getAttribute("mycon");
		Statement st1=cn1.createStatement();
		if(x==0 && visible==0){
			rs=st1.executeQuery("Select * from question where Examname='"+ex+"'");
			x++;
		}
		if(rc==0){
			Statement st2=cn1.createStatement();
			rs2=st2.executeQuery("Select * from question where Examname='"+ex+"'");
			
			while(rs2.next()){
				rc++;
			}
			rs2.first();
			
		}
		if(request.getParameter("next")!=null|| request.getParameter("sub")!=null || x1==0){
			x1=1;
			Connection cn6=(Connection)cn.getAttribute("mycon");
			Statement st6=cn6.createStatement();
			if(request.getParameter("t1")!=null ){
				String s1=request.getParameter("t1");
				
				String s=s1.substring(0,1);
				
			i=Integer.parseInt(s);
				arr[var-1]=i;
				
				
				int up3=rs.getInt(8);
			
				
			st6.executeUpdate("UPDATE answer SET myanswer="+i+ " WHERE mail='"+mail+"' and questionid="+up3);
				
			}
			var++;
			if(var==1){
				rs.next();
				out.write("<form>");
				out.write("Q"+var+":"+rs.getString(2)+"<br>");
				int quesid=rs.getInt(8);
				//out.write("<input type='text' value="+quesid+"/><br>");
			for(i=1;i<5;i++){
				if(arr[var-1]==i)
				{
					out.write("<body>");
					
					out.write("<div>");
					out.write(i+"<input type='radio' name='t1' value="+i+" checked='true'/>"+rs.getString(i+2)+"<br>");
					out.write("</div>");
					out.write("</body>");
				}
				out.write(i+"<input type='radio' name='t1' value="+i+"/>"+rs.getString(i+2)+"<br>");
				
			}
			out.write("<input type='submit' name='next' value='next'/>");
			out.write("</form>");
			out.write("Page:"+var);
			
						}
			if(var>=2 && var<=rc-1){
				out.write("<form>");
				rs.next();
				out.write("Q"+var+":"+rs.getString(2)+"<br>");
				int quesid=rs.getInt(8);
				//out.write("<input type='text' value="+quesid+"/><br>");
			for(i=1;i<5;i++){
				if(arr[var-1]==i)
				{
					out.write(i+"<input type='radio' name='t1' value="+i+" checked='true'/>"+rs.getString(i+2)+"<br>");
				}
				else{
					out.write(i+"<input type='radio' name='t1' value="+i+" />"+rs.getString(i+2)+"<br>");
				
				}
				}
			out.write("<input type='submit' name='next' value='next'/><br>");
			out.write("<input type='submit' name='prev' value='prev'/>");
			out.write("</form>");
			out.write("Page:"+var);
			}
			if(var == rc){
				out.write("<form>");
				rs.next();
				out.write("Q"+var+":"+rs.getString(2)+"<br>");
				int quesid=rs.getInt(8);
				out.write("<input type='hidden' value="+quesid+"/><br>");
				
				for(i=1;i<5;i++){
					if(arr[var-1]==i)
					{
						out.write(i+"<input type='radio' name='t1' value="+i+" checked='true'/>"+rs.getString(i+2)+"<br>");
					}
					else{
						out.write(i+"<input type='radio' name='t1' value="+i+" />"+rs.getString(i+2)+"<br>");
					
					}
					}
				out.write("<input type='submit' name='prev' value='prev'/> <br>");
				out.write("<input type='submit' name='sub' value='submit'/>");
				out.write("</form>");
				out.write("Page:"+var);
				}
			if(request.getParameter("sub")!=null){
				session.setAttribute("examid",ex);
				
				response.sendRedirect("thankyou.jsp");
			}
		}
		
		if(request.getParameter("prev")!=null){
			if(request.getParameter("t1")!=null ){
				String s1=request.getParameter("t1");
				String s=s1.substring(0,1);
				i=Integer.parseInt(s);
				arr[var-1]=i;
				String up2=(up+rs.getInt(8)).trim();
				
			}
			var--;
			if(var==1){
				rs.previous();
				out.write("<form>");
				out.write("Q"+var+":"+rs.getString(2)+"<br>");
				int quesid=rs.getInt(8);
				
			for(i=1;i<5;i++){
				if(arr[var-1]==i)
				{
				
					out.write("<div>");
					out.write(i+"<input type='radio' name='t1' value="+i+" checked='true'/>"+rs.getString(i+2)+"<br>");
					out.write("</div>");
					out.write("</body>");
				}
				else{
				out.write(i+"<input type='radio' name='t1' value="+i+"/>"+rs.getString(i+2)+"<br>");
				}
			}
			out.write("<input type='submit' name='next' value='next'/><br>");
			out.write("<input type='submit' name='save' value='save'/><br>");
			out.write("</form>");
			out.write("Page:"+var);
			
			}
			
			if(var>=2 && var<=rc-1){
				out.write("<form>");
				rs.previous();
				out.write("Q"+var+":"+rs.getString(2)+"<br>");
				int quesid=rs.getInt(8);
			
			for(i=1;i<5;i++){
				if(arr[var-1]==i)
				{
					out.write(i+"<input type='radio' name='t1' value="+i+" checked='true'/>"+rs.getString(i+2)+"<br>");
				}
				else{
					out.write(i+"<input type='radio' name='t1' value="+i+"/>"+rs.getString(i+2)+"<br>");
				
				}
				}
			out.write("<input type='submit' name='next' value='next'/><br>");
			out.write("<input type='submit' name='prev' value='prev'/><br>");
			out.write("<input type='submit' name='save' value='save'/>");
			out.write("</form>");
			out.write("Page:"+var);
			}
			
		}
		if(var==0 && visible==0){
			visible=1;
			
		}
		if(var==rc+1){
			for(flag=0;flag<rc;flag++){
				arr[flag]=0;
			}
			visible=0;
			x=0;
			result=0;
			var=0;
			x1=0;
			
		}
	}catch(Exception e){e.getMessage();
	System.out.println("inside catch");
	
	}

%>
</div>
</body>
</html>