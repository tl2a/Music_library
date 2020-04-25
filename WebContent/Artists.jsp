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
<title>Artists</title>
<jsp:include page="assets.jsp"></jsp:include>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
<div class="container">
		<h1 class="my-5">All Artists</h1>
		<form action="AddArtist" method="post" class="mb-4">
		<div class="row">
			<div class="col-10">
				<input type="text" name="f-name" class="form-control" placeholder="Enter Artist Name">
			</div>
			<div class="col-2">
				<button type ="submit" class="btn btn-success w-100"><i class="fa fa-plus-circle"></i> ADD</button>
			</div>
		</div>
		</form>
		<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			PreparedStatement ps=con.prepareStatement("SELECT * FROM J2EE.ARTISTS");
			ResultSet rs=ps.executeQuery();
		while(rs.next()){
		%>
		<div class="card mb-4" style="width: 100%;">
		  <div class="card-body">
		  <div class="row">
				<div class="col-11 d-flex align-items-center">
			    <h5 class="card-title m-0"><%=rs.getString("name") %></h5>
			    </div>
			    <div class="col-1 d-flex align-items-center justify-content-center">
			    <form action="DeleteServlet" method="post">
					<input type="hidden" name="table" value="ARTISTS">
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