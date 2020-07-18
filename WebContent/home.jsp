<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Examination System</title>
<link href="styleH.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript">
function checkpass(){
	var p=fo.t2.value;
	var cp=fo.t3.value;
	if(p!=cp){
		alert("mismatch");
	}
}
</script>
</head>
<body>
<header>
    <nav>
    <h1>ONLINE EXAMINATION SYSTEM</h1>
        <ul>
        <li><a href="home.jsp">HOME</a></li>
        <li><a  href="about.html">ABOUT</a></li>
        <li><a href="Contact.html">CONTACT US</a></li>
        </ul>
    </nav>
    </header>
    <div id="nav"></div>
    <div class="fwim">
    <div class="log">
    <div class="form">
    <form class="f" name="fo" method="post">
    <input type="text" placeholder="Name" name="t1"/><br/>
        
        <input type="password" placeholder="set Password" name="t2"/><br/>
        <input type="password" placeholder="confirm password" name="t3"/><br/>
        <input type="text" placeholder="E-mail" name="t4"/><br/>
        <input type="text" placeholder="Address" name="t5"/><br/>
        <input type="text" placeholder="DOB" name="t6"/><br/>
    <input type="submit" name="b1" value="Sign up" onclick="checkpass()"/>
    <p class="message">Already registered!!<a href="#">Login</a></p>
    </form>
    <% 
    if(request.getParameter("b1")!=null){
    	session.setAttribute("name",request.getParameter("t1"));
    	if((request.getParameter("t2")).equals(request.getParameter("t3"))){
    		session.setAttribute("ps",request.getParameter("t2"));
    	session.setAttribute("mail",request.getParameter("t4"));
    	session.setAttribute("add",request.getParameter("t5"));
    	session.setAttribute("dob",request.getParameter("t6"));
    	response.sendRedirect("registerPage.jsp");
    }}
    %>
        <form class="sign" method="post" action="f">
        <input type="text" placeholder="name" name="t7"/>
            <input type="password" placeholder="password" name="t8"/><br/>
            <input type="submit" name="b2" value="Login">
            <p class="message">Not registered??<a href="#">Register</a></p>
            
        </form>
    </div>
    </div>
        <script src='https://code.jquery.com/jquery-3.4.1.min.js'>
        </script>
        <script>
        $('.message a').click(function(){
            $('form').animate({height:"toggle",opacity:"toggle"},"slow");
        });
        </script>
    </div>
    <div id="nav"></div>
    <marquee>
    <p>Welcome to this page.We offer online quiz on different subjects of Computer Science.Hope you have a good experience! </p>
        </marquee>
   
    
</body>
</html>