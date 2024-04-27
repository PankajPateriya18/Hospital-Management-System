<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Appointment</title>
<%@include file="component/allcss.jsp"%>
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

	<c:if test="${empty userobj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment</th>
									<th scope="col">Disease</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%@ page import="java.util.List"%>
								<%@page import="com.db.DBConnect"%>
								<%@page import="com.dao.AppointmentDao"%>
								<%@page import="com.dao.DoctorDao"%>
								<%@page import="com.entities.Appointment"%>
								<%@page import="com.entities.Doctor"%>
								<%@page import="com.entities.User"%>

								<%
								User user = (User) session.getAttribute("userobj");
								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
								DoctorDao da = new DoctorDao(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
								for (Appointment ap : list) {
									int did = ap.getDoctorId();
									Doctor d = da.getDoctorById(did);
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointmentDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>






									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
                                        } else {
                                         %> <%=ap.getStatus()%> <%
                                        }%>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img src="img/doct5.webp" alt="">
			</div>
		</div>
	</div>
</body>
</html>