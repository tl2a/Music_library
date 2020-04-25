<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<%
	HttpSession hs=request.getSession(true);
	String isauth=(String)hs.getAttribute("isadmin");
	if(isauth=="yes"){
		//response.sendRedirect("Musics.jsp");
	} else {
		response.sendRedirect("Login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>
<jsp:include page="assets.jsp"></jsp:include>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
<div class="container">
		<h1 class="my-5">All Users</h1>
		<div class="row">
		<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			PreparedStatement ps=con.prepareStatement("SELECT * FROM J2EE.USERS WHERE ROLE != 'admin'");
			ResultSet rs=ps.executeQuery();
		while(rs.next()){
		%>
			<%-- <td><%=rs.getString("username") %></td>
			<td><%=rs.getString("password") %></td>
			<td><%=rs.getString("role") %></td> --%>
			<div class="col-sm-4">
				<div class="card mb-4" style="width: 100%;">
				  <div class="card-body">
				    <h5 class="card-title text-uppercase"><%=rs.getString("username") %></h5>
				    <p class="card-text"><strong>Password: </strong>*********</p>
				    <p class="card-text"><strong>Role: </strong><%=rs.getString("role") %></p>
				    <form action="AlterAdmit" method="post">
						<input type="hidden" name="user" value="<%=rs.getString("username") %>">
						<input type ="submit" value="Make Admin" class="btn btn-primary">
					</form>
				  </div>
				</div>
			</div>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>