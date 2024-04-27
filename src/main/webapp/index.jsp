<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>
<style>
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

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/img7.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/img10.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/img12.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>



	<div class="m-5" style="max-width: 80%;">
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<div class="col">
				<div class="card">
					<img src="img/img21.jpg" class="card-img-top" alt="">
					<div class="card-body">
						<br>
						<br>
						<h5 class="card-title">100% Safety</h5>
						<p class="card-text">We provide every safe environment.</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<img src="img/clean.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Clean Environment</h5>
						<p class="card-text">Hospital management provide clean and
							happy environment.</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<img src="img/friend.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Friendly Doctors</h5>
						<p class="card-text">Doctors behavior is very friendly.</p>
						<br>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<img src="img/img14.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Medical Research</h5>
						<p class="card-text">Inside Hospital campus we also establish
							a Laboratory for research purpose.</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div style="text-align: center; align-items: center; margin: 50px;">
		<h2>Our Team</h2>
		<br>
		<div style="display: flex; flex-direction: row; margin: auto;">
			<div
				style="width: 23%; border: 3px solid black; border-radius: 8px; margin: auto;">
				<img
					style="width: 60%; margin: 5px; min-height: 100px; max-height: 300px;"
					src="https://images.unsplash.com/photo-1594824476967-48c8b964273f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGRvY3RvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"
					alt="">
				<h3>Samuani Simi</h3>
				<p>CEO &#38; Chairman</p>
			</div>
			<div
				style="width: 23%; border: 3px solid black; border-radius: 8px; margin: auto;">
				<img
					style="width: 60%; margin: 5px; min-height: 100px; max-height: 300px;"
					src="https://plus.unsplash.com/premium_photo-1661766752153-9f0c3fad728f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGRvY3RvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"
					alt="">
				<h3>Dr. Shiva Kumar</h3>
				<p>Cheif Doctor</p>
			</div>
			<div
				style="width: 23%; border: 3px solid black; border-radius: 8px; margin: auto;">
				<img
					style="width: 60%; margin: 5px; min-height: 100px; max-height: 300px;"
					src="https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTM3fHxkb2N0b3J8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60"
					alt="">
				<h3>Dr. Pradeep</h3>
				<p>Cheif Doctor</p>
			</div>
			<div
				style="width: 23%; border: 3px solid black; border-radius: 8px; margin: auto;">
				<img
					style="width: 60%; margin: 5px; min-height: 120px; max-height: 300px;"
					src="https://st2.depositphotos.com/1005682/9634/i/600/depositphotos_96348180-stock-photo-indian-male-doctor.jpg"
					alt="">
				<h3>Dr. Ram</h3>
				<p>Cheif Doctor</p>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>