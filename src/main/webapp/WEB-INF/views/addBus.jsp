<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        background-color: #17a2b8;
        border: none;
    }
    .btn-primary:hover {
        background-color: black;
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
                <h2><i class="fas fa-bus"></i>Add bus details</h2>
            </div>
            <div class="card-body">
            <form action="<c:url value="/buscontroller/buses"/>" modelAttribute="addingBus" method="post" id="registrationForm">
            <div class="form-group">
                <label for="busNumber"><i class="fas fa-bus"></i> Bus Number:<span> *</span></label>
                <input type="text" class="form-control" id="busNumber" name="busNumber" placeholder="Enter bus number" required>
                <div class="error" id="busNumberError"></div>
            </div>
            <div class="form-group">
                <label for="capacity"><i class="fas fa-users"></i> Capacity:<span> *</span></label>
                <input type="number" class="form-control" id="capacity" name="capacity" placeholder="Enter bus capacity" oninput="calculateSeat()" required>
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
                <input type="text" class="form-control" id="seat_available" name="seat_available" placeholder="Enter bus type" readonly>
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-custom"><i class="fas fa-bus"></i> Add</button>
            </div>
        </form>
    </div>
    </div>
   
</div>

<script>
document.getElementById('busNumber').addEventListener('blur', BusNumber);

function BusNumber() {
    const busNumber = document.getElementById('busNumber').value;
    const numberPattern = /^KA-\d{2} [A-Z]{2} \d{4}$/;

    if (!numberPattern.test(busNumber)) {
        document.getElementById('busNumberError').innerText = 'Bus Number should follow the pattern ex: "KA-10 BB 1234".';
    } else {
        document.getElementById('busNumberError').innerText = '';
    }
}

function calculateSeat() {
    var capacity = document.getElementById("capacity").value;
    var seat = capacity;
    document.getElementById("seat_available").value = seat;
}

document.getElementById('registrationForm').addEventListener('submit', function(event) {
    BusNumber(); // Validate bus number on submit

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