<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<%
	HttpSession hs=request.getSession(true);
	String isauth=(String)hs.getAttribute("isadmin");
	if(isauth != null){
		response.sendRedirect("Musics.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<jsp:include page="assets.jsp"></jsp:include>
</head>
<body>
<div class="container d-flex align-items-center justify-content-center" style="height: 90vh; width: 100vw;">
	<div style="width: 400px;" class="border rounded p-4">
	<p class="text-center my-5 mx-4 text-primary"><i class="fas fa-headphones-alt fa-7x"></i></p>
	<h4 class="mb-4 text-center">Register Now</h4>
		<form method="post" action="RegisterServlet">
			<input class="form-control mb-3" type="text" name="uid" placeholder="Username" />
			<input class="form-control mb-3" type="password" name="pass" placeholder="Password" />
			<button type="submit" class="btn btn-primary w-100 mb-4">Register</button>
		</form>
		<p class="text-center">Already have a account? <a href="Login.jsp">Login</a></p>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>