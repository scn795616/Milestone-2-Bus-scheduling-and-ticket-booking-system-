<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Success page</title>
<%@include file="/includes/header.jsp"%>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Trigger the modal with a button (for demonstration purposes) -->
    <script>
    $(document).ready(function() {
        $('#paymentModal').modal('show');
    });
</script>

    <!-- Modal -->
    <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-success" id="paymentModalLabel">Payment Successful</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Thank you for your payment. Your transaction has been completed successfully.</p>
                    <div class="details">
                        <p><strong>Bus number:</strong> ${num}</p>
                        <p><strong>Amount:</strong> ${pamount}</p>
                        <p><strong>Payment Method:</strong> ${method}</p>
                        <p><strong>Payment Status:</strong>Complete</p>
                        <p><strong>Payment Date:</strong> ${pdate}</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="okButton">OK</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('okButton').addEventListener('click', function() {
            window.location.href = '/BusBookingSystem/usercontroller/home';
        });
    </script>
	 <%	request.setAttribute("payment", null);
	%>
	<%@include file="/includes/footer.jsp"%>
	 

</body>
</html>