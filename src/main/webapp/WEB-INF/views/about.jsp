<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
<%@include file="/includes/header.jsp"%>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
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
        .card {
            margin-bottom: 20px;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
        }
    </style>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="about-section text-center">
        <div class="container">
            <h1>About Us</h1>
            <p>Welcome to Bus Management System! Our mission is to revolutionize the bus transportation industry by providing a comprehensive, user-friendly platform that streamlines bus management processes.</p>
        </div>
    </div>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-eye"></i> Our Vision</h5>
                        <p class="card-text">At Bus Management System, we envision a world where bus transportation is seamless, efficient, and transparent. We aim to be the leading solution provider in the industry, helping businesses of all sizes manage their bus operations with ease and precision.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-bullseye"></i> Our Mission</h5>
                        <p class="card-text">Our mission is to deliver innovative and reliable bus management solutions that enhance operational efficiency, reduce costs, and improve customer satisfaction. We are committed to leveraging the latest technologies to provide our clients with the best possible service.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-list"></i> What We Offer</h5>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check-circle"></i> Real-Time Tracking: Monitor your buses in real-time with our advanced tracking system.</li>
                            <li><i class="fas fa-check-circle"></i> Efficient Scheduling: Optimize your bus schedules to ensure timely departures and arrivals.</li>
                            <li><i class="fas fa-check-circle"></i> Inventory Management: Keep track of your bus fleet with our integrated management tools.</li>
                            <li><i class="fas fa-check-circle"></i> Comprehensive Reporting: Generate detailed reports to analyze and improve your bus operations.</li>
                            <li><i class="fas fa-check-circle"></i> User-Friendly Interface: Enjoy a seamless experience with our intuitive and easy-to-use platform.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
