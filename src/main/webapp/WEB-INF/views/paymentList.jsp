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
    <h2 class="text-center">Payment details</h2>
    
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead class="table-info">
                <tr>
                    
                    <th>Booking Id</th>
                    <th>Amount</th>
                    <th>Payment Date</th>
                    <th>Payment method</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="payment" items="${payments}">
                    <tr>
                        <td>${payment.booking.id}</td>
                        <td>${payment.amount}</td>
                        <td>${payment.paymentDate}</td>
                        <td>${payment.paymentMethod}</td>
                        <td>${payment.status}</td>
                         
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>