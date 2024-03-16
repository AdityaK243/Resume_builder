<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ForgetPassword</title>
<script type="text/javascript">
	function matchPassword() {
		var form = document.getElementById("form");
		const button = document.getElementById("s");
		var pswd1 = document.getElementById("pswd1").value;
		var pswd2 = document.getElementById("pswd2").value;
		var text = document.getElementById("error_pass");
		if ((pswd1 == pswd2)) {
			form.classList.add("valid");
			form.classList.remove("invalid");
			text.innerHTML = "Matched";
			text.style.color = "green";
			button.disabled=false;
		} else {
			form.classList.remove("valid");
			form.classList.add("invalid");
			text.innerHTML = "Not Matched";
			text.style.color = "red";
			button.disabled=true;
		}
	}
</script>
</head>
<center>
	<body>
		<form id="form" action="ForgetServlets" method="post">
			<table>
				<tr>
					<td id="us">NewPassword</td>
					<td><span style="color: red">${error}</span></td>

				</tr>
				<tr>
					<td id="as">Email</td>
					<td><input type="text" placeholder="Email" name="email"></td>
				</tr>
				<tr>
					<td id="vs">PASSWORD</td>
					<td><input id="pswd1" type="password"
						placeholder="EnterNewPASSWORD" name="password"></td>
				</tr>
				<tr>
					<td id="vs">CONFIRM_PASSWORD</td>
					<td><input type="password" id="pswd2" placeholder="EnterNewPASSWORD" name="con_Password" onkeyup="matchPassword()""></td>
					<td><span id="error_pass"></span></td>
				</tr>
				<tr>
					<td><button id="s" type="submit">UPDATE PASSWORD</button></td>

				</tr>

			</table>
		</form>
	</body>
</center>




</html>