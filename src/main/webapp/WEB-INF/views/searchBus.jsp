<%@page import="com.itextpdf.kernel.log.SystemOutCounter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search bus</title>
<%@include file="/includes/header.jsp"%>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">


 <style>
 	body{
 		background-image: url('https://th.bing.com/th/id/OIP.eBf6OzAatRaksu1ObV2vhgHaFO?rs=1&pid=ImgDetMain');
 		background-repeat: no-repeat;
 		background-size: cover;
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
    color:white;
}
    
    </style>
    
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>
	<div class="container mt-5 d-flex justify-content-center">
        <div class="card w-50">
            <div class="card-header text-center">
                <h2>Search your bus</h2>
            </div>
            <div class="card-body">
            <form action="<c:url value="/schedulecontroller/availability"/>" method="get" id="registrationForm">
            <div class="form-group">
                <label for="source"><i class="fas fa-bus"></i>Enter the source:<span> *</span></label>
                <select class="form-control" id="source" name="source" required>
                    <c:forEach var="route" items="${routes}">
                        <option value="${route.source}">${route.source}</option>
                    </c:forEach>
                </select>
                <div class="error" id="busError"></div>
            </div>
            <div class="form-group">
                <label for="destination"><i class="fa-solid fa-route"></i> Enter the destination:<span> *</span></label>
                 <select class="form-control" id="destination" name="destination" required>
                    <c:forEach var="route" items="${routes}">
                        <option value="${route.destination}">${route.destination}</option>
                    </c:forEach>
                </select>
                <div class="error" id="routeError"></div>
            </div>
            <%
				System.out.print(Base64.getEncoder().encodeToString("siddu".getBytes()));
            %>
            <div class="form-group">
                <label for="pickup"><i class="fa-solid fa-route"></i> Enter the pickup point:<span> *</span></label>
                 <select class="form-control" id="pickup" name="pickup" required>
                        <option value="${route.destination}">Isro Layout</option>
              			<option value="${route.destination}"> Uttharahalli Circle</option>
              			<option value="${route.destination}">Patalamma temple</option>
              			<option value="${route.destination}">Channasandra</option>
              			<option value="${route.destination}">Ambedkar college</option>
              			<option value="${route.destination}">Nagarbhavi circle</option>
              			<option value="${route.destination}">Vinayaka theater</option>
                </select>
                <div class="error" id="routeError"></div>
            </div>
            
               <div class="form-group">
                <label for="pickup"><i class="fa-solid fa-route"></i> Enter the drop point:<span> *</span></label>
                 <select class="form-control" id="pickup" name="pickup" required>
                        <option value="${route.destination}">Isro Layout</option>
              			<option value="${route.destination}"> Uttharahalli Circle</option>
              			<option value="${route.destination}">Patalamma temple</option>
              			<option value="${route.destination}">Channasandra</option>
              			<option value="${route.destination}">Ambedkar college</option>
              			<option value="${route.destination}">Nagarbhavi circle</option>
              			<option value="${route.destination}">Vinayaka theater</option>
                </select>
                <div class="error" id="routeError"></div>
            </div>
            
             <div class="form-group">
                <label for="journeyDate"><i class="fas fa-clipboard"></i>Date:<span> *</span></label>
                <input type="date" class="form-control" id="journeyDate" name="journeyDate" placeholder="Select the arrival time" required>
                <div class="error" id="typeError"></div>
            </div>
             
            
            <div class="text-center">
                <button type="submit" class="btn btn-custom"><i class="fas fa-bus"></i> Search</button>
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
</script>


</body>
</html>    