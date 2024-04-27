<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
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
	<%@include file="component/navbar.jsp"%>



	<form method="post" action="UserRegister"
		style="text-align: center; border: 4px solid rgb(84, 84, 84); border-radius: 20px; margin-left: auto; margin-right: auto; width: 420px; margin-top: 110px; box-shadow: 0 0 10px 0 rgba(0, 0, 0, 3.3); padding: 20px;">
		<h1>User Register</h1>


		<c:if test="${not empty schMsg }">
			<p class="text-center text-success fs-3">${schMsg}</p>
			<c:remove var="schMsg" scope="session" />
		</c:if>
		<c:if test="${not empty errMsg }">
			<p class="text-center text-danger fs-5">${errMsg}</p>
			<c:remove var="errMsg" scope="session" />
		</c:if>
		<div style="padding: 20px; align-self: center;">
			<label>Full Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="text" name="fullname" id="" placeholder="Full-Name"
				style="width: 200px; height: 29px; padding-left: 10px; border-radius: 15px;"
				autofocus required><br> <br> <label>Email-Address</label>&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="email" name="email" id="" placeholder="Email-Address"
				style="width: 200px; height: 29px; padding-left: 10px; border-radius: 15px;"
				required> <br> <br> <label>Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="password" name="password" id="" placeholder="password"
				style="width: 200px; height: 29px; padding-left: 10px; border-radius: 15px;"
				required><br> <br>
			<button type="submit"
				style="width: 100px; height: 30px; padding-left: 10px; text-align: center; font-weight: bolder; border-radius: 20px;">Register</button>
			&nbsp; &nbsp; <input type="reset"
				style="width: 100px; height: 30px; padding-left: 10px; text-align: center; font-weight: bolder; border-radius: 20px;">
		</div>
	</form>

</body>
</html>