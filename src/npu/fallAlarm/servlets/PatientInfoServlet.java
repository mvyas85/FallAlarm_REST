package npu.fallAlarm.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstone.data.Patient;

import npu.fallAlarm.DAO.PatientDAO;

/**
 * Servlet implementation class PatientInfo
 */
@WebServlet("/PatientInfoServlet")
public class PatientInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<String> pids;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientInfoServlet() {
        super();
		pids = null;
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			pids = PatientDAO.getAllPatientIDs();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("pids", pids);
		request.getRequestDispatcher("patientInfo.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			pids = PatientDAO.getAllPatientIDs();
		
			Patient patients = PatientDAO.getAllPatientInfo(request.getParameter("pid_list"));

			request.setAttribute("pids", pids);
			request.setAttribute("name", patients.getName());
			request.setAttribute("gender", patients.getGender());
			request.setAttribute("birthday", patients.getDate());
			request.setAttribute("email", patients.getEmail());
			request.setAttribute("phone", patients.getPhone());
			request.setAttribute("address", patients.getAddress());
			request.setAttribute("zip", patients.getZip());

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		request.getRequestDispatcher("patientInfo.jsp").forward(request, response);		
	}

}
