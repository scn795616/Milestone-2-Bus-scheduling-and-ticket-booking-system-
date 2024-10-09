<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate Report</title>
<%@include file="/includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>
    <div class="container mt-5">
        <h2>Select Date to Generate Report</h2>
        <form id="reportForm">
            <div class="form-group">
                <label for="reportDate">Date:</label>
                <input type="date" class="form-control" id="reportDate" name="reportDate" required>
            </div>
            <button type="submit" class="btn btn-primary">Generate Report</button>
        </form>
        <div id="reportResults" class="mt-5">
            <!-- Report results will be displayed here -->
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#reportForm').on('submit', function(event) {
                event.preventDefault();
                $.ajax({
                    url: '<c:url value="/schedulecontroller/generate"/>',
                    type: 'GET',
                    data: $(this).serialize(),
                    success: function(response) {
                    	console.log('Response received:', response);
                        // Extract the relevant part of the response and insert it into the page
                        var reportContent = $(response).find('#reportResultsFragment').html();
                        $('#reportResults').html(reportContent);
                    },
                    error: function(xhr, status, error) {
                        alert('An error occurred while generating the report: ' + error);
                    }
                });
            });
        });
    </script>
</body>
</html>
