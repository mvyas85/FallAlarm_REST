package npu.fallAlarm.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.capstone.data.DeviceData;

import npu.fallAlarm.DAO.PatientDAO;
import npu.fallAlarm.DAO.PatientDataDAO;

/**
 * Servlet implementation class PatientDetailServlet
 */
@WebServlet("/PatientDetailServlet")
public class PatientDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<String> pids;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientDetailServlet() {
        super();
		pids = null;
		try {
			pids = PatientDAO.getAllPatientIDs();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("Data", pids);
		request.getRequestDispatcher("checkStatus.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
				Date searchDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("searchdate"));
				ArrayList<DeviceData> resultData =PatientDataDAO.getFilteredPatientData(request.getParameter("pid_list"),searchDate,Integer.parseInt(request.getParameter("classRisk")));
			
				request.setAttribute("Data", pids);
				request.setAttribute("searchdate", request.getParameter("searchdate"));
				request.setAttribute("searchResults","Number of records found: "+resultData.size()); 
				request.setAttribute("resultData",resultData); 
				
		} catch (ParseException e) {
			e.printStackTrace();
		}
		

		request.getRequestDispatcher("checkStatus.jsp").forward(request, response);	
	}

}
