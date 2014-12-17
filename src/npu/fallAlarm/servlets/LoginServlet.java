package npu.fallAlarm.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

			String id= StaffDAO.loginCheck(request.getParameter("username"),request.getParameter("password")); 

	        String contextPath = request.getContextPath();
			//System.out.println("id:"+id);
		     if (id!="")
		     {
			      HttpSession session = request.getSession(true);	    
		          session.setAttribute("loggedUser",id); 
		          //request.setAttribute("currentSessionUser",id);   		
		     }
			        
		     else {
		    	 //request.setAttribute("loginError","Incorrect password");
		     }
	         response.sendRedirect(response.encodeRedirectURL(contextPath + "/index.jsp")); //error page 
	}

}
