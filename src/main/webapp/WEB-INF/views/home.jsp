<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Bus Booking System</title>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
   
    <%@include file="/includes/header.jsp"%>
    <style>
        .carousel-item img {
            width: 100%;
            height: 500px;
            object-fit: cover;
        }
        .card img {
            height: 200px;
            object-fit: cover;
        }
        .heading{
        text-align:center;
        background: #01AEF0;
	    border-radius: 30px;
	    padding: 6px 12px;
	    color: #FFF;
	    font-size: 0.75em;
	    font-weight: 600;
	    line-height: 1em;
	    letter-spacing: 0.01em;
	    margin-left:500px;
	    text-transform: uppercase;
        }
        
        .heading1{
            text-align: center;
		    display: block;
		    color: #1A1A1A;
		    padding-top: 12px;
		    font-size: 1.5em;
		    font-weight: 600;
		    line-height: 2em;
		    letter-spacing: 0.01em;
		    margin-left: 30px;
        }
        
         .datepicker-container {
            position: relative;
        }
        .datepicker {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1050;
        }
    </style>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://pocketpassport-prelive-marketing.s3.us-west-2.amazonaws.com/wp-content/uploads/2021/02/15191022/Talking-About-Transportation.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Welcome to Bus Booking System</h5>
                    <p>Book your bus tickets easily and quickly.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://th.bing.com/th/id/OIP.1k8wG3Kba6qvckemwGD7LgHaE8?rs=1&pid=ImgDetMain" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Comfortable and Safe Journeys</h5>
                    <p>Experience the best travel with us.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://carmodyginglaw.com/wp-content/uploads/2023/10/How-Do-You-Sue-Private-Bus-Companies-scaled.jpeg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Easy Booking Process</h5>
                    <p>Book your tickets in just a few clicks.</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="container mt-5">
    	<span class="heading">Destination</span>
        <span class="heading1">Popular Destinations from Bangalore</span>
        <div class="row">
            <div class="col-md-3">
                <div class="card datepicker-container" onclick="showDatePicker('Mysore')">
                    <img src="https://www.worldatlas.com/r/w1200/upload/e5/0e/5f/shutterstock-122322643.jpg" class="card-img-top" alt="Mysore">
                    <div class="card-body">
                        <h5 class="card-title">Mysore</h5>
                        
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card datepicker-container" onclick="showDatePicker('Dharmasthala')">
                    <img src="https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/11/b7/e1/shree-rama-temple.jpg?w=1000&h=500&s=1" class="card-img-top" alt="Chennai">
                    <div class="card-body">
                        <h5 class="card-title">Dharmasthala</h5>
                
                    </div>
                </div>
            </div>
            <div class="col-md-3 ">
                <div class="card datepicker-container" onclick="showDatePicker('Kundapura')">
                    <img src="https://footloosedev.com/wp-content/uploads/marvanthe-photos.jpg" class="card-img-top" alt="Hyderabad">
                    <div class="card-body">
                        <h5 class="card-title">Kundapura</h5>
                        
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card datepicker-container" onclick="showDatePicker('Tirupati')">
                    <img src="https://assets.thehansindia.com/h-upload/2023/01/09/1329107-ttd.jpg" class="card-img-top" alt="Goa">
                    <div class="card-body">
                        <h5 class="card-title">Tirupati</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="datePickerModal" tabindex="-1" role="dialog" aria-labelledby="datePickerModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="datePickerModalLabel">Select Date</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="date" class="form-control" id="modalDatePicker">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="submitDate()">Submit</button>
                </div>
            </div>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script>
    var selectedDestination = '';

    function showDatePicker(destination) {
        selectedDestination = destination;
        const today = new Date();
        const nextWeek = new Date();
        nextWeek.setDate(today.getDate() + 7);

        const formattedToday = today.toISOString().split('T')[0];
        const formattedNextWeek = nextWeek.toISOString().split('T')[0];

        const datePicker = document.getElementById('modalDatePicker');
        datePicker.setAttribute('min', formattedToday);
        datePicker.setAttribute('max', formattedNextWeek);
        $('#datePickerModal').modal('show');
    }

    function submitDate() {
        var date = $('#modalDatePicker').val();
        if (date) {
            window.location.href = "searchBuses?destination=" + selectedDestination + "&date=" + date;
        }
    }
    
    
    
  
    </script>
</body>
</html>
