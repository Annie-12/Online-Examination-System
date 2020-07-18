package beanPack;

import java.io.Serializable;
import java.sql.*;
import java.sql.DriverManager;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name,ps,email,add,dob;
	public void setName(String s) {
		
		name=s;
	}
	public String getName() {
		return name;
		
	}
public void setPs(String s) {
		
		ps=s;
	}
	public String getPs() {
		return ps;
		
	}
public void setAdd(String s) {
		
		add=s;
	}
	public String getAdd() {
		return add;
		
	}
public void setDob(String s) {
		
		dob=s;
	}
	public String getDob() {
		return dob;
		
	}
	public void setEmail(String s) {
		email=s;
		
		
	}
	public String getEmail() {
		return email;
		
	}
	public void setData(String k) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","your-mysql_password");
    		Statement st=con.createStatement();
    		ResultSet rs=st.executeQuery("select * from user where Email=?");
    		if(rs.next()) {
    			name=rs.getString(2);
    			email=rs.getString(4);
    			add=rs.getString(5);
    			dob=rs.getString(6);
    		}
		}catch(Exception e) {
			e.getStackTrace();
		}
	}
	public String getData() {
		return name;
	}
}
