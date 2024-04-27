<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User Details</title>
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
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit User Details</p>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<%@page import="com.db.DBConnect"%>
						<%@page import="com.dao.UserDao"%>
						<%@page import="com.entities.User"%>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						UserDao dao = new UserDao(DBConnect.getConn());
						User u = dao.getUserById(id);
						%>
						<form action="../updateUser" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									required name="fullName" class="form-control"
									value="<%=u.getFullName()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label><input type="email"
									required name="email" class="form-control"
									value="<%=u.getEmail()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label><input type="text"
									required name="password" class="form-control"
									value="<%=u.getPassword()%>">
							</div>
							<input type="hidden" name="id" value="<%=u.getId()%>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>