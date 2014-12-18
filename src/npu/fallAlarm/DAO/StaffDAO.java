package npu.fallAlarm.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.capstone.data.Staff;

import npu.fallAlarm.jdbc.JDBC;

public class StaffDAO {
	public static Staff loginCheck(String username, String password){
		Staff staff = null;
		try {
			Connection connection=JDBC.getConnection();
			Statement stmt = connection.createStatement();
			String query = "select * from staff where email='"+username+"' and password='"+password+"'";
			
        	ResultSet res = stmt.executeQuery(query);
			
			if(res.next()){
				staff = new Staff();
				
				staff.setSid(res.getString("sid"));
				staff.setName(res.getString("NAME"));
				staff.setPhone(res.getString("PHONE"));
				staff.setEmail(res.getString("EMAIL"));
				staff.setPassword(res.getString("PASSWORD"));
				
				 System.out.println("Login Successful");
			 }
			else
				System.out.println("Login Failed");
			 connection.close();
        } 
		catch (Exception ex) {
			ex.printStackTrace(); 
        }
		
		return staff;
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
