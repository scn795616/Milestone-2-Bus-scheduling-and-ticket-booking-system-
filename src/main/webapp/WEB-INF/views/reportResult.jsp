<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="reportResultsFragment">
    <h2>Report for ${reportDate}</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Bus Number</th>
                <th>passenger name</th>
                <th>Seat number</th>
                <th>Source</th>
                <th>Destination</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="schedule" items="${schedules}">
                <tr>
                    <td>${schedule.booking.schedule.bus.busNumber}</td>
                    <td>${schedule.booking.passengerName}</td>
                    <td>${schedule.booking.seatNumber}</td>
                    <td>${schedule.booking.schedule.route.source}</td>
                    <td>${schedule.booking.schedule.route.destination}</td>
                    <td>${schedule.booking.schedule.arrivalTime}</td>
                    <td>${schedule.booking.schedule.departureTime}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
