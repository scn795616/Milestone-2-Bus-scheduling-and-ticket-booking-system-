<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add bus</title>
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
                <h2><i class="fas fa-bus"></i>Update bus details</h2>
            </div>
            <div class="card-body">
            <form action="<c:url value="/buscontroller/update?id=${id}"/>" method="post" id="registrationForm">
            <div class="form-group">
                <label for="busNumber"><i class="fas fa-bus"></i> Bus Number:<span> *</span></label>
                <input type="text" class="form-control" id="busNumber" name="busNumber" placeholder="Enter bus number" value="${busNumber}" readonly>
                <div class="error" id="busNumberError"></div>
            </div>
            <div class="form-group">
                <label for="capacity"><i class="fas fa-users"></i> Capacity:<span> *</span></label>
                <input type="number" class="form-control" id="capacity" name="capacity" placeholder="Enter bus capacity" value="${capacity}" readonly>
                <div class="error" id="capacityError"></div>
            </div>
        	<div class="form-group">
                <label for="type"><i class="fas fa-clipboard"></i> Type:<span> *</span></label>
					<select class="form-control" id="type" name="type" required>
                    	<option value="AC">AC</option>
                        <option value="Non-AC">Non-AC</option>
                </select>                <div class="error" id="typeError"></div>
            </div>
            
            <div class="form-group">
                <label for="seat_available"><i class="fas fa-clipboard"></i> Available seat:<span> *</span></label>
                <input type="text" class="form-control" id="seat_available" name="seat_available" placeholder="Enter bus type" value="${seat}" readonly>
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