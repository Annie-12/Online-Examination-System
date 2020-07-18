

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;

@WebServlet("/f")
public class Checklog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Checklog() {
        super();
        // TODO Auto-generated constructor stub
    }

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			String nm=(String)request.getParameter("t7");
			String ps=(String)request.getParameter("t8");
			String psw="",ty="";
			HttpSession ses=request.getSession();
			out.write(""+nm);
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
							
							ses.setAttribute("name", nm);
							ses.setAttribute("ps", ps);
							response.sendRedirect("adminHome.jsp");}
						else{
							ses.setAttribute("name", nm);
							ses.setAttribute("ps", ps);
							response.sendRedirect("studentHome.jsp");
						}
						
					}
					else
					{
						out.write("incorrect");
						response.sendRedirect("home.jsp");
						
					}
				}
				
			}catch(Exception e1){
				e1.printStackTrace();
			}
			
			out.write(""+1);
			
		}

}
