<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MOtha Fucka</title>
</head>
<body>
<p><font color="red">${errorMessage}</font></p>
<form action="/login" method=post> 

Enter Username <input type="text" name="name">
Enter Password <input type="password" name="password">
<input type="submit">
</form>


</body>
</html>