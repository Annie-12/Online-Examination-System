package beanPack;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class Exam implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cname,examid;
	private Connection con;
	private ResultSet rs;
	private Statement st;
	public void setCname(String cname) {
		this.cname=cname;
	}
	public void setExamid(String examid) {
		this.examid=examid;
	}
	public String getCname() {
		return cname;
	}
	public String getExamid()
	{
		return examid;
	}
	public void setData(String k) {
	
		try {
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","your_mysql_password");
			 st=con.createStatement();
			 rs=st.executeQuery("select * from exam where cname='"+cname+"'");
			while(rs.next()) {
				 examid=rs.getString(2);
			}
			
		}catch(Exception e) {
			e.getStackTrace();
			
		}
		
	}

}
