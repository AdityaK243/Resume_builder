<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ral.DB.DBconnection"%>
<%@page import="ral.dao.ResumeDAO"%>
<%
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<script>
window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const ResumePDF = this.document.getElementById("ResumePDF");
            console.log(ResumePDF);
            console.log(window);
            var opt = {
                margin: [15,15,15,15],
                filename: 'myfile.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 1 },
                jsPDF: { unit: 'pt', format: 'a4', orientation: 'portrait' }
            };
            html2pdf().from(ResumePDF).set(opt).save();
        })
}


</script>
<style type="text/css">
html, body {
    height: 100%;
}

html {
     display: table; 
    margin: auto;
}

body {
   display: table-cell;
    vertical-align: middle;
}
td{
width:80px;
height:30px;
}
table{
width:100%;
}

</style>
</head>
<body >
<form  action="Update.jsp" method="post">
<div id="ResumePDF" style="margine-left:50px">
<h1>RESUME </h1>

<%
try{
	Connection con = DBconnection.getConn();
statement=con.createStatement();
String sql ="select * from resume where user_name='"+ResumeDAO.user+"';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<h2>Personal Details</h2>
<table  border="1" >
<tr>

<td>Name</td>
<td>Email</td>
<td >Phone Number</td>
<td>Website</td>
<td>LinkedIn</td></tr>
<tr>

<td><%=resultSet.getString("first_name") %><%out.print(" ");%><%=resultSet.getString("last_name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("phone_number") %></td>
<td><%=resultSet.getString("website") %></td>
<td><%=resultSet.getString("linked_in") %></td>
</tr>
</table>
<table  border="1">

<h2>Educational Details</h2>
<h3> College :</h3>
<tr>
<td>College</td>
<td>Joining date</td>
<td>Completion date</td>
<td>College Degree</td>
<td>College Branch </td></tr>


<td><%=resultSet.getString("college") %></td>
<td><%=resultSet.getString("college_joining_date") %></td>
<td><%=resultSet.getString("college_completion_date") %></td>
<td><%=resultSet.getString("college_qualification") %></td>
<td><%=resultSet.getString("college_description") %></td></tr>
</table>
<table  border="1">
<h3> School :</h3>
<tr>
<td>School</td>
<td>Joining date</td>
<td>Completion date</td>
<td>School Board</td>
<td>School Stream</td></tr>
<tr>
<td><%=resultSet.getString("school") %></td>
<td><%=resultSet.getString("school_joining_date") %></td>
<td><%=resultSet.getString("school_completion_date") %></td>
<td><%=resultSet.getString("school_qualification") %></td>
<td><%=resultSet.getString("school_description") %></td>
</tr>
</table>

<h2>Project Details</h2>
<table border="2">
<tr><td>Project Title</td>
<td>Project Link</td>
<td>Project Description</td></tr>
<tr>
<td><%=resultSet.getString("project_title") %></td>
<td><%=resultSet.getString("project_link") %></td>
<td><%=resultSet.getString("project_description") %></td>
</tr>
</table>
<h2>Experiance Details</h2>
<table border="2">
<h3>Experiance : 1</h3>
<tr><td>Organisation</td>
<td>Position</td>
<td>Duration</td>
<td>Experiance Description</td></tr>
<tr>
<td><%=resultSet.getString("organisation") %></td>
<td><%=resultSet.getString("position") %></td>
<td><%=resultSet.getString("duration") %></td>
<td><%=resultSet.getString("experiance_description") %></td></tr></table>
<h3>Experiance : 2</h3>
<table border="2">
<tr><td>Organisation2</td>
<td>Position2</td>
<td>Duration2</td>
<td>Experiance Description 2</td></tr>
<tr>
<td><%=resultSet.getString("organisation1") %></td>
<td><%=resultSet.getString("position1") %></td>
<td><%=resultSet.getString("duration1") %></td>
<td><%=resultSet.getString("experiance_description1") %></td>
</tr>
</table>
<h2>Extra Details</h2>
<h3>Skills :</h3>
<table border="2">
<tr><td>Skill1</td>
<td>Skill2</td>
<td>Skill3</td>
<td>Skill4</td>
<td>Skill5</td>
<td>Skill6</td></tr>
<tr>
<td><%=resultSet.getString("Skill1") %></td>
<td><%=resultSet.getString("Skill2") %></td>
<td><%=resultSet.getString("Skill3") %></td>
<td><%=resultSet.getString("Skill4") %></td>
<td><%=resultSet.getString("Skill5") %></td>
<td><%=resultSet.getString("Skill6") %></td></tr></table>
</table>


<h3>Interests :</h3>
<table border="2">
<tr><td>Interest1</td>
<td>Interest2</td>
<td>Interest3</td>
<td>Interest4</td></tr>
<tr>
<td><%=resultSet.getString("Interest1") %></td>
<td><%=resultSet.getString("Interest2") %></td>
<td><%=resultSet.getString("Interest3") %></td>
<td><%=resultSet.getString("Interest4") %></td></tr></table><br>

</div>

<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<div></div>
<div style="width:400px;">
<!-- <a href="javascript:generatePDF()">
<button type="button" style="background-color: black; 
  border-radius:20px ;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;">Download</button> 
</a> -->
<button id="download" type="button" style="background-color: black; 
  border-radius:20px ;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;">Download</button>
<span style="float: right ">
<button type="submit" style="background-color: black; 
  border-radius:20px ;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;">Update </button></span></div>
</form>
</body>
</html>