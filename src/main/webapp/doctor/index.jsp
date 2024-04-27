<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Index</title>
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

	<%@page import="com.db.DBConnect"%>
	<%@page import="com.dao.DoctorDao"%>
	<%@page import="com.entities.Doctor"%>
	<%
	Doctor d = (Doctor) session.getAttribute("doctorobj");
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>


	<p class="text-center fs-3">Doctor Dashboard</p>

	<div class="container p-5">

		<div class="row">
			<div class="col-md-4 offset-md-2">
				<a href="edit_profile.jsp">
					<div class="card paint-card btn">
						<div class="card-body text-center text-success">
							<i class="fas fa-user-md fa-3x"></i><br>
							<p class="fs-4 text-center">Doctor</p>
							<br><%=dao.countDoctor()%>
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
							<br><%=dao.countAppointmentByDoctorId(d.getId())%>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

</body>
</html>

<%-- <p class="text-center fs-3">Admin Dashboard</p>
		
		<c:if test="${not empty errorMsg }">
		  <p class="text-center text-danger fs-5">${errorMsg} </p>
		  <c:remove var="errorMsg" scope="session"/>
		</c:if>
		<c:if test="${not empty succ }">
		  <p class="text-center text-success fs-3">${succ} </p>
		  <c:remove var="succ" scope="session"/>
		</c:if> --%>