package npu.fallAlarm.jdbc;


import java.sql.SQLException;

import npu.fallAlarm.DAO.PatientDAO;

public class TestJDBC {
public static void main(String[] argv) throws SQLException, ClassNotFoundException {
		
		PatientDAO.printPatient();
	}
}
