package register.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ral.dao.ForgetDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/ForgetServlets")
public class ForgetServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetServlets() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String Email=request.getParameter("email");
		String Password=request.getParameter("password");
		
		if(ForgetDAO.forgetpassword(Email,Password)) {
			request.setAttribute("error"," Successfully Updated");
			RequestDispatcher rd = request.getRequestDispatcher("log.jsp");
			rd.include(request,response);
		}else {
			request.setAttribute("error"," PasswordNotMatced");
			RequestDispatcher rd = request.getRequestDispatcher("forget1.jsp");
			rd.include(request,response);
		}
		
	}

}




