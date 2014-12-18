package npu.fallAlarm.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capstone.data.Patient;

import npu.fallAlarm.DAO.PatientDAO;

/**
 * Servlet implementation class NewPatientServlet
 */
@WebServlet("/NewPatientServlet")
public class NewPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPatientServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		Patient patient = new Patient();
		
		patient.setPid(request.getParameter("pid"));
		patient.setName(request.getParameter("name"));
		patient.setGender(request.getParameter("gender"));
		try {
			Date dob = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthday"));
			patient.setDate(dob);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		patient.setEmail(request.getParameter("email"));
		patient.setPhone(request.getParameter("phone"));
		patient.setAddress(request.getParameter("address"));
		patient.setZip(request.getParameter("zip"));
		
		try {
			PatientDAO.insertPatientData(patient);
			
			out.println("<script type=\"text/javascript\">");
		    out.println("alert('Patient :" + request.getParameter("name") +" is created !!' );");
		    out.println("location='index.jsp';");
		    out.println("</script>");
		} catch (SQLException e) {
			
			String str = "Error creating patient !";
			out.println("<script type=\"text/javascript\">");
		    out.println("alert('"+str+"');");
		    out.println("location='portfolio.jsp';");
		    out.println("</script>");
			System.out.println(e.getMessage());

		}

	}

}
