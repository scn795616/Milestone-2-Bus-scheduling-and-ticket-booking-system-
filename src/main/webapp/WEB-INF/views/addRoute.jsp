<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Route details</title>
<%@include file="/includes/header.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

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
                <h2><i class="fas fa-bus"></i>Add route details</h2>
            </div>
            <div class="card-body">
            <form action="<c:url value="/routecontroller/routes"/>" modelAttribute="addingRoute" method="post" id="registrationForm">
            <div class="form-group">
                <label for="source"><i class="fa-solid fa-map-marker-alt"></i> Source:<span> *</span></label>
                <input type="text" class="form-control" id="source" name="source" placeholder="Enter the source" required>
                <div class="error" id="sourceError"></div>
            </div>
            <div class="form-group">
                <label for="destination"><i class="fa-solid fa-flag-checkered"></i> Destination:<span> *</span></label>
                <input type="text" class="form-control" id="destination" name="destination" placeholder="Enter the destination" required>
                <div class="error" id="destinationError"></div>
            </div>
            <div class="form-group">
                <label for="distance"><i class="fas fa-clipboard"></i> Distance:<span> *</span></label>
                <input type="number" class="form-control" id="distance" name="distance" placeholder="Enter the distance" oninput="calculatePrice()" required>
                <div class="error" id="distanceError"></div>
            </div>
            <div class="form-group">
                <label for="price"><i class="fas fa-clipboard"></i> Price:<span> *</span></label>
                <input type="text" class="form-control" id="price" name="price" readonly>
                <div class="error" id="typeError"></div>
            </div>
            
            <div class="form-group">
                <label for="duration"><i class="fas fa-clipboard"></i> Duration:<span> *</span></label>
                <input type="number" class="form-control" id="duration" name="duration">
                <div class="error" id="durationError"></div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-custom"><i class="fas fa-bus"></i> Add</button>
            </div>
        </form>
    </div>
    </div>
   
</div>

	<script>
    document.getElementById('source').addEventListener('blur', validateSource);
    document.getElementById('destination').addEventListener('blur', validateDestination);

	function validateSource() {
        const source = document.getElementById('source').value;
        if (/\d/.test(source)) {
            document.getElementById('sourceError').innerText = 'Source name should not contain digits.';
        } else if (source.length < 4 || source.length > 20) {
            document.getElementById('sourceError').innerText = 'Source name should contain minimum 3 and maximum 20 characters.';
        }else {
            document.getElementById('sourceError').innerText = '';
        }
    }
	
	function validateDestination() {
        const destination = document.getElementById('destination').value;
        if (/\d/.test(destination)) {
            document.getElementById('destinationError').innerText = 'Destination name should not contain digits.';
        } else if (destination.length < 4 || destination.length > 20) {
            document.getElementById('destinationError').innerText = 'Destination name should contain minimum 3 and maximum 20 characters.';
        } else {
            document.getElementById('destinationError').innerText = '';
        }
    }
	
	function calculatePrice() {
        var distance = document.getElementById("distance").value;
        var price = distance * 4;
        document.getElementById("price").value = price;
    }
	
	document.getElementById('registrationForm').addEventListener('submit', function(event) {
		validateSource();
		validateDestination(); // Validate bus number on submit

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