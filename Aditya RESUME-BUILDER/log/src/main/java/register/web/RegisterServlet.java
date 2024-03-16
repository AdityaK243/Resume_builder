package register.web;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ral.dao.RegisterDAO;
import ral.model.RegisterBean;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param gender
	 * @param dob
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * String[] countryCodes = Locale.getISOCountries();
		 * 
		 * Map<String, String> mapCountries = new TreeMap<>();
		 * 
		 * for (String countryCode : countryCodes) { Locale locale = new Locale("",
		 * countryCode); String code = locale.getCountry(); String name =
		 * locale.getDisplayCountry(); mapCountries.put(code, name); }
		 */
		
		System.out.println("Insider Post");
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String phone_number = request.getParameter("phone_number");
		String address = request.getParameter("address");
		System.out.println(address); 
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String country = request.getParameter("country");
		RegisterBean bean = new RegisterBean(email, user_name, password, first_name, last_name, phone_number, address,
				gender, dob, country);
		RegisterDAO dao = new RegisterDAO();
		String result = dao.Registerindb(bean);
	   
		if (result.equals("User is registered")) {

			request.setAttribute("error", " Successfully Registered");
			RequestDispatcher rd = request.getRequestDispatcher("log.jsp");
			rd.include(request, response);

		} else {
			request.setAttribute("error", "User Already Exist");
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.include(request, response);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        String[] countryCodes = Locale.getISOCountries();
 
        Map<String, String> mapCountries = new TreeMap<>();
 
        for (String countryCode : countryCodes) {
            Locale locale = new Locale("", countryCode);
            String code = locale.getCountry();
            String name = locale.getDisplayCountry();
            mapCountries.put(code, name);
        }
 
 request.setAttribute("mapCountries", mapCountries);
	    
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
        dispatcher.forward(request, response);      
         
}
}
