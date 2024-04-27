<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Information</title>
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

	<c:if test="${empty doctobj} ">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">Patient Details</p>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-4">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-4">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No.</th>
									<th scope="col">Disease</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%@page import="com.db.DBConnect"%>
								<%@page import="com.dao.AppointmentDao"%>
								<%@page import="com.entities.Doctor"%>
								<%@page import="com.entities.Appointment"%>
								<%@ page import="java.util.List"%>

								<%
								Doctor doctor = (Doctor) session.getAttribute("doctorobj");
								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByDoctorLogin(doctor.getId());
								for (Appointment ap : list) {
								%>

								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointmentDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhno()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									<td>
										<%
									   if("Pending".equals(ap.getStatus())){%> <a
										href="comment.jsp?id=<%=ap.getId() %>"
										class="btn btn-success btn-sm">Comment</a> <%}else{ %> <a
										href="#" class="btn btn-success btn-sm disabled">Comment</a> <% }
									%>

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

		</div>
	</div>




</body>
</html>