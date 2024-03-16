package register.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import ral.dao.LoginDAO;
import ral.dao.ResumeDAO;
import ral.model.RegisterBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
	 private static String fN;
	 public static void setfN(String fN) {
			LoginServlet.fN = fN;
	
	}

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String User_name=request.getParameter("User_name");
		String Password=request.getParameter("Password");
		
		//System.out.println(User_name);
		
		if(LoginDAO.validate(User_name,Password)) {
			
			ResumeDAO.user=User_name;
			RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
			//System.out.println(fN);
			//System.out.println(User_name);
			request.setAttribute("FirstName",fN);
			request.setAttribute("Name",User_name);
			rd.include(request,response);
		}else {
			request.setAttribute("error"," ...Invalid  Password");
			RequestDispatcher rd = request.getRequestDispatcher("log.jsp");
			rd.include(request,response);
		} 
	}

}

