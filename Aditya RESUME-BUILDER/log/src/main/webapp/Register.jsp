<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
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
	<form action="RegisterServlet" method="post">
<div style="background-color:gainsboro;padding:15px">
<h1 >USER REGISTRATION</h1>
<span style="color: red">${error}</span>
 <hr>
		<table >
			
			<tr></tr>
				<tr></tr>
			<tr>
				<td>Email<span>*</span></td>
				<td><input type="text" id="email" onkeyup="validateEmail()"
					 name="email" required><span id="eml"></span></td>
			</tr><tr></tr>	<tr></tr> <tr></tr> 	<tr></tr> 	<tr></tr><tr></tr> 	<tr></tr>
			<tr>
				<td>Username<span>*</span></td>
				<td><input type="text" id="user" onkeyup="validateUN()"
					 name="user_name"  required><span id="Un"></span></td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr> <tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Password<span>*</span></td>
				<td><input type="password" id="pw"
					onkeyup="validatePW()" name="password" required><span id="pwd"></span></td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr> <tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>First Name<span>*</span></td>
				<td><input type="text" 
					name="first_name" required></td>
			</tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Last Name<span></span></td>
				<td><input type="text"
					name="last_name"></td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Phone Number<span>*</span></td>
				<td><input type="text"  onkeyup="validatePH()" id="ph"
					name="phone_number" required><span id="phn"></span></td>
			</tr>
			<tr></tr>	<tr></tr>	<tr></tr><tr></tr> 	<tr></tr> 	<tr></tr> <tr></tr> 	<tr></tr>
			<tr>
				<td>Address<span>*</span></td>
				<td><input type="text" 
					name="address" required></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text"  name="address1"></td>
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
				<td><input id="name" type="date" name="dob"  style="width:165px">
				</td>
			</tr>
			<tr></tr><tr></tr> 	<tr></tr>
			<tr  >
				<td >Country<span>*</span></td>
				<td><select name="country" id="country" style="width:170px">
    <c:forEach items="${mapCountries}" var="country">
        <option value="${country.key}"${country.key == "IN" ? 'selected':''}>${country.value}</option>
    </c:forEach>
    </select>
				</td>

			</tr>
</table>
<hr>

			<div>
				
				<button
						id="s" class="s" type="submit">REGISTER</button>
			</div>
		</div>
	</form>
</body>


</html>