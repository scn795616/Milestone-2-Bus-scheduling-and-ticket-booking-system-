<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">Cargo Management System</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				 <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
			<!-- <li class="nav-item"><a class="nav-link" href="addCargo.jsp">Add Cargo</a></li> -->
				 <li class="nav-item"><a class="nav-link" href="ViewCargoServlet">View Cargo</a></li>
				 <li class="nav-item"><a class="nav-link" href="BookingServlet">View Bookings</a></li>
				 <li class="nav-item"><a class="nav-link" href="">Ship Details</a></li> 
				 <li class="nav-item"><a class="nav-link" href="InventoryServlet">View Inventory</a></li>
				 <c:choose>
					 <c:when test="${sessionScope.role=='admin'}">
						 <li class="nav-item"><a class="nav-link" href="PaymentServlet">View Payments</a></li>	
					</c:when>
				</c:choose>			  
				 <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
		 
			</ul>
		</div>
	</div>
</nav>