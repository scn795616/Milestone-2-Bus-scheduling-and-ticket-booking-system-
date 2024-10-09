<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .navbar {
            background-color: #17a2b8; /* Bootstrap info color */
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff !important;
        }
        .nav-item .nav-link {
            color: #fff !important;
            transition: color 0.3s, background-color 0.3s, border 0.3s;
        }
        .nav-item .nav-link:hover {
            color: #17a2b8 !important;
            background-color: #fff !important;
            border-radius: 5px;
        }
        .nav-item .nav-link.active {
            color: #17a2b8 !important;
            background-color: #fff !important;
            border: 2px solid #17a2b8 !important;
            border-radius: 5px;
        }
        .navbar-toggler {
            border-color: #fff;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba%28255, 255, 255, 0.5%29' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
        .dropdown:hover .dropdown-menu {
            display: block;
            margin-top: 0; /* Remove the gap so it looks seamless */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <div class="container">
            <a class="navbar-brand" href="<c:url value="/usercontroller/home"/>"><i class="fas fa-bus"></i>Bus Booking System</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="<c:url value="/usercontroller/home"/>"><i class="fas fa-home"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value="/usercontroller/about"/>"><i class="fas fa-info-circle"></i> About</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value="/usercontroller/contact"/>"><i class="fas fa-envelope"></i> Contact Us</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="servicesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-concierge-bell"></i> Services
                        </a>
                        <div class="dropdown-menu" aria-labelledby="servicesDropdown">
                           	 <%
								 if(request.getSession().getAttribute("user")==null || request.getSession().getAttribute("role").equals("user")){
								%>
                                   <a class="dropdown-item" href="<c:url value="/buscontroller/searchbuses"/> "><i class="fas fa-search"></i></i>Search Bus</a>
                                    <a class="dropdown-item" href="<c:url value="/ticketcontroller/ticket"/>"><i class="fas fa-book"></i> View tickets</a>
                              
                              <%}
								 else{
								%>	
                               
                                 <a class="dropdown-item" href="<c:url value="/buscontroller/buses"/> "><i class="fas fa-edit"></i> View bus Details</a>
                                    <a class="dropdown-item" href="<c:url value="/routecontroller/routes"/>"><i class="fas fa-book"></i> View route details</a>
                                    <a class="dropdown-item" href="<c:url value="/schedulecontroller/schedules"/>"><i class="fas fa-bus"></i> Schedule bus</a>
                                    <a class="dropdown-item" href="<c:url value="/bookingcontroller/bookings"/>"><i class="fas fa-warehouse"></i> View Bookings</a>
<%--                                     <a class="dropdown-item" href="<c:url value="/paymentcontroller/payments"/>"><i class="fas fa-money-check-alt"></i> View Payments</a>
                             	    <a class="dropdown-item" href="<c:url value="/bookingcontroller/report"/>"><i class="fas fa-money-check-alt"></i> Reports</a>
    --%>                              
                               <%} %>
                           
                        </div>
                    </li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/usercontroller/profile"/> " ><i class="fas fa-user"></i> Profile</a></li>
                    
              		
	                
	                <%
					 if(request.getSession().getAttribute("user")==null){
					%>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/usercontroller/login"/> "><i class="fas fa-lock""></i> Login</a></li>
					<%}else{ %>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/usercontroller/logout"/> "><i class="fas fa-sign-out-alt""></i> Logout</a></li>
					<%} %>
                </ul>
            </div>
        </div>
    </nav>
	
	
	
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            var currentLocation = window.location.href;
            var menuItems = document.querySelectorAll('.nav-link');
            menuItems.forEach(function(item) {
                if (item.href === currentLocation) {
                    item.classList.add('active');
                }
            });
        });
    </script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
