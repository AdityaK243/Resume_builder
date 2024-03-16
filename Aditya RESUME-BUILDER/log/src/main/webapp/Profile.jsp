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
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js" ></script> -->
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
/* function generatePDF() {

	 var doc = new jsPDF();  

	  doc.fromHTML(document.getElementById("ResumePDF"),30, 0,{ 'width': 100},

	  function(a) 

	   {

	    doc.save("Resume.pdf"); 

	  });

	} */

</script>
<style>
body {
padding:10px;
font-family: Arial, Helvetica, sans-serif;
background-color:rgb(242,243,243);
	display: flex;
	justify-content: center;
	align-items: center;
}

 tr{
	margin: 20px 0px;
}
 
/* td {
	font-weight: 800;
}
 */
span {
	color: rgb(230, 7, 7);
}

button {
	background-color: #56f5a6;
	color: rgb(24, 22, 22);
	border-radius:50px;
}

#dob li {
	display: inline;
}
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 10px;
}
.s {
  background-color: #0a77bf;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  font-size:20px;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.s:hover {
  opacity: 1;
}

</style>
</head>
<body >
<form  action="ProfileUpdate.jsp" method="post">



<%
try{
	Connection con = DBconnection.getConn();
statement=con.createStatement();
String sql ="select * from user_registration where user_name='"+ResumeDAO.user+"';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>




<div style="background-color:gainsboro;padding:15px;width:290px">
<h1 > USER&nbsp;&nbsp;PROFILE  </h1>
 <hr>
		<table >
			
			<tr></tr>
				<tr></tr>
			<tr>
				<td>EMAIL<span></span></td>
				<td><%=resultSet.getString("Email") %></td>
			</tr><tr></tr>	<tr></tr> <tr></tr> 	<tr></tr> 	<tr></tr><tr></tr> 	<tr></tr>
			<tr>
				<td>USERNAME<span></span></td>
				<td><%=resultSet.getString("user_name") %></td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr> <tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>PASSWORD<span></span></td>
				<td><%=resultSet.getString("PASSWORD") %></td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr> <tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>First Name<span></span></td>
				<td><%=resultSet.getString("First_Name") %></td>
			</tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Last Name<span></span></td>
				<td><%=resultSet.getString("Last_Name") %></td>
			</tr>
			<tr></tr>
			<tr>
				<td>Phone Number<span></span></td>
				<td><%=resultSet.getString("Phone_Number") %></td>
			<tr></tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Address<span></span></td>
				<td><%=resultSet.getString("Address") %></td>
			
			<tr></tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Gender<span></span></td>
			<td><%=resultSet.getString("Gender") %></td>

			</tr>	<tr></tr>	<tr></tr> 	<tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td><label>Date of Birth<span style="color: red;"></span></label></td>
				<td><%=resultSet.getString("dob") %></td>

			</tr><tr></tr><tr></tr><tr></tr> 	<tr></tr> 	<tr></tr>
			<tr  >
				<td >Country<span></span></td>
				<td><%=resultSet.getString("country") %></td>

			</tr>
</table>
<hr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

			<div>
				
				<button
						 class="s" type="submit" >Edit <img src="https://cdn-icons-png.flaticon.com/512/1827/1827933.png" width="15px"></button>
			</div>
		</div>
</form>
</body>
</html>