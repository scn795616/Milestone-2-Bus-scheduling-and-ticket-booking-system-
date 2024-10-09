<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus availability details</title>
<%@include file="/includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .seat-layout-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .seat-layout-content {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        flex-direction: column;
    }
    .row {
        display: flex;
        margin-bottom: 10px;
    }
    .col {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .seat {
        width: 30px;
        height: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 5px;
        border-radius: 5px;
        cursor: pointer;
    }
    .seat.available {
        background-color: #007bff;
        color: white;
    }
    .seat.booked {
        background-color: #dc3545;
        color: white;
        cursor: not-allowed;
    }
    .seat.selected {
        background-color: #28a745;
        color: white;
    }
    .seat.female-booked {
        background-color: pink !important;
        cursor: not-allowed;
    }
    .aisle {
        width: 30px;
        height: 30px;
        margin: 5px;
    }
    .legend {
        display: flex;
        justify-content: flex-start;
        margin-top: 20px;
    }
    .legend-item {
        display: flex;
        align-items: center;
        margin-right: 20px;
    }
    .legend-color {
        width: 20px;
        height: 20px;
        margin-right: 5px;
        border-radius: 5px;
    }
    .price-container {
        margin-left: 190px;
        display: flex;
        flex-direction: column;
        justify-content:flex-start;
        align-items: flex-start;
    }
    .price {
        font-size: 18px;
        margin-bottom: 10px;
    }
    .book-button {
        margin-top: 20px;
    }
</style>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>

<div class="container mt-5">
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead style="background-color: #17a2b8;color:white;">
                <tr>
                    <th>Bus number</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Duration(in hr)</th>
                    <th>Price</th>
                    <th>Seat available</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="schedule" items="${schedules}">
                    <tr>
                        <td>${schedule.bus.busNumber}</td>
                        <td>${schedule.departureTime}</td>
                        <td>${schedule.arrivalTime}</td>
                        <td>${schedule.route.duration}</td>
                        <td class="price">${schedule.route.price}</td>
                        <td>${schedule.bus.seat_available}</td>
                        <td><a href="javascript:void(0);" class="btn btn-sm btn-primary view-seats" data-schedule-id="${schedule.id}">view seats</a></td>
                    </tr>
                    <tr class="seat-layout" style="display: none;">
                        <td colspan="7">
                            <div class="seat-layout-container">
                                <div class="seat-layout-content">
                                    <c:set var="bookings" value="${bookingsMap[schedule.id]}" />
                                    <c:forEach var="row" begin="1" end="5">
                                        <div class="row">
                                            <c:forEach var="col" begin="1" end="2">
                                                <c:set var="seatNumber" value="${(row - 1) * 4 + col}" />
                                                <c:set var="isBooked" value="false" />
                                                <c:set var="isFemale" value="false" />
                                                <c:forEach var="booking" items="${bookings}">
                                                    <c:if test="${booking.seatNumber == seatNumber}">
                                                        <c:set var="isBooked" value="true" />
                                                        <c:if test="${booking.gender == 'Female'}">
                                                            <c:set var="isFemale" value="true" />
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="col">
                                                    <div class="seat ${isBooked ? (isFemale ? 'booked female-booked' : 'booked') : 'available'}" data-seat-number="${seatNumber}">
                                                        ${seatNumber}
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <div class="col aisle"></div>
                                            <c:forEach var="col" begin="3" end="4">
                                                <c:set var="seatNumber" value="${(row - 1) * 4 + col}" />
                                                <c:set var="isBooked" value="false" />
                                                <c:set var="isFemale" value="false" />
                                                <c:forEach var="booking" items="${bookings}">
                                                    <c:if test="${booking.seatNumber == seatNumber}">
                                                        <c:set var="isBooked" value="true" />
                                                        <c:if test="${booking.gender == 'Female'}">
                                                            <c:set var="isFemale" value="true" />
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="col">
                                                    <div class="seat ${isBooked ? (isFemale ? 'booked female-booked' : 'booked') : 'available'}" data-seat-number="${seatNumber}">
                                                        ${seatNumber}
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:forEach>
                                    <div class="legend">
                                        <div class="legend-item">
                                            <div class="legend-color" style="background-color: #007bff;"></div>
                                            <span>Available</span>
                                        </div>
                                        <div class="legend-item">
                                            <div class="legend-color" style="background-color: #dc3545;"></div>
                                            <span>Booked</span>
                                        </div>
                                        <div class="legend-item">
                                            <div class="legend-color" style="background-color: #28a745;"></div>
                                            <span>Selected</span>
                                        </div>
                                        <div class="legend-item">
                                            <div class="legend-color" style="background-color: pink;"></div>
                                            <span>Female</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="price-container">
                                    <div class="price">Total Price: $<span id="total-price" name="price">0</span></div>
                                    
                                    

                                    <form id="bookingForm" action="<c:url value="/schedulecontroller/book"/>" method="post">
                                        <input type="hidden" name="scheduleId" id="scheduleId" value="${schedule.id}">
                                        <input type="hidden" name="selectedSeats" id="selectedSeats">
                                        <input type="hidden" name="price" id="price">
                                        <button type="submit" class="btn btn-success book-button">Book</button>
                                    </form>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const viewSeatsButtons = document.querySelectorAll('.view-seats');
    
    viewSeatsButtons.forEach(button => {
        button.addEventListener('click', function() {
            const seatLayoutRow = this.closest('tr').nextElementSibling;
            const isHidden = seatLayoutRow.style.display === 'none';
            seatLayoutRow.style.display = isHidden ? 'table-row' : 'none';
            this.textContent = isHidden ? 'hide seats' : 'view seats';
        });
    });

    document.addEventListener('click', function(event) {
        if (event.target.classList.contains('seat') && !event.target.classList.contains('booked')) {
            event.target.classList.toggle('selected');
            updateTotalPrice(event.target.closest('.seat-layout'));
        }
    });

    function updateTotalPrice(seatLayout) {
        const selectedSeats = seatLayout.querySelectorAll('.seat.selected');
        const pricePerSeat = parseFloat(seatLayout.previousElementSibling.querySelector('.price').textContent);
        const totalPrice = selectedSeats.length * pricePerSeat;
        seatLayout.querySelector('#total-price').textContent = totalPrice.toFixed(2);
    }
    
 // Handle booking button click
    document.querySelectorAll('.book-button').forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault();
            const seatLayout = this.closest('.seat-layout');
            const selectedSeats = Array.from(seatLayout.querySelectorAll('.seat.selected')).map(seat => seat.dataset.seatNumber);
            if (selectedSeats.length > 0) {
                seatLayout.querySelector('#selectedSeats').value = selectedSeats.join(',');
                seatLayout.querySelector('#price').value = seatLayout.querySelector('#total-price').textContent;
                seatLayout.querySelector('#bookingForm').submit();
            } else {
                alert('Please select at least one seat.');
            }
        });
    });

    // Toggle female booked seats to pink and make them non-clickable
    document.querySelectorAll('.single-woman-btn').forEach(button => {
        button.addEventListener('click', function() {
            const seatLayout = this.closest('.seat-layout');
            const femaleSeats = seatLayout.querySelectorAll('.seat.female-booked');
            femaleSeats.forEach(seat => {
                seat.classList.add('female-booked'); // Change color and make non-clickable
            });
        });
    });
});
</script>
</body>
</html>
