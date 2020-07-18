package beanPack;

import java.sql.*;
import java.util.*;



public class DB {
	ArrayList<Question> list=new ArrayList<Question>();
	///ListIterator<Question> listIterator = list.listIterator();
	public int size;
	static int pos=0;
	public  ArrayList<Question> getQuestions(String courseName) throws ClassNotFoundException{
        ArrayList<Question> list=new ArrayList<Question>();
        
        try {
        	Class.forName("com.mysql.jdbc.Driver");
    		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","your_mysql_password");
    		
            String sql="Select * from question where Examname=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,courseName);
            
            ResultSet rs=pstm.executeQuery();
            Question question;
            while(rs.next()){
               question = new Question(); 
               question.setExname(rs.getString(1));
              question.setQuestion(rs.getString(2));
              question.setOp1(rs.getString(3));
              question.setOp2(rs.getString(4));
              question.setOp3(rs.getString(5));
              question.setOp4(rs.getString(6));
              question.setCorrect(rs.getString(7));
              question.setQid(rs.getInt(8));
               list.add(question);
            }
           size=list.size();
           
           
        } catch (SQLException ex) {
          System.out.println("ex");
        	ex.getMessage();
        }
        
        return list;
    }
	public  int getNext() throws ClassNotFoundException{
		 
		 pos=pos+1;
		
		 if(pos>=size)
			 pos=0;
		 return pos;
		 
		 
	
  }
	public  int getPrev() throws ClassNotFoundException{
		 pos=pos-1;
		 if(pos<=0)
			 pos=0;
		 return pos;
		 
		 
	
 }


}
	
	
