<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%-- <html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="log.css">
<title>Login</title>
</head>

<body>
	<div class="container">
		<form action="LoginServlet" method="post">
		<h1>LOGIN HERE</h1>
			<div style="font-size: 20px;">
				<div>
					
				<span style="color: red">${error}</span>
				</div>
				<!-- <tr>
					<td style="font-size: 30px; text-align: right; padding-right: 1px"
						id="us">LOGIN</td>
					<td id="us" style="font-size: 30px;">HERE</td>



				</tr> -->
				<!-- <tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr> -->
				<div >
					<!-- <td id="as">USERNAME</t -->
					<input type="text" 
						name="User_name" required>
				</div>
				<div>
					<!-- <td id="vs">PASSWORD</td> -->
					<input type="password"
						name="Password">
				</div>
				<div>
					<!-- <td></td> -->
					<a href=http://localhost:8080/log/forget1.jsp>ForgetPassword</a>
				</div>
			<!-- 	<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr> -->
				<div>
				 <a href="http://localhost:8080/log/Register.jsp">SignUp</a>
					<div style="text-align: right; padding-right: 10px">
						<button id="s" type="submit" style="padding: 10px">Login</button>
						
					</div>
				</div>

			</div>
		</form>
	</div>
</body>


</html> --%>



<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
} */
body {
margin-top:40px;
padding:0px; 
font-family: Arial, Helvetica, sans-serif;
background-color:rgb(242,243,243);
	display: flex;
	justify-content: center;
	align-items: center;
	/* width:900px; */
}

* {
  box-sizing: border-box;
}

.container {
  padding: 16px;
  background-color: white;
}


input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}


.sign {
  background-color: #0a77bf;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.sign:hover {
  opacity: 1;
}


a {
  color: dodgerblue;
}


</style>
</head>
<body>

<form action="LoginServlet" method="post">
  <div class="container">
    <h1>Sign in</h1>
    <div>
					
				<span style="color: red">${error}</span>
				</div>
    <hr>

    <label for="email"><b>User Name</b></label>
    <input type="text" name="User_name"  required>

    <label for="psw"><b>Password</b></label>
    <input type="password"  name="Password"  required>
<div>
				
					<a href=http://localhost:8080/log/forget1.jsp>ForgetPassword</a>
				</div>
   
    <hr>
   

    <button type="submit" class="sign">Sign in</button>

  
  <div style=" background-color: #f1f1f1;
  text-align: center;">
    <p>Didn't have an account? <a href="http://localhost:8080/log/RegisterServlet?">SignUp</a>.</p>
  </div>
    </div>
</form>

</body>
</html>
