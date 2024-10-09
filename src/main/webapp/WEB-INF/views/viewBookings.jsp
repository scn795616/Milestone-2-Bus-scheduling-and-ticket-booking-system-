<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Bookings</title>
<%@include file="/includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>

</head>
<body>
<%@include file="/includes/navbar.jsp"%>
	
<div class="container mt-5">
    <h2 class="text-center">Booking details</h2>
    
    <div class="row mb-3 w-50">
        <div class="col-md-8">
            <input type="text" id="filterInput" class="form-control" placeholder="Filter by Bus Number or Date">
        </div>
        <div class="col-md-4">
            <button id="downloadPdf" class="btn btn-primary">Download PDF</button>
        </div>
    </div>
   
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped" id="bookingTable">
            <thead style="background-color: #17a2b8;color:white;">
                <tr>
                    <th>Booking time</th>
                    <th>Passenger name</th>
                    <th>Seat number</th>
                    <th>Bus Number</th>
                    <th>User Name</th>
                </tr>
            </thead>
            <tbody id="bookingTableBody">
                <c:forEach var="booking" items="${bookingsList}">
                    <tr>
                        <td class="booking-time">${booking.bookingTime}</td>
                        <td>${booking.passengerName}</td>
                        <td>${booking.seatNumber}</td>
                        <td class="bus-number">${booking.schedule.bus.busNumber}</td>
                        <td>${booking.user.firstName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@include file="/includes/footer.jsp"%>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const filterInput = document.getElementById('filterInput');

    function filterRows() {
        const filterValue = filterInput.value.toLowerCase();
        const rows = document.querySelectorAll('#bookingTableBody > tr');
        
        rows.forEach(row => {
            const busNumber = row.querySelector('.bus-number').textContent.toLowerCase();
            const bookingTime = row.querySelector('.booking-time').textContent;
            const bookingDate = new Date(bookingTime).toISOString().split('T')[0]; // Format date to YYYY-MM-DD

            const matchesBusNumber = busNumber.includes(filterValue);
            const matchesDate = bookingDate.includes(filterValue);

            if (matchesBusNumber || matchesDate) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    filterInput.addEventListener('input', filterRows);

    document.getElementById('downloadPdf').addEventListener('click', function() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        doc.text("Booking Details", 20, 10);

        const table = document.getElementById('bookingTable');
        const rows = table.querySelectorAll('tr');

        let rowIndex = 20;
        rows.forEach(row => {
            if (row.style.display !== 'none') { // Only include visible rows
                const cells = row.querySelectorAll('th, td');
                let cellIndex = 20;
                cells.forEach(cell => {
                    let text = cell.textContent;
                    if (cell.cellIndex === 0 && row.rowIndex > 0) { // Assuming the first column is the booking time
                        const date = new Date(text);
                        text = date.toLocaleDateString(); // Format the date
                    }
                    doc.text(text, cellIndex, rowIndex);
                    cellIndex += 50; // Adjust the spacing between columns
                });
                rowIndex += 10; // Adjust the spacing between rows
            }
        });

        doc.save('booking-details.pdf');
    });
});
</script>

</body>
</html>
