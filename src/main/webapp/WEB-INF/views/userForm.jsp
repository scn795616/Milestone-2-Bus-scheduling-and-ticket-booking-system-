<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="/includes/header.jsp"%>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

<h1>hii ${role}</h1>
<form action="${pageContext.request.contextPath}/usercontroller/users" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required="true" />
        </div> 
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required="true" />
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="text" name="email" id="email" required="true" />
        </div>
        <div>
            <label for="firstName">First Name:</label>
            <input type="text" name="firstName" id="firstName" required="true" />
        </div>
        <div>
            <label for="lastName">Last Name:</label>
            <input type="text" name="lastName" id="lastName" required="true" />
        </div>
        <div>
            <label for="mobileNumber">Mobile Number:</label>
            <input type="text" name="mobileNumber" id="mobileNumber" required="true" />
        </div>
        <div>
            <label for="role">Role:</label>
            <input type="text" name="role" id="role" required="true" />
        </div>
        <div>
            <button type="submit">Submit</button>
        </div>
    </form>
    <p>${message}</p>

</body>
</html>