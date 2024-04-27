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
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="../add_doctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input type="text"
									required name="fullName" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label><input type="date" required
									name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input
									type="text" required name="qualification" class="form-control">
							</div>
							<%@page import="java.util.List"%>
							<%@page import="com.db.DBConnect"%>
							<%@page import="com.dao.SpecalistDao"%>
							<%@page import="com.entities.Specalist"%>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>--select--</option>
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
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No.</label><input type="number"
									required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label><input type="password"
									required name="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>

			<%-- 			<%@page import="com.db.DBConnect"%>
			<%@page import="com.dao.DoctorDao"%>
			<%@page import="com.entities.Doctor"%> --%>

			<%-- 			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">Doctor Details</p>

						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specification</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No.</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							    <% DoctorDao dao3 = new DoctorDao(DBConnect.getConn());
							       List<Doctor> list3 = dao3.getAllDoctor();
							       for(Doctor d3 : list3)
							       {%> 
							       <tr>
							          <td><%=d3.getFullName() %> </td>
							          <td><%=d3.getDob() %></td>
							          <td><%=d3.getQualification() %></td>
							          <td><%=d3.getSpecialist() %></td>
							          <td><%=d3.getEmail() %></td>
							          <td><%=d3.getMobNo() %>
							          <td><a href="edit_doctor.jsp?id=<%=d3.getId()%>" class="btn btn-sm btn-primary">Edit</a>
							              <a href="#" class="btn btn-sm btn-danger">Delete</a>
							          </td>
							       </tr>
							       <% } 
							    %>
							</tbody>
						</table>
					</div>
				</div>
			</div> --%>

		</div>
	</div>



</body>
</html>