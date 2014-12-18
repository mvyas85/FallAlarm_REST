package npu.fallAlarm.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.capstone.data.Staff;
import com.sun.java.swing.plaf.windows.resources.windows;

import npu.fallAlarm.DAO.StaffDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Staff staff= StaffDAO.loginCheck(request.getParameter("username"),request.getParameter("password")); 

		
		System.out.println("Checking information"+ staff.toString());
	        String contextPath = request.getContextPath();
	        
		     if (staff!= null)
		     {
			      HttpSession session = request.getSession(true);	    
		          session.setAttribute("loggedUser",staff.getSid());
		          
		          session.setAttribute("loggedUserId",staff.getSid());
		          session.setAttribute("loggedUserName",staff.getName());  		    
		          session.setAttribute("loggedUserPhone",staff.getPhone());  		    
		          session.setAttribute("loggedUserEmail",staff.getEmail());  	
		     }
		     else {
		    	 //request.setAttribute("loginError","Incorrect password");
		     }

				request.getRequestDispatcher("index.jsp").forward(request, response);	
	         //response.sendRedirect(response.encodeRedirectURL(contextPath + "/index.jsp")); //error page 
	}

}
