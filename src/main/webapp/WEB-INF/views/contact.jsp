<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Page</title>
<%@include file="/includes/header.jsp"%>
<style>
	        .about-section {
            background-color: #5e9198f9; /* Bootstrap info color */
            color: white;
            padding: 60px 0;
        }
        .about-section h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        .about-section p {
            font-size: 1.2rem;
        }
</style>
</head>
<body>

	<%@include file="/includes/navbar.jsp"%>

<div class="about-section text-center">
        <div class="container">
            <h1>Contact Us</h1>
            <p>Reach out to us for any inquiries or support</p>
        </div>
    </div>
<main class="container my-5">
<div class="row">
<div class="col-md-6">
	<h2>Contact Information</h2>
	<p><strong>Address:</strong> 5th cross,1st main,vijaynagar</p>
	<p><strong>Phone:</strong> +91 9876567765</p>
	<p><strong>Email:</strong> <a href="mailto:scn89765@gmail.com">scn89765@gmail.com</a></p>
  </div>
  </div> 
  </main>
    <%@include file="/includes/footer.jsp"%>

</body>
</html>