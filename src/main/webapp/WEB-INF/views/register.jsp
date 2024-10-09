<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <style>
    	body{
	        background: url('https://th.bing.com/th/id/OIP.OOVcQ9rZIIXknSJdmQfbVAAAAA?w=474&h=474&rs=1&pid=ImgDetMain') ;
	        background-size: cover;
	        height: 100%;
    	 	background-color: #f4f4f4;
    	}
    	span{
    		color:red;
    	}
        .container {
            margin-top: 50px;
        }
        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            margin-bottom: 20px;
            font-size: 2rem;
            color: #007bff;
            text-align: center;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 5px;
            transition: all 0.3s;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-primary:focus {
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .error {
            color: red;
            font-size: 0.875rem;
            margin-top: 5px;
        }
        .text-center a {
            color: #007bff;
            text-decoration: none;
        }
        .text-center a:hover {
            text-decoration: underline;
        }
        .card-title {
            background-color: #17a2b8;
            color: white;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        
        .btn-custom {
    background-color: #17a2b8;
    border-color: #17a2b8;
    color: white;
}
        
    </style>
</head>
<body>
   <div class="card w-75 mx-auto mt-5">
    <div class="card-body">
        <c:if test="${not empty error}">
            <div class="alert alert-danger mt-3"><i class="fas fa-exclamation-circle"></i> ${error}</div>
        </c:if>
        <h2 class="card-title text-center"><i class="fas fa-user-plus"></i> Sign Up</h2>
        <form action="<c:url value="/usercontroller/users"/>" modelAttribute="registerForm" method="post" id="registrationForm">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="firstName"><i class="fas fa-user"></i> First Name:<span> *</span></label>
                        <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter the first name" required>
                        <div class="error" id="firstNameError"></div>
                    </div>
                    <div class="form-group">
                        <label for="lastName"><i class="fas fa-user"></i> Last Name:<span> *</span></label>
                        <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter the last name" required>
                        <div class="error" id="lastNameError"></div>
                    </div>
                    <div class="form-group">
                        <label for="email"><i class="fas fa-envelope"></i> Email:<span> *</span></label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        <div class="error" id="emailError"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone"><i class="fas fa-phone"></i> Phone Number:<span> *</span></label>
                        <input type="text" class="form-control" id="phone" name="mobileNumber" placeholder="Enter your valid mobile number" required>
                        <div class="error" id="phoneError"></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="username"><i class="fas fa-user"></i> Username:<span> *</span></label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Create the user name" required>
                        <div class="error" id="usernameError"></div>
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Create Password:<span> *</span></label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Create a password" required>
                        <div class="error" id="passwordError"></div>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword"><i class="fas fa-lock"></i> Confirm Password:<span> *</span></label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Re-enter the password" required>
                        <div class="error" id="confirmPasswordError"></div>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-custom"><i class="fas fa-user-plus"></i> Register</button>
                <div>Already have an account? <a href="<c:url value="/usercontroller/login"/>">Login in</a></div>
            </div>
        </form>
    </div>
</div>

<script>
    document.getElementById('firstName').addEventListener('blur', validateFirstName);
    document.getElementById('lastName').addEventListener('blur', validateLastName);
    document.getElementById('email').addEventListener('blur', validateEmail);
    document.getElementById('phone').addEventListener('blur', validatePhone);
    document.getElementById('username').addEventListener('blur', validateUsername);
    document.getElementById('password').addEventListener('blur', validatePassword);
    document.getElementById('confirmPassword').addEventListener('blur', validatePasswordMatch);

    function validateFirstName() {
        const firstName = document.getElementById('firstName').value;
        if (/\d/.test(firstName)) {
            document.getElementById('firstNameError').innerText = 'First name should not contain digits.';
        } else if (firstName.length < 4 || firstName.length > 20) {
            document.getElementById('firstNameError').innerText = 'First name should contain minimum 3 and maximum 20 characters.';
        } else {
            document.getElementById('firstNameError').innerText = '';
        }
    }

    function validateLastName() {
        const lastName = document.getElementById('lastName').value;
        if (/\d/.test(lastName)) {
            document.getElementById('lastNameError').innerText = 'Last name should not contain digits.';
        } 
        else if(lastName.length>20){
        	document.getElementById('lastNameError').innerText='Last Name should not be more than 20 letters';
        }
        else {
            document.getElementById('lastNameError').innerText = '';
        }
    }

    function validateEmail() {
        const email = document.getElementById('email').value;
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            document.getElementById('emailError').innerText = 'Please enter a valid email address.';
        } else {
            document.getElementById('emailError').innerText = '';
        }
    }

    function validatePhone() {
        const phone = document.getElementById('phone').value;
        if (!/^\d{10}$/.test(phone)) {
            document.getElementById('phoneError').innerText = 'Phone number should be 10 digits.';
        } else {
            document.getElementById('phoneError').innerText = '';
        }
    }

    function validateUsername() {
        const username = document.getElementById('username').value;
        const usernamePattern = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]+$/;
        if (!usernamePattern.test(username)) {
            document.getElementById('usernameError').innerText = 'Username should contain both letters and digits.';
        } else {
            document.getElementById('usernameError').innerText = '';
        }
    }

    function validatePassword() {
        const password = document.getElementById('password').value;
        const letterPattern = /[a-zA-Z]/g;
        const digitPattern = /\d/g;
        const specialCharPattern = /[!@#$%^&*]/g;

        const letters = password.match(letterPattern) || [];
        const digits = password.match(digitPattern) || [];
        const specialChars = password.match(specialCharPattern) || [];

        if (letters.length < 3 || digits.length < 2 || specialChars.length < 1) {
            document.getElementById('passwordError').innerText = 'Password should contain at least 3 letters, 2 digits, and 1 special character.';
        } else {
            document.getElementById('passwordError').innerText = '';
        }
    }

    function validatePasswordMatch() {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        if (password !== confirmPassword) {
            document.getElementById('confirmPasswordError').innerText = 'Passwords do not match.';
        } else {
            document.getElementById('confirmPasswordError').innerText = '';
        }
    }

    document.getElementById('registrationForm').addEventListener('submit', function(event) {
        event.preventDefault();
        validateFirstName();
        validateLastName();
        validateEmail();
        validatePhone();
        validateUsername();
        validatePassword();
        validatePasswordMatch();

        if (document.querySelectorAll('.error:empty').length === 7) {
            this.submit();
        }
    });
</script>
</body>

</html>
