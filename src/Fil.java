

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class Fil
 */
@WebFilter("/f")
public class Fil implements Filter {

    public Fil() {
        // TODO Auto-generated constructor stub
    }
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		String nm=request.getParameter("t7");
		String ps=request.getParameter("t8");		
		String psw="";
		PrintWriter out=response.getWriter();
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","your_mysql_password");
			PreparedStatement pr=con.prepareStatement("select password from user where Email= ?");
			//String typ="Admin";
			pr.setString(1,nm);
			ResultSet rs=pr.executeQuery();
			if(rs.next()){
				psw=rs.getString(1);
				out.write(""+nm);
				if(psw.equals(ps)){
					
					
					chain.doFilter(request, response);
				}
				else
				{
					RequestDispatcher rq=request.getRequestDispatcher("home.jsp");
					rq.forward(request, response);
				
					
				}
			}
			
		}catch(Exception e1){
			e1.printStackTrace();
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
