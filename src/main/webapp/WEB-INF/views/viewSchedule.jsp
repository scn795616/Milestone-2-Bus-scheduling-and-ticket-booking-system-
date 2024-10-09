<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Schedule details</title>
<%@include file="/includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	body{
    	background: url('https://i.pinimg.com/originals/1e/f7/9f/1ef79f8bbebf9f489ae497834bb6bfbd.png') ;
	        background-size: cover;
	        height: 100%;
    	 	background-color: #f4f4f4;
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
	
<div class="container mt-5">
    <h2 class="text-center">Schedule details</h2>
    <c:choose>
    <c:when test="${role=='admin'}">
        <div class="text-right">
            <a href="<c:url value="/schedulecontroller/addschedule"/>" class="btn btn-sm btn-success mb-3">Add Schedule</a>
        </div>
    </c:when>
</c:choose>
    <div class="row">
        <c:forEach var="schedule" items="${scheduleList}">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Bus Number: ${schedule.bus.busNumber}</h5>
                        <p class="card-text">Arrival Date: ${schedule.arrivalDate}</p>
                        <p class="card-text">Departure Date: ${schedule.departureDate}</p>
                        <p class="card-text">Arrival Time: ${schedule.arrivalTime}</p>
                        <p class="card-text">Departure Time: ${schedule.departureTime}</p>
                        <p class="card-text">Source: ${schedule.route.source}</p>
                        <p class="card-text">Destination: ${schedule.route.destination}</p>
                        <p class="card-text">Route ID: <a href="<c:url value="/routecontroller/routebybus?routeId=${schedule.route.id}"/>">${schedule.route.id}</a></p>
                        <c:choose>
                            <c:when test="${sessionScope.role=='admin'}">
                                <a href="<c:url value="/schedulecontroller/update?id=${schedule.id}"/>" class="btn btn-sm btn-custom">Update</a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

	<%@include file="/includes/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
