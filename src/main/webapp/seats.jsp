<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flight Seat Selection</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
        .seat {
            width: 50px;
            height: 50px;
            margin: 5px;
            text-align: center;
            line-height: 50px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .seat.available {
            background-color: #28a745;
            color: #fff;
        }
        .seat.selected {
            background-color: #007bff;
            color: #fff;
        }
        .seat.booked {
            background-color: #6c757d;
            color: #fff;
            cursor: not-allowed;
        }
        .seat-container {
            display: flex;
            flex-wrap: wrap;
            max-width: 300px;
            margin: 0 auto;
        }
        .seat-container .col {
            display: flex;
            justify-content: center;
        }
</style>
</head>
<body>
<div class="container mt-5">
<h2 class="text-center">Select Your Seats</h2>
<div class="seat-container">
<!-- Seat Grid -->
<div class="col">
<div class="seat available" data-seat="1">1</div>
<div class="seat available" data-seat="2">2</div>
</div>
<div class="col">
<div class="seat available" data-seat="3">3</div>
<div class="seat available" data-seat="4">4</div>
</div>
<div class="col">
<div class="seat available" data-seat="5">5</div>
<div class="seat available" data-seat="6">6</div>
</div>
<div class="col">
<div class="seat available" data-seat="7">7</div>
<div class="seat available" data-seat="8">8</div>
</div>
<div class="col">
<div class="seat available" data-seat="9">9</div>
<div class="seat available" data-seat="10">10</div>
</div>
<div class="col">
<div class="seat available" data-seat="11">11</div>
<div class="seat available" data-seat="12">12</div>
</div>
<div class="col">
<div class="seat available" data-seat="13">13</div>
<div class="seat available" data-seat="14">14</div>
</div>
<div class="col">
<div class="seat available" data-seat="15">15</div>
<div class="seat available" data-seat="16">16</div>
</div>
<div class="col">
<div class="seat available" data-seat="17">17</div>
<div class="seat available" data-seat="18">18</div>
</div>
<div class="col">
<div class="seat available" data-seat="19">19</div>
<div class="seat available" data-seat="20">20</div>
</div>
</div>
<div class="text-center mt-4">
<button class="btn btn-primary" id="submitSelection">Submit Selection</button>
</div>
</div>
 
    <!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
        // JavaScript to handle seat selection
        document.querySelectorAll('.seat.available').forEach(seat => {
            seat.addEventListener('click', function() {
                if (this.classList.contains('selected')) {
                    this.classList.remove('selected');
                } else {
                    this.classList.add('selected');
                }
            });
        });
 
        document.getElementById('submitSelection').addEventListener('click', function() {
            const selectedSeats = Array.from(document.querySelectorAll('.seat.selected'))
                .map(seat => seat.getAttribute('data-seat'));
            alert('Selected seats: ' + selectedSeats.join(', '));
        });
</script>
</body>
</html>