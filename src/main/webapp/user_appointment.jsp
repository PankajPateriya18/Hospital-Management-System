<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("img/hospital.jpeg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

body {
	background-color: rgb(246, 243, 237);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img src="img/doct3.jpg">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-4">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-4">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="addAppointment" class="row g-3" method="post">
							<input type="hidden" name="userid" value="${userobj.id}">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									type="text" name="fullName" class="form-control" required>
							</div>
							<div class="col-md-6">
								<label>Gender</label><select name="gender" class="form-control"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									type="number" min="1" max="100" name="age" class="form-control"
									required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" name="appoint_date"
									class="form-control" required>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" name="email" class="form-control" required>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									type="number" maxlength="10" name="phno" class="form-control"
									required>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									type="text" name="disease" class="form-control" required>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Doctor</label> <select
									name="doct" class="form-control" required>
									<option value="not-selected">--select--</option>
									<%@ page import="java.util.List"%>
									<%@page import="com.db.DBConnect"%>
									<%@page import="com.dao.DoctorDao"%>
									<%@page import="com.entities.Doctor"%>

									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getId()%>
										<%=d.getFullName()%>
										<%=d.getSpecialist()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="col-md-12">
								<label for="inputEmail4" class="form-label">Full Address</label>

								<textarea name="address" rows="3" class="form-control" required></textarea>
							</div>
							<c:if test="${empty userobj }">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>

							</c:if>
							<c:if test="${not empty userobj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>