<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<%
HttpSession hs=request.getSession(true);
String username=(String)hs.getAttribute("username");
String isauth=(String)hs.getAttribute("isadmin");
if(isauth != null){
	//response.sendRedirect("Musics.jsp");
} else {
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Favorites</title>
<jsp:include page="assets.jsp"></jsp:include>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
<div class="container">
		<h1 class="my-5">All Favorites</h1>
		<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			PreparedStatement ps=con.prepareStatement("SELECT * FROM J2EE.FAVORITES WHERE USERNAME=?");
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
		while(rs.next()){
		%>

			<%-- <td><%=rs.getString("username") %></td>
				 <td><%=rs.getString("name") %></td>
				 <td><%=rs.getString("artist") %></td> --%>
	
				<div class="card mb-4" style="width: 100%;">
				  <div class="card-body">
				  	<div class="row">
					  	<div class="col-6">
					    <h5 class="card-title"><%=rs.getString("name") %></h5>
					    <p class="card-text"><%=rs.getString("artist") %></p>
					    </div>
					    <div class="col-5 d-flex align-items-center justify-content-end">
					    <audio controls id="myaudio">
						  <source src="<%=rs.getString("url") %>" type="audio/mpeg">
						  Your browser does not support the audio element.
						</audio>
						</div>
						<div class="col-1 d-flex justify-content-center align-items-center">
							<form action="DeleteServlet" method="post">
								<input type="hidden" name="table" value="FAVORITES">
								<input type="hidden" name="iwth" value="NAME">
								<input type="hidden" name="iden" value="<%=rs.getString("name") %>">
								<button type ="submit" class="btn btn-danger"><i class="fa fa-trash"></i></button>
							</form>
						</div>
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
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>