<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>


	<div class="container">
		<table class="table table-striped">
			<caption>Statistics</caption>
			<thead>
				<tr>
					<th>Player Name</th>
					<th>Matches</th>
					<th>Hundreds</th>
					<th>Fifties</th>
					<th>High Score</th>
					<th>Total Runs</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${players}" var="play">
					<tr>
						<th>${play.playerName}</th>
						<th>${play.totalMatches}</th>
						<th>${play.totalHundreds}</th>
						<th>${play.totalFifties}</th>
						<th>${play.highScore}</th>
						<th>${play.totalScore}</th>
						<th><button class="btn btn-primary">
								<a href="update-player?id=${play.id}"><font color="white">Update</font></a>
							</button></th>
						<th><button class="btn btn-warning">
								<a href="delete-player?id=${play.id}"><font color="white">Delete</font></a>
							</button></th>

					</tr>
				</c:forEach>

			</tbody>


		</table>
		<button type="button" class="btn btn-success">
			<a href="add-player"><font color="white">Add Player</font> </a>
		</button>
		
	</div>
	
	<script src="/webjars/jquery/1.9.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script
			src="/webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
</body>
</html>