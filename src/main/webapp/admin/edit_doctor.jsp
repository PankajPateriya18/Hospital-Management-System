<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor Details</title>
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
						<p class="fs-3 text-center">Edit Doctor Details</p>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<%@page import="com.db.DBConnect"%>
						<%@page import="com.dao.DoctorDao"%>
						<%@page import="com.entities.Doctor"%>
						<%
int id = Integer.parseInt(request.getParameter("id"));
DoctorDao dao = new DoctorDao(DBConnect.getConn()); 
Doctor d = dao.getDoctorById(id);
%>
						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									required name="fullName" class="form-control"
									value="<%=d.getFullName()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date" required
									name="dob" class="form-control" value="<%=d.getDob()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" required name="qualification" class="form-control"
									value="<%=d.getQualification()%>">
							</div>
							<%@ page import="java.util.List"%>
							<%@page import="com.db.DBConnect"%>
							<%@page import="com.dao.SpecalistDao"%>
							<%@page import="com.entities.Specalist"%>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option><%=d.getSpecialist() %></option>
									<%
									SpecalistDao dao1 = new SpecalistDao(DBConnect.getConn());
									List<Specalist> list = dao1.getAllSpecialist();
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
									required name="email" class="form-control"
									value="<%=d.getEmail()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No.</label><input type="number"
									required name="mobno" class="form-control"
									value="<%=d.getMobNo()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label><input type="text"
									required name="password" class="form-control"
									value="<%=d.getPassword()%>">
							</div>
							<input type="hidden" name="id" value="<%=d.getId() %>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>