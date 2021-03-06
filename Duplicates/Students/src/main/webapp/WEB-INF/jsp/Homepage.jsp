<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<caption>Student Data</caption>
			<thead>
				<tr>
					<th>Id</th>
					<th>Student Name</th>
					<th>Percentage</th>
					<th>University</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${students}" var="student">
					<tr>
						<th>${student.id}</th>
						<th>${student.sname}</th>
						<th>${student.percentage}</th>
						<th>${student.university}</th>
						<th><button class="btn btn-primary">
								<a href="/update-student?id=${student.id}"><font color="white">Update</font></a>
							</button></th>
						<th><button class="btn btn-warning">
								<a href="/delete-student?id=${student.id}"><font color="white">Delete</font></a>
							</button></th>

					</tr>
				</c:forEach>

			</tbody>


		</table>
		<button type="button" class="btn btn-success">
			<a href="/add-student"><font color="white">Add Student</font> </a>
		</button>
		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script
			src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
	</div>
</body>
</html>