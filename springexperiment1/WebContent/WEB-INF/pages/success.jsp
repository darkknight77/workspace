<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>student Management Screen</title>
</head>
<body>
    <div align="center">
        <h1>student List</h1>
        <h3>
            <a href="newStudent">New student</a>
        </h3>
        <table border="1">
 
            <th>Name</th>
            <th>Branch</th>
            <th>College</th>
            <th>Rollno</th>
            <th>Action</th>
 
            <c:forEach var="student" items="${liststudent}">
                <tr>
 
                    <td>${student.name}</td>
                    <td>${student.branch}</td>
                    <td>${student.college}</td>
                    <td>${student.rollNo}</td>
                    <td><a href="editstudent?id=${student.id}">Edit</a>
                             <a
                        href="deletestudent?id=${student.id}">Delete</a></td>
 
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
