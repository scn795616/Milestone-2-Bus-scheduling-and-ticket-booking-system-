<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<%@include file="/includes/header.jsp"%>
<style>
	body {
	        background: url('https://th.bing.com/th/id/OIP.OOVcQ9rZIIXknSJdmQfbVAAAAA?w=474&h=474&rs=1&pid=ImgDetMain') ;
	        background-size: cover;
	        height: 100%;
    	}
    span {
        color: red;
    }
    .card {
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .card-header {
        background-color: #17a2b8;
        color: white;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
    }
    .btn-primary {
        background-color: #007bff;
        border: none;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }
    
    .btn-custom {
    background-color: #17a2b8;
    border-color: #17a2b8;
    color: white;
}
    
</style>
</head>
<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card w-50">
            <div class="card-header text-center">
                <h2><i class="fas fa-sign-in-alt"></i> Login</h2>
            </div>
            <div class="card-body">
                <form action="<c:url value="/usercontroller/login"/>" modelAttribute="loginForm" method="post">
                    <div class="form-group">
                        <label for="username"><i class="fas fa-user"></i> Username:<span> *</span></label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Password:<span> *</span></label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-custom"><i class="fas fa-sign-in-alt"></i> Login</button>
                        <div class="mt-3">Don't have an account? <a href="<c:url value="/usercontroller/register"/>">Sign Up</a></div>
                    </div>
                </form>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3"><i class="fas fa-exclamation-circle"></i> <c:out value="${error}"/> </div>
                </c:if>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>