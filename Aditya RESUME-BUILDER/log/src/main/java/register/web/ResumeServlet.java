package register.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ral.dao.RegisterDAO;
import ral.dao.ResumeDAO;
import ral.model.RegisterBean;
import ral.model.ResumeBean;

/**
 * Servlet implementation class ResumeServlet
 */
@WebServlet("/ResumeServlet")
public class ResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phone_number");
		String website = request.getParameter("website");
		String linked_in = request.getParameter("linked_in");
		String college = request.getParameter("College");
		String college_joining_date = request.getParameter("college_joining_date");
		String college_completion_date = request.getParameter("college_completion_date");
		String college_qualification = request.getParameter("college_qualification");
		String college_description = request.getParameter("college_description");
		String school = request.getParameter("school");
		String school_joining_date = request.getParameter("school_joining_date");
		String school_completion_date = request.getParameter("school_completion_date");
		String school_qualification = request.getParameter("school_qualification");
		String school_description = request.getParameter("school_description");
		String project_title = request.getParameter("project_title");
		System.out.println(project_title);
		String project_link = request.getParameter("project_link");
		String project_description = request.getParameter("project_description");
		String organisation = request.getParameter("organisation");
		String position = request.getParameter("position");
		String duration = request.getParameter("duration");
		String experiance_description = request.getParameter("experiance_description");
		String organisation1 = request.getParameter("organisation1");
		String position1 = request.getParameter("position1");
		String duration1 = request.getParameter("duration1");
		String experiance_description1 = request.getParameter("experiance_description1");
		String Skill1 = request.getParameter("Skill1");
		String Skill2 = request.getParameter("Skill2");
		String Skill3 = request.getParameter("Skill3");
		String Skill4 = request.getParameter("Skill4");
		String Skill5 = request.getParameter("Skill5");
		String Skill6 = request.getParameter("Skill6");
		String Interest1 = request.getParameter("Interest1");
		String Interest2 = request.getParameter("Interest2");
		String Interest3 = request.getParameter("Interest3");
		String Interest4 = request.getParameter("Interest4");
		
		ResumeBean bean = new ResumeBean(first_name, last_name,email, phone_number,website,linked_in,college,
				college_joining_date,college_completion_date,college_qualification,
				college_description,school,school_joining_date,
				school_completion_date,school_qualification,
				school_description,project_title,project_link,project_description,
				organisation,position,duration,experiance_description,
				organisation1,position1,duration1,experiance_description1,
				Skill1,Skill2,Skill3,Skill4,Skill5,Skill6,Interest1,Interest2,Interest3,Interest4);
				
		ResumeDAO dao = new ResumeDAO();
		if (dao.Resumeindb(bean)) {
			request.setAttribute("error", "Successfuly created Resume");
			RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
			rd.include(request, response);
		
		}
		else {
			request.setAttribute("error", "Resume Already Exist- go to Resume Update");
			RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
			rd.include(request, response);

}
}
}