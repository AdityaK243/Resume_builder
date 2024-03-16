<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ral.DB.DBconnection"%>
<%@page import="ral.dao.ResumeDAO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import ="java.util.TreeMap"%>
<%
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>

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
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.s:hover {
  opacity: 1;
}

</style>
<script>
	// function matchPassword() {  
	//   var pw1 = document.getElementById("password");  
	//   var pw2 = document.getElementById("con_password");  
	//   if(pw1 != pw2)  
	//   {   
	//     alert("Passwords did not match");  
	//   } else {  
	//     alert("Password created successfully");  
	//   }  
	// }  

	function validateUN() {
		var un = document.getElementById("Un");
		var user = document.getElementById("user").value;
		var check = /^[a-zA-Z0-9_]+$/;
		if (user.match(check)) {
			un.innerHTML = "Valid";
			un.style.color = "green";
			document.getElementById("s").disabled = false;
		} else {
			un.innerHTML = "InValid";
			un.style.color = "red";
			document.getElementById("s").disabled = true;
		}
	}
	function validateEmail() {
		var eml = document.getElementById("eml");
		var email = document.getElementById("email").value;
		var dekh = /^([a-zA-z_+%.]+@[a-z]+\.[a-z]{2,4})+$/;
		if (email.match(dekh)) {
			eml.innerHTML = "Valid";
			eml.style.color = "green";
			document.getElementById("s").disabled = false;
		} else {
			eml.innerHTML = "InValid";
			eml.style.color = "red";
			document.getElementById("s").disabled = true;
		}
	}
	function validatePH() {
		var eml = document.getElementById("phn");
		var email = document.getElementById("ph").value;
		var dekh = /^([0-9]{8,12})+$/;
		if (email.match(dekh)) {
			eml.innerHTML = "Valid";
			eml.style.color = "green";
			document.getElementById("s").disabled = false;
		} else {
			eml.innerHTML = "InValid";
			eml.style.color = "red";
			document.getElementById("s").disabled = true;
		}
	}
	function validatePW() {
		var un = document.getElementById("pwd");
		var user = document.getElementById("pw").value;
		var check = /^(?=.*[0-9])(?=.*[!@#%^&*])(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9!@#%^&*]{8,20}$/;
		var check1 = /^[$]$/
		if (user.match(check1)) {
			un.innerHTML = "$ is not allowed";
			un.style.color = "red";
			document.getElementById("s").disabled = false;
		} else {
			if (user.match(check)) {
				un.innerHTML = "Valid";
				un.style.color = "green";
				document.getElementById("s").disabled = false;
			} else {
				un.innerHTML = "InValid";
				un.style.color = "red";
				document.getElementById("s").disabled = true;

			}
		}
		
	}
</script>

</head>
<body>



     <form action="ResUp.jsp" method="post">
     <%
try{
	Connection con = DBconnection.getConn();
statement=con.createStatement();
String sql ="select * from user_registration where user_name='"+ResumeDAO.user+"';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
    

       
      <div style="background-color:gainsboro;padding:15px">
<h1 >PROFILE UPDATION</h1>
 <hr>
		<table >
			
			<tr></tr>
				<tr></tr>
			<tr>
				<td>EMAIL<span></span></td>
				<td> <%=resultSet.getString("email") %></td>
			</tr><tr></tr>	<tr></tr> <tr></tr> 	<tr></tr> 	<tr></tr><tr></tr> 	<tr></tr>
			<tr>
			
				<td>USERNAME<span></span></td>
				  <input type="text" name="user_name" <%out.print( "value=\""+ResumeDAO.user+"\""); %> hidden>
				<td><%=resultSet.getString("user_name") %> </td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr> <tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>PASSWORD<span></span></td>
				<td><%=resultSet.getString("password") %></td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr> <tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>First Name<span>*</span></td>
				<td><input type="text" 
					name="first_name"  required   value="<%=resultSet.getString("first_name") %>"></td>
			</tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Last Name<span></span></td>
				<td><input type="text"
					name="last_name"  value="<%=resultSet.getString("last_name") %>"></td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Phone Number<span>*</span></td>
				<td><input type="text"  onkeyup="validatePH()" id="ph"
					name="phone_number" required  value="<%=resultSet.getString("Phone_Number") %>"><span id="phn"></span></td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Address<span>*</span></td>
				<td><input type="text" 
					name="address"  value="<%=resultSet.getString("address") %>"></td>
			</tr>
			
				
			<tr></tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Gender<span>*</span></td>
				<td><input type="radio" id="male" name="gender" value="MALE"
					checked> <label for="gender">Male</label> <input
					type="radio" id="female" name="gender" value="FEMALE"> <label
					for="gender">Female</label> <input type="radio" id="others"
					name="gender" value="OTHERS"> <label for="gender">Others</label></td>

			</tr>	<tr></tr>	<tr></tr> 	<tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td><label>Date of Birth<span style="color: red;">*</span></label></td>
				<td><input id="name" type="date" name="dob"  style="width:165px"  value="<%=resultSet.getString("dob") %>">
				</td>
						

			</tr>
			<%String coun = resultSet.getString("Country"); %>
			<tr  >
				<td >Country<span>*</span></td>
				<td> <c:set var="dbCountry" scope="session" value="<%=coun%>"></c:set>			
				<select name="country" id="country" style="width:170px">
    <c:forEach items="${mapCountries}" var="country">
        <option value="${country.key}"${country.key == dbCountry ? 'selected':''}>${country.value}</option>
    </c:forEach>
    </select></td>
     <%
String[] countryCodes = Locale.getISOCountries();

Map<String, String> mapCountries = new TreeMap<>();

for (String countryCode : countryCodes) {
    Locale locale = new Locale("", countryCode);
    String code = locale.getCountry();
    String name = locale.getDisplayCountry();
    mapCountries.put(code, name);
}
%>

			</tr>
</table>
<hr>

			<div>
				
				<button
						 class="s" type="submit">UPDATE</button>
			</div>
		
<%
request.setAttribute("mapCountries", mapCountries);


RequestDispatcher dispatcher = request.getRequestDispatcher("ProfileUpdate.jsp");
dispatcher.forward(request, response);  
%>





<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
     %>
    

</div>
</form> 
    

</body>
</html>