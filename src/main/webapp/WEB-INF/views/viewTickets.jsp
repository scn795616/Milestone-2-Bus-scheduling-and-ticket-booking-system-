<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Schedule details</title>
<%@include file="/includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>
	
<div class="container mt-5">
    <h2 class="text-center">View Ticket details</h2>
    
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead style="background-color: #17a2b8;color: white;">
                <tr>
                    
                    <th>Booking time</th>
                    <th>No of Passenger</th>
                    <th>No of seats</th>
                    <th>User Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${ticketList}">
                    <tr>
                        <td>${ticket.ticketTime}</td>
                        <td>${ticket.totalPassenger}</td>
                        <td>${ticket.totalSeats}</td>
                        <td>${ticket.user.firstName}</td>
                        <td><a href="<c:url value="/invoicecontroller/downloadInvoice?userId=${ticket.user.id}&ticketTime=${ticket.ticketTime}&ticketId=${ticket.id}"/>" class="btn btn-sm btn-primary">Download Invoice</a>                        	
                         <a href="<c:url value="/bookingcontroller/cancel?userId=${ticket.user.id}&ticketTime=${ticket.ticketTime}"/>" class="btn btn-sm btn-danger">Cancel ticket</a>                        	
                        </td>
                         
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>