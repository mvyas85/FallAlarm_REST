package npu.fallAlarm.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstone.data.Patient;

import npu.fallAlarm.DAO.PatientDAO;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("locationX", request.getParameter("locX"));
		request.setAttribute("locationY", request.getParameter("locY"));
		String pid = request.getParameter("PID");
		Patient patient = null;

		
		try {
			patient = PatientDAO.getAllPatientInfo(pid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(patient != null){

			request.setAttribute("pid", pid);
			request.setAttribute("pName", patient.getName());
			request.setAttribute("pPhone", patient.getPhone());
		}
		request.getRequestDispatcher("contact.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
