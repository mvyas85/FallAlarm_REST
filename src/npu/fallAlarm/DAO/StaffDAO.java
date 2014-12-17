package npu.fallAlarm.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import npu.fallAlarm.jdbc.JDBC;

public class StaffDAO {
	public static String loginCheck(String username, String password){
		String sid="";
		try {
			Connection connection=JDBC.getConnection();
			Statement stmt = connection.createStatement();
			String query = "select sid from staff where email='"+username+"' and password='"+password+"'";
			
        	ResultSet res = stmt.executeQuery(query);
			
			if(res.next()){
				sid=res.getString("sid");
				 System.out.println("Login Successful");
			 }
			else
				System.out.println("Login Failed");
			 connection.close();
        } 
		catch (Exception ex) {
			ex.printStackTrace(); 
        }
		
		return sid;
	}
	public static void insertStaff(String name, String phone, String email, String password){
		try {
			Connection connection=JDBC.getConnection();
			
			Statement stmt = connection.createStatement();
			String query = "INSERT INTO staff(NAME,PHONE,EMAIL,PASSWORD) VALUES ('"+name+"','"+phone+"','"+email+"','"+password+"')";
			stmt.executeUpdate(query);
			System.out.println("insertStaff : " + query);
			connection.close();
	    } 
		catch (Exception ex) {
			ex.printStackTrace(); 
	    }

	}
}
