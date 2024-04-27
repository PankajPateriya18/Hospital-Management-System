<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

body {
	background-color: rgb(246, 243, 237);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container-fluid p-3">
		<div class="row">



			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Details</p>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Email</th>
								</tr>
							</thead>
							<tbody>
								<%@page import="com.db.DBConnect"%>
								<%@page import="com.dao.UserDao"%>
								<%@page import="com.entities.User"%>
								<%@ page import="java.util.List"%>
								<%
								UserDao dao = new UserDao(DBConnect.getConn());
								List<User> l = dao.getAllUser();
								for (User u : l) {
								%>
								<tr>
									<td><%=u.getFullName()%></td>
									<td><%=u.getEmail()%></td>
									<td><a href="edit_user.jsp?id=<%=u.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a
										href="../deleteDoctor?id=<%=u.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>