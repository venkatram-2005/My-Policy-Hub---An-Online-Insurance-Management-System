<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insurance Appointment Notification System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #fff;
        }

        header {
            background-color: #1870f5;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            margin-left: 80px;
        }

        .logo i {
            color: white;
        }
        
        nav a {
            margin-left: 20px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 100px;
        }

        .image-container {
            flex: 1;
            background: url('images/booking.png') no-repeat center center;
            background-size: cover;
            height: 100%;
            min-height: 500px;
        }

        .form-container {
            flex: 1;
            max-width: 400px;
            padding: 20px;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-left: 20px;
        }

        h2 {
            color: #1870f5;
            margin-bottom: 20px;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
        }

        .form-container input, .form-container button {
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        .form-container button {
            background-color: #1870f5;
            color: white;
            border: none;
            cursor: pointer;
        }

        .error-message {
            color: red;
            font-size: 0.9em;
            margin: 5px 0;
            display: none;
        }

        .form-error {
            color: red;
            font-size: 1em;
            margin-bottom: 10px;
        }

        .time-container {
            display: flex;
            gap: 5px;
        }

        .time-container input[type="text"] {
            width: 70%;
        }

        .time-container select {
            width: 30%;
            font-size: 16px;
            padding: 10px;
            height: 50px;
            box-sizing: border-box;
        }

        input::placeholder {
            color: #333;
            opacity: 1;
        }
    </style>
</head>
<body>

<header>
    <h1 class="logo"><i class="fa-solid fa-heart-pulse"></i> My Policy Hub</h1>
    	<nav>
        	<a href="home.jsp">Home</a>
            <a href="services.jsp">View Plans</a>
            <a href="booking.jsp">Booking</a>
            <a href="enterEmail.jsp">Appointments</a>
            <a href="login.jsp">Logout</a>
        </nav>
</header>

<main>
    <div class="image-container"></div>
    <div class="form-container">
        <h2>Appointment Booking</h2>
        <div id="formError" class="form-error hidden"></div>
        <form id="appointmentForm" action="booking" method="post">
    <input type="text" id="fullName" name="fullName" placeholder="Enter your full name" required>
    <input type="email" id="email" name="email" placeholder="Enter your email" required>
    <div class="error-message" id="emailError">Please enter a valid email address.</div>
    <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Enter your phone number" required>
    <div class="error-message" id="phoneError">Please enter a valid 10-digit phone number.</div>
    <input type="date" id="appointmentDate" name="appointmentDate" required>
    <div class="error-message" id="dateError">Please enter date.</div>
    
    <div class="time-container">
        <input type="text" id="appointmentTime" name="appointmentTime" placeholder="HH:MM" required>
        <select id="timePeriod" name="timePeriod">
            <option value="AM">AM</option>
            <option value="PM">PM</option>
        </select>
    </div>
    <div class="error-message" id="timeError">Please enter time.</div>
    <input type="text" id="agentName" name="agentName" placeholder="Enter your Agent id (if choosen)" required>
    <div class="error-message" id="agentError">Please enter the agent id.</div>

    <button type="submit">Book Appointment</button>
</form>

    </div>
</main>

<script>
    function isEmailValid(email) {
        const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
        return emailPattern.test(email);
    }

    function isPhoneNumberValid(phoneNumber) {
        const phonePattern = /^\d{10}$/;
        return phonePattern.test(phoneNumber);
    }

    function bookAppointment() {
        const fullName = document.getElementById("fullName").value;
        const email = document.getElementById("email").value;
        const phoneNumber = document.getElementById("phoneNumber").value;
        const appointmentDate = document.getElementById("appointmentDate").value;
        const appointmentTime = document.getElementById("appointmentTime").value;
        const timePeriod = document.getElementById("timePeriod").value;
        const agentName = document.getElementById("agentName").value;

        let valid = true;

        // Reset all error messages
        document.getElementById("formError").classList.add("hidden");
        document.getElementById("emailError").style.display = "none";
        document.getElementById("phoneError").style.display = "none";
        document.getElementById("dateError").style.display = "none";
        document.getElementById("timeError").style.display = "none";
        document.getElementById("agentError").style.display = "none";

        if (!isEmailValid(email)) {
            document.getElementById("emailError").style.display = "block";
            valid = false;
        }

        if (!isPhoneNumberValid(phoneNumber)) {
            document.getElementById("phoneError").style.display = "block";
            valid = false;
        }

        if (!appointmentDate) {
            document.getElementById("dateError").style.display = "block";
            valid = false;
        }

        if (!appointmentTime || !/^\d{1,2}:\d{2}$/.test(appointmentTime)) {
            document.getElementById("timeError").style.display = "block";
            valid = false;
        }

        if (!agentName.trim()) {
            document.getElementById("agentError").style.display = "block";
            valid = false;
        }

        
    }
</script>
	<!-- SweetAlert integration -->
    <input type="hidden" id="status" name="status" value="${requestScope.status}">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status === "success") {
            swal("Success", "Appointment booked successfully!", "success");
        } else if (status === "exists") {
            swal("Error", "Appointment already exists!", "error");
        } else if (status === "error") {
            swal("Error", "An error occurred while processing!", "error");
        }
    </script>

</body>
</html>
