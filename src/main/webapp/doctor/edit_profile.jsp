<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor Profile</title>
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


	<div class="container mt-3 p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<div class="card-body">


						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-4">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-4">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<form action="../doctorChangePassword" method="post">

							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctorobj.id}" name="uid">
							<input type="hidden" name="id" value="${doctorobj.id}">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3">Edit Profile</p>
					<div class="card-body">
						<c:if test="${not empty errorMsgd }">
							<p class="text-center text-danger fs-4">${errorMsgd}</p>
							<c:remove var="errorMsgd" scope="session" />
						</c:if>
						<c:if test="${not empty succMsgd }">
							<p class="text-center text-success fs-4">${succMsgd}</p>
							<c:remove var="succMsgd" scope="session" />
						</c:if>
						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									required name="fullName" value="${doctorobj.fullName}"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date" required
									name="dob" value="${doctorobj.dob}" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" required name="qualification"
									value="${doctorobj.qualification}" class="form-control">
							</div>
							<%@ page import="java.util.List"%>
							<%@page import="com.db.DBConnect"%>
							<%@page import="com.dao.SpecalistDao"%>
							<%@page import="com.entities.Specalist"%>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>${doctorobj.specialist}</option>
									<%
									SpecalistDao dao = new SpecalistDao(DBConnect.getConn());
									List<Specalist> list = dao.getAllSpecialist();
									for (Specalist s : list) {
									%>
									<option><%=s.getSpecalistName()%>
									</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label><input type="email"
									required readonly name="email" value="${doctorobj.email}"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No.</label><input type="number"
									required name="mobno" value="${doctorobj.mobNo}"
									class="form-control">
							</div>

							<input type="hidden" name="id" value="${doctorobj.id}">
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>



		</div>
	</div>


</body>
</html>