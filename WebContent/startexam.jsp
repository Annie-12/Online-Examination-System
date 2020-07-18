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

//int et1=Integer.parseInt(et);
DateFormat formatter1=new SimpleDateFormat("HH:mm");  
Date et1=(formatter1.parse(et));
String[] arrOfStr = et.split(":",4); 

String hr=arrOfStr[0];
String min=arrOfStr[1];
String sec=arrOfStr[2];

%>

<jsp:useBean id="p" class="beanPack.DB" scope="page"/>

<br><br>
<div class="main">
<form>
                     
                   <%
                   if(request.getParameter("next")!=null){
                	  ArrayList<Question> list1=p.getQuestions(ex);
						int index=p.getNext() ;
					
						Question question1=(Question)list1.get(index);
						%>
						
						<div class="question" >
						<b><label class="question-label"><%=index+1%></label>
						<%=question1.getQuestion()%></b>
                                                </div>
						<div class="answer">
							<input type="radio" id="c1<%=index%>" name="ans<%=index%>" value="<%=question1.getOp1()%>"/>
							<label for="c1<%=index%>"><%=question1.getOp1()%></label>
							<input type="radio" id="c2<%=index%>" name="ans<%=index%>" value="<%=question1.getOp2()%>" />
							<label for="c2<%=index%>"><%=question1.getOp2()%></label>
						
							<input type="radio" id="c3<%=index%>" name="ans<%=index%>" value="<%=question1.getOp3()%>" />
							<label for="c3<%=index%>"><%=question1.getOp3()%></label>
							<input type="radio"  id="c4<%=index%>" name="ans<%=index%>" value="<%=question1.getOp4()%>"/>
							<label for="c4<%=index%>" ><%=question1.getOp4()%></label>
							<input type="text" value="<%=question1.getQid()%>"/>
						</div>
						
                <%   }
                   
                   %>
                   
                   <%
                   
                   if(request.getParameter("prev")!=null){
                	   ArrayList<Question> list1=p.getQuestions(ex);
						int index=p.getPrev() ;
						System.out.println("for "+index+"times");
						Question question1=(Question)list1.get(index);
						%>
						
						<div class="question" ><b>
						<label class="question-label"><%=index+1%></label>
						<%=question1.getQuestion() %></b>
                                               </div>
						<div class="answer">
							<input type="radio" id="c1<%=index%>" name="ans<%=index%>" value="<%=question1.getOp1()%>"/>
							<label for="c1<%=index%>"><%=question1.getOp1()%></label>
							<input type="radio" id="c2<%=index%>" name="ans<%=index%>" value="<%=question1.getOp2()%>" />
							<label for="c2<%=index%>"><%=question1.getOp2()%></label>
							<input type="radio" id="c3<%=index%>" name="ans<%=index%>" value="<%=question1.getOp3()%>" />
							<label for="c3<%=index%>"><%=question1.getOp3()%></label>
							<input type="radio"  id="c4<%=index%>" name="ans<%=index%>" value="<%=question1.getOp4()%>"/>
							<label for="c4<%=index%>" ><%=question1.getOp4()%></label>
							<%System.out.println(""+question1.getQid()); %>
						<input type="text" value=<%=question1.getQid()%>/>
						</div>
                	   
              <%     }
                   
                   
                   
                   %>
                   
                   
                   <%
                   
                   if(request.getParameter("done")!=null){
                	   response.sendRedirect("thankyou.jsp");
                   }
                   
                   %>
                   <br>
                   <table>
                      <tr><td><input type="submit" name="save" value="save"></td><td><input type="submit" name="next" value="Show question/next"></td></tr>
                <tr><td></td><td></td></tr>
                 <tr><td>  <input type="submit" name="prev" value="previous"> 
                   </td><td>
                   <input type="submit" name="done" value="Done"></td></tr>
                   </table>
               </form>
                   </div>
    <div id="r" class="right"><input type="text" id="i1" ><br>
    Exam overs at 
    <span><%=hr%></span>
    <span><%=min%></span>
    <span><%=sec%></span>
    <script>
    
    
    var div = document.getElementById("r");
var spans = div.getElementsByTagName("span");
var mhr=spans[0].innerHTML;
//alert(''+mhr);
var mmin=spans[1].innerHTML;
//alert(''+mmin);
var msec=spans[2].innerHTML;
console.log(msec);
var year = new Date().getFullYear();
var mon=new Date().getMonth();
var date=new Date().getDate();

var d = new Date(year,mon,date,mhr,mmin).getTime();

    var x = setInterval(function() {

    	  // Get today's date and time
    	  var now = new Date().getTime();
    	 
    	   //Find the distance between now and the count down date
    	  var distance = d - now;
    	   
    	  // Time calculations for days, hours, minutes and seconds
    	  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    	  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    	  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    	  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    	    
    	  // Output the result in an element with id="demo"
    	  document.getElementById("time").innerHTML = days + "d " + hours + "h "
    	  + minutes + "m " + seconds + "s ";
    	    
    	  // If the count down is over, write some text 
    	  if (distance < 0) {
    	    clearInterval(x);
    	    document.getElementById("time").innerHTML = "EXPIRED";
    	    window.location.href('thankyou.jsp');
    	  }
    	}, 1000);
    </script>
   <br>
   <br>
    Time remaining::<p id="time"></p>
    
    
    </div>               
      <%
      if(request.getParameter("save")!=null){
    	  
    	  
    	  
      }
      
      %>         
               
                
           
</body>
</html>