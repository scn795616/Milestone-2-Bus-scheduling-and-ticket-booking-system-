<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 <form action="${pageContext.request.contextPath}/usercontroller/users" method="post">
        <div>
            <label for="username">Username:</label>
            <input path="username" id="username" required="true" />
        </div> 
        <div>
            <label for="password">Password:</label>
            <password path="password" id="password" required="true" />
        </div>
        <div>
            <label for="email">Email:</label>
            <input path="email" id="email" required="true" />
        </div>
        <div>
            <label for="firstName">First Name:</label>
            <input path="firstName" id="firstName" required="true" />
        </div>
        <div>
            <label for="lastName">Last Name:</label>
            <input path="lastName" id="lastName" required="true" />
        </div>
        <div>
            <label for="mobileNumber">Mobile Number:</label>
            <input path="mobileNumber" id="mobileNumber" required="true" />
        </div>
        <div>
            <label for="role">Role:</label>
            <input path="role" id="role" required="true" />
        </div>
        <div>
            <button type="submit">Submit</button>
        </div>
    </form>

</body>
</html>