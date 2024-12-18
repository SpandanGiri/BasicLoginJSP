<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
</head>
<body>

	<form action="Welcome.jsp"  method="get">
		<input name="Logout" type="submit" value="Logout">		
	</form>
	
	
	<%
		HttpSession sess = request.getSession(false);
	
	
		if(request.getParameter("Logout") != null){
			
			System.out.println("Logout: " + request.getParameter("Logout"));
			sess = request.getSession(false);
			sess.removeAttribute("username");
			sess.removeAttribute("password");
			
			sess.invalidate();
			response.sendRedirect("Login.jsp");
			
		}else{
			
			if(sess != null){
				if(sess.getAttribute("username") !=  null && sess.getAttribute("password") != null){
					String username = sess.getAttribute("username").toString();
					String password = sess.getAttribute("password").toString();
					
					if(username.equals("spandy") && password.equals("123")){
						out.println("<h1>Welcome </h1>");
						out.println(username);
						out.println("<br>");
						out.close();
						
						
					}
					else{
						out.println("<h1>Invalid login details</h1>");
						out.close();			
						response.sendRedirect("Login.jsp");
					}
				}
				else{
					out.println("<h1>Invalid session</h1>");
					out.close();
				}
			}				
			
		}

	%>
	

	
</body>
</html>