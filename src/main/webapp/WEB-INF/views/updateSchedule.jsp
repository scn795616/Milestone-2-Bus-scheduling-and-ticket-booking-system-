<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Schedule</title>
<%@include file="/includes/header.jsp"%>

 <style>
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
    </style>
    
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>
	<div class="container mt-5 d-flex justify-content-center">
        <div class="card w-50">
            <div class="card-header text-center">
                <h2><i class="fas fa-bus"></i>Update Schedule details</h2>
            </div>
            <div class="card-body">
            <form action="<c:url value="/schedulecontroller/update?id=${id}"/>" method="post" id="updateForm">
            	<input type="hidden" name="id" value="${schedule.id}">
            <div class="form-group">
                <label for="busId"><i class="fas fa-bus"></i> Bus Number:<span> *</span></label>
               <input type="text" class="form-control" id="busId" name="busId" value="${busId}" readonly>

                <div class="error" id="busError"></div>
            </div>
            <div class="form-group">
                <label for="routeId"><i class="fa-solid fa-route"></i> Route ID:<span> *</span></label>
                 <input type="text" class="form-control" id="routeId" name="routeId" value="${routeId}" readonly>

                <div class="error" id="routeError"></div>
            </div>
             <div class="form-group">
                <label for="arrivalDate"><i class="fas fa-clipboard"></i> Arrival Date:<span> *</span></label>
                <input type="date" class="form-control" id="arrivalDate" name="arrivalDate" value="${arrivalDate}" placeholder="Select the arrival time" required>
                <div class="error" id="typeError"></div>
            </div>
             <div class="form-group">
                <label for="departureDate"><i class="fas fa-clipboard"></i> Departure Date:<span> *</span></label>
                <input type="date" class="form-control" id="departureDate" name="departureDate" value="${departureDate}" placeholder="Select the arrival time" required>
                <div class="error" id="typeError"></div>
            </div>
            <div class="form-group">
                <label for="arrivalTime"><i class="fas fa-clipboard"></i> Arrival Time:<span> *</span></label>
                <input type="time"  step="1" class="form-control" id="arrivalTime" name="arrivalTime" value="${arrivalTime}" placeholder="Select the arrival time" required>
                <div class="error" id="typeError"></div>
            </div>
            <div class="form-group">
                <label for="departureTime"><i class="fas fa-clipboard"></i> Departure Time:<span> *</span></label>
                <input type="time" step="1" class="form-control" id="departureTime" name="departureTime" value="${departureTime}" placeholder="Select the departure time" required>
                <div class="error" id="typeError"></div>
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-primary"><i class="fas fa-bus"></i> Update</button>
            </div>
        </form>
    </div>
    </div>
   
</div>
</body>
</html>