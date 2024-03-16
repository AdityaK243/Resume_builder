<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ForgetPassword</title>
<style>
body {
background-color:rgb(242,243,243);
	display: flex;
	justify-content: center;
	align-items: center;
}

 tr{
	margin: 20px 0px;
}
 
td {
	font-weight: 800;
}

span {
	color: rgb(230, 7, 7);
}

button {
	background-color: #56f5a6;
	color: rgb(24, 22, 22);
	border-radius:50px;
	padding:10px;
	font-size: 15px;
}


</style>
</head>

<body>
		<form id="form" action="ForgetServlets" method="post">
			<div style="background-color:gainsboro; margin-top: 50px;padding:100px">
			<h1 style="padding-left:70px;">New Password</h1>
			<table>
				<tr>
					
					<td><span style="color: red">${error}</span></td>

				</tr>
				<tr>
					<td id="as">Email</td>
					<td><input type="text"  name="email"></td>
				</tr>
				<tr>
					<td id="vs">Password</td>
					<td><input id="pswd1" type="password"
						 name="password"></td>
				</tr>
				<tr>
					<td id="vs">Confirm Password</td>
					<td><input type="password" id="pswd2"
						name="con_Password"
						onkeyup="matchPassword()"></td>
					<td><span id="error_pass"></span></td>
				</tr>
				<tr>
				<td></td>
					<td><button id="s" type="submit">UPDATE PASSWORD</button></td>

				</tr>

			</table>
			</div>
		</form>
	</body>

<script>
	function matchPassword() {
		const button = document.getElementById("s");
		var form = document.getElementById("form");
		var pswd1 = document.getElementById("pswd1").value;
		var pswd2 = document.getElementById("pswd2").value;
		var text = document.getElementById("error_pass");
		if ((pswd1 === pswd2)) {
			form.classList.add("valid");
			form.classList.remove("invalid");
			text.innerHTML = "Matched";
			text.style.color = "green";
			button.disable=false;
		} else {
			form.classList.remove("valid");
			form.classList.add("invalid");
			text.innerHTML = "Not Matched";
			text.style.color = "red";
			button.disable=true;
		}
	}
</script>


</html>