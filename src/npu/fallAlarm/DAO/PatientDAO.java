package npu.fallAlarm.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.capstone.data.DeviceData;
import com.capstone.data.Patient;

import npu.fallAlarm.jdbc.JDBC;

public class PatientDAO {
	public static void insertPatient(String pid, String name, String gender,
			Date date, String email, String phone, String address,String zip){
		try {
			Connection connection=JDBC.getConnection();
			

			java.util.Date dob_temp = date;  
			java.sql.Date dob = new java.sql.Date(dob_temp.getTime()); 
			
			Statement stmt = connection.createStatement();
			String query = "INSERT INTO `FallAlarm`.`PATIENT`"
					+ " (`PID`, `NAME`, `Gender`, `DOB`, `EMAIL`, `PHONE`, `ADDRESS`, `Zip`) "
					+ "VALUES ('"+pid+"', '"+name+"', '"+gender+"', '"+dob+"', "
							+ "'"+email+"', '"+phone+"', '"+address+"', '"+zip+"')";

			stmt.executeUpdate(query);
			System.out.println("insertPatient : " + query);
			connection.close();
	    } 
		catch (Exception ex) {
			ex.printStackTrace(); 
	    }

	}
	public static int insertPatientData(Patient patient) throws SQLException{
		int id=0;
			Connection connection=JDBC.getConnection();
			String query = "INSERT INTO `FallAlarm`.`PATIENT`"+
					" (`PID`, `NAME`, `Gender`, `DOB`, `EMAIL`, `PHONE`, `ADDRESS`, `Zip`) " +
					"VALUES (?,?,?,?,?,?,?,?)";

			java.util.Date myUtilDate = patient.getDate();  
			java.sql.Date mySqlDate = new java.sql.Date(myUtilDate.getTime());  
			
			PreparedStatement stmt = connection.prepareStatement(query);
			
			        stmt.setString(1,patient.getPid()); 
			        stmt.setString(2,patient.getName());//(java.sql.Date) mySqlDate
			        stmt.setString(3,patient.getGender());
			        stmt.setDate(4,(java.sql.Date)mySqlDate);
			        stmt.setString(5,patient.getEmail());
			        stmt.setString(6,patient.getPhone());
			        stmt.setString(7,patient.getAddress());
			        stmt.setString(8,patient.getZip());
			 
			        stmt.executeUpdate();
			        
			 connection.close();
		return id;
	}
}
