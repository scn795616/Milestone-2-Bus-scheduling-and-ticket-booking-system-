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
    
     .btn-custom {
    background-color: #17a2b8;
    border-color: #17a2b8;
    color:white;
}
    </style>
    
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>
	<div class="container mt-5 d-flex justify-content-center">
        <div class="card w-50">
            <div class="card-header text-center">
                <h2><i class="fas fa-bus"></i>Add Schedule details</h2>
            </div>
            <div class="card-body">
            <form action="<c:url value="/schedulecontroller/schedules"/>" modelAttribute="addingSchedule" method="post" id="registrationForm">
            <div class="form-group">
                <label for="bus"><i class="fas fa-bus"></i> Bus Number:<span> *</span></label>
                <select class="form-control" id="bus" name="bus.id" required>
                    <c:forEach var="bus" items="${buses}">
                        <option value="${bus.id}">${bus.busNumber}</option>
                    </c:forEach>
                </select>
                <div class="error" id="busError"></div>
            </div>
            <div class="form-group">
                <label for="route"><i class="fa-solid fa-route"></i> Route ID:<span> *</span></label>
                 <select class="form-control" id="route" name="route.id" required>
                    <c:forEach var="route" items="${routes}">
                        <option value="${route.id}">${route.id}</option>
                    </c:forEach>
                </select>
                <div class="error" id="routeError"></div>
            </div>
             <div class="form-group">
                <label for="journeyDate"><i class="fas fa-clipboard"></i> Arrival Date:<span> *</span></label>
                <input type="date" class="form-control" id="journeyDate" name="arrivalDate" placeholder="Select the arrival time" required>
                <div class="error" id="typeError"></div>
            </div>
             <div class="form-group">
                <label for="journeyDate1"><i class="fas fa-clipboard"></i> Departure Date:<span> *</span></label>
                <input type="date" class="form-control" id="journeyDate1" name="departureDate" placeholder="Select the arrival time" required>
                <div class="error" id="typeError"></div>
            </div>
            <div class="form-group">
                <label for="arrivalTime"><i class="fas fa-clipboard"></i> Arrival Time:<span> *</span></label>
                <input type="time"  step="1" class="form-control" id="arrivalTime" name="arrivalTime" placeholder="Select the arrival time" required>
                <div class="error" id="typeError"></div>
            </div>
            <div class="form-group">
                <label for="departureTime"><i class="fas fa-clipboard"></i> Departure Time:<span> *</span></label>
                <input type="time" step="1" class="form-control" id="departureTime" name="departureTime" placeholder="Select the departure time" required>
                <div class="error" id="typeError"></div>
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-custom"><i class="fas fa-bus"></i> Add</button>
            </div>
        </form>
    </div>
    </div>
   
</div>

<script>
  const today = new Date();
  const nextWeek = new Date();
  nextWeek.setDate(today.getDate() + 7);

  const formattedToday = today.toISOString().split('T')[0];
  const formattedNextWeek = nextWeek.toISOString().split('T')[0];

  const datePicker = document.getElementById('journeyDate');
  datePicker.setAttribute('min', formattedToday);
  datePicker.setAttribute('max', formattedNextWeek);
  
  const datePicker1 = document.getElementById('journeyDate1');
  datePicker1.setAttribute('min', formattedToday);
  datePicker1.setAttribute('max', formattedNextWeek);
</script>
</body>
</html>