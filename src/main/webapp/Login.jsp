<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<h1>Login Page</h1>
	<form action="" method="post">
		Username
		<input name ="username" type="text"><br>
		Password
		<input name ="password" type="password"><br>
		<input type="submit" name="submit" >
	</form>
	
	<%
	
		String username = request.getParameter("username");
	    String password = request.getParameter("password");
	
		if(username != null && password != null ){

			HttpSession sess = request.getSession();
			sess.setAttribute("username", username);
			sess.setAttribute("password", password);
			
			response.sendRedirect("Welcome.jsp");
		}
		else{
			out.println("<h3>Please enter some values in the above fields.</h3>");
		}

		
	%>

</body>
</html>