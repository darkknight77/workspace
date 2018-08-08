<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Registartion Page</title>
</head>
<body>
    <h1>Registration Form</h1>
    <p></p>
    <form:form action="savestudent" method="post" modelAttribute="student1">
        <table>
         <form:hidden path="id"/>
            <tr>
                <td colspan="2"><form:errors path="*" cssStyle="color : red;" />
                </td>
            </tr>
            <tr>
                <td>Name :</td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td>Branch :</td>
                <td><form:input path="branch" /></td>
            </tr>
            <tr>
                <td>College :</td>
                <td><form:input path="college" /></td>
            </tr>
            <tr>
                <td>Roll No :</td>
                <td><form:input path="rollNo"/>
                        </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Save Changes" /></td>
            </tr>
        </table>
    </form:form>
</body>
</html>