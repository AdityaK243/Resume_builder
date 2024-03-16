<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ral.dao.ResumeDAO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import ="java.util.TreeMap"%>
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
String phone_number = request.getParameter("phone_number");
String address=request.getParameter("address");
String gender=request.getParameter("gender");
String dob = request.getParameter("dob");
String country = request.getParameter("country");
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
String sql="Update user_registration set first_name=?,last_name=?,phone_number=? ,address=?,gender=?,"
		+ "dob=?,country=? where user_name='"+ResumeDAO.user+"';";
preparedStatement = con.prepareStatement(sql);
preparedStatement.setString(1, first_name);
preparedStatement.setString(2, last_name);
preparedStatement.setString(3, phone_number);
preparedStatement.setString(4, address);
preparedStatement.setString(5, gender);
preparedStatement.setString(6, dob);
preparedStatement.setString(7, country);

int i = preparedStatement.executeUpdate();
if(i > 0)
{
	RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
	rd.include(request, response);
out.print("Profile Updated Successfully");
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
