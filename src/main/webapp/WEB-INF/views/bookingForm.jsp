<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%
    	if(request.getSession().getAttribute("user")==null){
    		response.sendRedirect(request.getContextPath()+"/usercontroller/login");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Form</title>
<%@include file="/includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
     .error {
            color: red;
            font-size: 0.875rem;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>

<div class="container mt-5 d-flex justify-content-center">
    <div class="card w-50">
        <div class="card-header text-center">
            <h2>Passengers details</h2>
        </div>
        <div class="card-body">
            <form action="<c:url value="/bookingcontroller/submitBooking"/>" method="post" id="registrationForm">
                <c:forEach var="seat" items="${selectedSeats.split(',')}">
                    <div class="form-group">
                        <label for="passengerName${seat}">Passenger Name for Seat ${seat}</label>
                        <input type="text" class="form-control" id="passengerName${seat}" name="passengerNames" required>
                        <input type="hidden" name="seats" value="${seat}">
                        <label for="gender">Gender</label>
                        <select class="form-control" name="gender" id="gender">
                        	<option value="Male">Male</option>
                        	<option value="Female">Female</option>
                        	
                        </select>
                    </div>
                </c:forEach>
                <label for="price">Total price:</label>
                <input type="text" class="form-control" id="price" name="price" value="${price}" readonly>
                
                <div class="form-group">
                    <label for="paymentMethod">Payment Method:<span> *</span></label>
                    <select id="paymentMethod" name="paymentMethod" class="form-control" onchange="showPaymentDetails()">
                        <option value="">Select Payment Method</option>
                        <option value="Credit Card">Credit Card</option>
                        <option value="Debit Card">Debit Card</option>
                    </select>
                </div>
                
                <!-- Additional fields for payment details -->
                <div id="creditCardDetails" class="payment-details" style="display: none;">
                    <div class="form-group">
                        <label for="creditCardNumber">Credit Card Number:</label>
                        <input type="number" class="form-control" id="creditCardNumber" name="creditCardNumber">
                        <div class="error" id="methodError"></div>
                   
                    </div>
                </div>
                
                <div id="debitCardDetails" class="payment-details" style="display: none;">
                    <div class="form-group">
                        <label for="debitCardNumber">Debit Card Number:</label>
                        <input type="number" class="form-control" id="debitCardNumber" name="debitCardNumber">
                   		 <div class="error" id="methodError"></div>
                   		
                    </div>
                </div>
                
               
                <input type="hidden" name="scheduleId" value="${scheduleId}">
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="/includes/footer.jsp"%>

<script>

document.getElementById('creditCardNumber').addEventListener('blur', validateCredit);
document.getElementById('debitCardNumber').addEventListener('blur', validateDebit);

function validateCredit() {
    const credit = document.getElementById('creditCardNumber').value;
    if (!/^\d{16}$/.test(credit)) {
        document.getElementById('methodError').innerText = 'card number should be 16 digits.';
    } else {
        document.getElementById('methodError').innerText = '';
    }
}

function validateDebit() {
    const debit = document.getElementById('debitCardNumber').value;
    if (!/^\d{16}$/.test(debit)) {
        document.getElementById('methodError').innerText = 'Card number should be 16 digits.';
    } else {
        document.getElementById('methodError').innerText = '';
    }
}

function showPaymentDetails() {
    var paymentMethod = document.getElementById('paymentMethod').value;
    var creditCardDetails = document.getElementById('creditCardDetails');
    var debitCardDetails = document.getElementById('debitCardDetails');
    
    // Hide all payment details initially
    creditCardDetails.style.display = 'none';
    debitCardDetails.style.display = 'none';
    
    // Show the relevant payment details based on the selected payment method
    if (paymentMethod === 'Credit Card') {
        creditCardDetails.style.display = 'block';
    } else if (paymentMethod === 'Debit Card') {
        debitCardDetails.style.display = 'block';
    }
}

document.getElementById('registrationForm').addEventListener('submit', function(event) {
	validatePayment();

    // Check if there are any error messages
    const errors = document.querySelectorAll('.error');
    let hasErrors = false;

    errors.forEach(function(error) {
        if (error.innerText !== '') {
            hasErrors = true; // If any error message is not empty
        }
    });

    if (!hasErrors) {
        this.submit(); // Submit the form if no errors
    } else {
        event.preventDefault(); // Prevent form submission if there are errors
    }
});
</script>
</body>

</html>
