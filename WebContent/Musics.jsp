<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<%
HttpSession hs=request.getSession(true);
String role=(String)hs.getAttribute("role");
String username=(String)hs.getAttribute("username");
String isAdmin=(String)hs.getAttribute("isadmin");
if(role==null){
	response.sendRedirect("Login.jsp");
}
else if(role.equals("admin"))
{
	hs.setAttribute("isadmin", "yes");
}
else if(role.equals("user"))
{
	hs.setAttribute("isadmin", "no");
}
%>
<!DOCTYPE html>
<html>
	<head>
		<title>All Musics</title>
		<jsp:include page="assets.jsp"></jsp:include>
	</head>
	<body onload="refresh()">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h1 class="my-5">All Musics</h1>
		<%if(isAdmin=="yes") { %>
		<form method="post" action="AddMusic" class="mb-4">
		<div class="row">
			<div class="col-sm-4">
			<input class="form-control" type="text" name="name" placeholder="Enter Name">
			</div>
			<div class="col-sm-2">
			<select class="form-control" name="artist">
				 <option disabled>Select Artist</option>
				 <%
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
						PreparedStatement ps=con.prepareStatement("SELECT * FROM J2EE.ARTISTS");
						ResultSet rs=ps.executeQuery();
					while(rs.next()){
					%>
						<option value="<%=rs.getString("name") %>"><%=rs.getString("name") %></option>
					<%
					}
					} catch (Exception e) {
					e.printStackTrace();
					}
				%>
			</select>
			</div>
			<div class="col-sm-4">
			<input class="form-control" type="text" name="url" placeholder="Enter Url">
			</div>
			<div class="col-sm-2">
			<button type ="submit" class="btn btn-success w-100"><i class="fa fa-plus-circle"></i> ADD</button>
			</div>
		</div>
		</form>
		<% } %>
		<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			PreparedStatement ps=con.prepareStatement("SELECT * FROM J2EE.MUSICS");
			ResultSet rs=ps.executeQuery();
		while(rs.next()){
		%>
		<div class="card mb-4" style="width: 100%;">
		  <div class="card-body">
		  	<div class="row">
			  	<div class="col-5">
			    <h5 class="card-title"><%=rs.getString("name") %></h5>
			    <p class="card-text"><%=rs.getString("artist") %></p>
			    </div>
			    <div class="col-5 d-flex align-items-center justify-content-end">
			    <audio controls id="myaudio">
				  <source src="<%=rs.getString("url") %>" type="audio/mpeg">
				  Your browser does not support the audio element.
				</audio>
				</div>
				<div class="col-2 d-flex justify-content-around align-items-center">
				    <form action="AddFavorite" method="post">
						<input type="hidden" name="user" value="<%=username %>">
						<input type="hidden" name="a-name" value="<%=rs.getString("name") %>">
						<input type="hidden" name="a-artist" value="<%=rs.getString("artist") %>">
						<input type="hidden" name="a-url" value="<%=rs.getString("url") %>">
						<button type ="submit" class="btn btn-primary"><i class="fa fa-heart"></i></button>
					</form>
			  
					<%if(isAdmin=="yes") { %>
					<!--  <form action="" method="post">
						<input type="hidden" name="table" value="MUSICS">
						<input type="hidden" name="iwth" value="NAME">
						<input type="hidden" name="iden" value="<%=rs.getString("name") %>">
						<button type ="submit" class="btn btn-secondary"><i class="fas fa-edit"></i></button>
					</form> -->
					<form action="DeleteServlet" method="post">
						<input type="hidden" name="table" value="MUSICS">
						<input type="hidden" name="iwth" value="NAME">
						<input type="hidden" name="iden" value="<%=rs.getString("name") %>">
						<button type ="submit" class="btn btn-danger"><i class="fa fa-trash"></i></button>
					</form>
					<%} %>
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