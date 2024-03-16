<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ral.dao.ResumeDAO"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/empcred";%>
<%!String user = "root";%>
<%!String psw = "12345";%>
<%
/* System.out.println("tfvgbhnjmk"); */
String user_name = request.getParameter("user_name");
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String city_name=request.getParameter("city_name");
String email=request.getParameter("email");
String phone_number=request.getParameter("phone_number");
String website=request.getParameter("website");
String linked_in=request.getParameter("linked_in");
String college=request.getParameter("college");
String college_joining_date=request.getParameter("college_joining_date");
String college_completion_date=request.getParameter("college_completion_date");
String college_qualification=request.getParameter("college_qualification");
String college_description=request.getParameter("college_description");
String school=request.getParameter("school");
String school_joining_date=request.getParameter("school_joining_date");
String school_completion_date=request.getParameter("school_completion_date");
String school_qualification=request.getParameter("school_qualification");
String school_description=request.getParameter("school_description");
String project_title=request.getParameter("project_title");
String project_link=request.getParameter("project_link");
String project_description=request.getParameter("project_description");
String organisation=request.getParameter("organisation");
String position=request.getParameter("position");
String duration=request.getParameter("duration");
String experiance_description=request.getParameter("experiance_description");
String organisation1=request.getParameter("organisation1");
String position1=request.getParameter("position1");
String duration1=request.getParameter("duration1");
String experiance_description1=request.getParameter("experiance_description1");
String Skill1=request.getParameter("Skill1");
String Skill2=request.getParameter("Skill2");
String Skill3=request.getParameter("Skill3");
String Skill4=request.getParameter("Skill4");
String Skill5=request.getParameter("Skill5");
String Skill6=request.getParameter("Skill6");
String Interest1=request.getParameter("Interest1");
String Interest2=request.getParameter("Interest2");
String Interest3=request.getParameter("Interest3");
String Interest4=request.getParameter("Interest4");
System.out.println(user_name);
if(user_name != null)
{
Connection con = null;
PreparedStatement preparedStatement = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
System.out.println("tfvgbhnjmk");
String sql="Update resume set first_name=?,last_name=?,email=?,phone_number=? ,website=?,linked_in=?,"
		+ "college=?,college_joining_date=?,college_completion_date=?,college_qualification=?,college_description=?,"
		+ "school=?,school_joining_date=?,school_completion_date=?,school_qualification=?,school_description=?,"
		+ "project_title=?,project_link=?,project_description=?,"
		+ "organisation=?,position=?,duration=?,experiance_description=?,"
		+ "organisation1=?,position1=?,duration1=?,experiance_description1=?,"
		+ "Skill1=?,Skill2=?,Skill3=?,Skill4=?,Skill5=?,Skill6=?,"
		+ "Interest1=?,Interest2=?,Interest3=?,Interest4=?  where user_name='"+ResumeDAO.user+"';";
preparedStatement = con.prepareStatement(sql);
preparedStatement.setString(1, first_name);
preparedStatement.setString(2, last_name);
preparedStatement.setString(3, email);
preparedStatement.setString(4, phone_number);
preparedStatement.setString(5, website);
preparedStatement.setString(6, linked_in);
preparedStatement.setString(7, college);
preparedStatement.setString(8, college_joining_date);
preparedStatement.setString(9,college_completion_date);
preparedStatement.setString(10,college_qualification);
preparedStatement.setString(11, college_description );
preparedStatement.setString(12, school);
preparedStatement.setString(13, school_joining_date);
preparedStatement.setString(14, school_completion_date);
preparedStatement.setString(15, school_qualification);
preparedStatement.setString(16, school_description);
preparedStatement.setString(17, project_title);
preparedStatement.setString(18, project_link);
preparedStatement.setString(19, project_description);
preparedStatement.setString(20, organisation);
preparedStatement.setString(21, position);
preparedStatement.setString(22, duration);
preparedStatement.setString(23, experiance_description);
preparedStatement.setString(24, organisation1);
preparedStatement.setString(25, position1);
preparedStatement.setString(26, duration1);
preparedStatement.setString(27, experiance_description1);
preparedStatement.setString(28, Skill1);
preparedStatement.setString(29, Skill2);
preparedStatement.setString(30, Skill3);
preparedStatement.setString(31, Skill4);
preparedStatement.setString(32, Skill5);
preparedStatement.setString(33, Skill6);
preparedStatement.setString(34, Interest1);
preparedStatement.setString(35, Interest2);
preparedStatement.setString(36, Interest3);
preparedStatement.setString(37, Interest4);
int i = preparedStatement.executeUpdate();
if(i > 0)
{
	RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
	rd.include(request, response);
out.print("Resume Updated Successfully");
System.out.println("yuiop");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>