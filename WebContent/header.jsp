<%@page import="javax.servlet.http.*"%>
<%
	HttpSession hs=request.getSession(true);
	String isauth=(String)hs.getAttribute("isadmin");
%>
<nav class="navbar navbar-expand-lg navbar-secondary bg-light">
	<div class="container">
	  <a class="navbar-brand" href="Musics.jsp"><i class="fas fa-headphones-alt fa-4x text-primary"></i></a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNav">
	    <ul class="navbar-nav ml-auto">
	      <li class="nav-item px-3 ml-2">
	        <a class="nav-link" href="Musics.jsp">Home</a>
	      </li>
	      <% if(isauth=="yes"){ %>
	      <li class="nav-item px-3 ml-2">
	        <a class="nav-link" href="Artists.jsp">Artists</a>
	      </li>
	      <li class="nav-item px-3 ml-2">
	        <a class="nav-link" href="Users.jsp">Users</a>
	      </li>
	      <% } %>
	      <li class="nav-item px-3 ml-2">
	        <a class="nav-link" href="Favorite.jsp">Favorite</a>
	      </li>
	      <li class="nav-item bg-danger rounded-pill px-3 ml-2">
	        <a class="nav-link text-white" href="Logout.jsp"><i class="fa fa-sign-out-alt"></i> Logout</a>
	      </li>
	    </ul>
	  </div>
	</div>
</nav>