<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		<h1>Add Student</h1>
		<form:form method="post" modelAttribute="student">
			<fieldset class="form-group">
				<form:hidden path="id" />
				<form:label path="Sname">Student Name</form:label>
				</br>
				<form:input type="text" path="Sname" class="form-control"
					required="required"></form:input>
			</fieldset>


			<fieldset class="form-group">
				<form:label path="percentage">Percentage</form:label>
				</br>
				<form:input type="text" path="Percentage" class="form-control"
					required="required"></form:input>
			</fieldset>


			<fieldset class="form-group">
				<form:label path="University">University</form:label>
				</br>
				<form:input type="text" path="University" class="form-control"
					required="required"></form:input>
			</fieldset>


			</br>
			<button class="btn btn-primary" type="submit">
				<a href=add-Student><font color="white">Add Student</font></a>
			</button>
		</form:form>



		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script
			src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
	</div>
</body>
</html>