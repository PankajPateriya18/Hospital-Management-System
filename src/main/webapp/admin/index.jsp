<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
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

	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>

		<c:if test="${not empty errorMsg }">
			<p class="text-center text-danger fs-5">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succ }">
			<p class="text-center text-success fs-3">${succ}</p>
			<c:remove var="succ" scope="session" />
		</c:if>
		<%@page import="com.db.DBConnect"%>
		<%@page import="com.dao.DoctorDao"%>
		<% 
		 DoctorDao dao = new DoctorDao(DBConnect.getConn()); 
		 %>

		<div class="row">
			<div class="col-md-4">
				<a class="nav-link active" href="viewDoctor.jsp">
					<div class="card paint-card btn">
						<div class="card-body text-center text-success">
							<i class="fas fa-user-md fa-3x"></i><br>
							<p class="fs-4 text-center">Doctor</p>
							<br><%=dao.countDoctor() %>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a class="nav-link active" href="viewUser.jsp">
					<div class="card paint-card btn">
						<div class="card-body text-center text-success">
							<i class="fas fa-user-circle fa-3x"></i><br>
							<p class="fs-4 text-center">User</p>
							<br><%=dao.countUser() %>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a class="nav-link active" href="patient.jsp">
					<div class="card paint-card btn">
						<div class="card-body text-center text-success">
							<i class="fa-solid fa-calendar-days fa-3x"></i><br>
							<p class="fs-4 text-center">Total Appointment</p>
							<br><%=dao.countAppointment() %>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-2">
				<div class="card paint-card btn" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">Add Specialist</p>
						<br><%=dao.countSpecialist() %>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form action="../addSpecialist" method="post">
						<div action="form-group">
							<label>Enter Specialist</label> <input type="text"
								name="specName" class="form=control w-100">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>