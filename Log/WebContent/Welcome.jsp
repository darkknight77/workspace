<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
response.addHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("Login.jsp");
}
%>

	<form action="Welcome" method="get">
		<input type="submit" value="Display"><br />
	</form>

	<form action="Welcome" method="post">
		<input type="submit" value="Logout"><br />
	</form>

</body>
</html>