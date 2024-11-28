<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* General Styling */
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        
        header {
		  background-color: #007bff;
		  color: white;
		  padding: 20px;
		  display: flex; /* Enables flexbox for layout */
		  align-items: center; /* Vertically aligns items */
		  justify-content: space-between; /* Places the logo on the left and nav on the right */
		  width: 100%;
		  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		  margin-bottom: 10px;
		}
		.logo {
            display: inline-block;
            color: #fff;
            font-size: 24px;
            font-weight: bold;
            margin-left: 80px;
        }
        
        .logo i{
            color: white;
        }
        .logo a{
            color: white;
        }
        nav a {
            margin-left: 20px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: white; /* White Background */
            color: #333;
        }

        h2 {
            font-size: 1.8em;
            margin-bottom: 20px;
            text-transform: uppercase;
            text-align: center;
            color: blue;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            margin: 20px auto;
            padding: 20px;
            max-width: 1200px;
        }

        .box {
            flex: 1;
            min-width: 300px;
            background: #3a7bd5; /* Blue Box Background */
            color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .box table {
            width: 100%;
            border-collapse: collapse;
        }

        .box table td {
            padding: 10px 5px;
        }

        .box table td:first-child {
            font-weight: bold;
            text-align: right;
            color: white;
        }

        .box table td:last-child {
            text-align: left;
            color: white;
        }

        /* Form Styling */
        .form-container label {
            font-size: 1em;
            margin-bottom: 5px;
            display: block;
            color: #cce7ff;
        }

        .form-container input,
        .form-container select,
        .form-container button {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            font-size: 1em;
        }

        .form-container input,
        .form-container select {
            background: white;
            color: #333;
        }

        .form-container input:focus,
        .form-container select:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        }

        .form-container button {
            background: #0056b3;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .form-container button:hover {
            background: #003f7f;
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
        }
        
        /* Popup Overlay */
		.popup-overlay {
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.6); /* Slightly darker overlay */
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    z-index: 1000;
		}
		
		/* Popup Content */
		.popup-content {
		    text-align: center;
		    background: #fff;
		    width: 400px; /* Increased width */
		    height: 200px; /* Increased height */
		    padding: 20px;
		    border-radius: 12px; /* Slightly rounder corners */
		    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Stronger shadow */
		    display: flex;
		    flex-direction: column;
		    justify-content: center; /* Center content vertically */
		    align-items: center; /* Center content horizontally */
		}
		
		/* Loader Animation */
		.loader {
		    border: 6px solid #f3f3f3; /* Slightly thicker border */
		    border-top: 6px solid #3498db; /* Blue color for spinning part */
		    border-radius: 50%;
		    width: 50px; /* Larger loader */
		    height: 50px;
		    animation: spin 1s linear infinite;
		    margin-bottom: 15px; /* Add space below the loader */
		}
		
		@keyframes spin {
		    0% {
		        transform: rotate(0deg);
		    }
		    100% {
		        transform: rotate(360deg);
		    }
		}
		
		/* Popup Text */
		.popup-content p {
		    font-size: 18px; /* Larger font size */
		    color: #333; /* Darker text color */
		    margin: 0;
		}

        
    </style>
</head>
<body>

	<header>
        <div class="logo"><i class="fa-solid fa-heart-pulse"></i> My Policy Hub</div>
        <nav>
        	<a href="home.jsp">Home</a>
            <a href="services.jsp">View Plans</a>
            <a href="booking.jsp">Booking</a>
            <a href="enterEmail.jsp">Appointments</a>
            <a href="contact.html">Contact</a>
            <a href="help.html">Help</a>
            <a href="login.jsp">Logout</a>
        </nav>
    </header>

    
    <div class="container">
        <!-- Plan Details -->
        <div class="box">
            <h3>Plan Details</h3>
            <table>
                <tr>
                    <td>Plan Name:</td>
                    <td>${selectedPlan.planName}</td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td>${selectedPlan.planDesc}</td>
                </tr>
                <tr>
                    <td>Tier:</td>
                    <td>${selectedPlan.planTier}</td>
                </tr>
                <tr>
                    <td>Age Group:</td>
                    <td>${selectedPlan.ageGroup}</td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>${selectedPlan.planForGender}</td>
                </tr>
                <tr>
                    <td>Premium:</td>
                    <td>₹${selectedPlan.premium}</td>
                </tr>
                <tr>
                    <td>Coverage:</td>
                    <td>₹${selectedPlan.coverageAmount}</td>
                </tr>
            </table>
        </div>

        <!-- Customer Details -->
        <div class="box">
            <h3>Customer Details</h3><br>
            <form class="form-container">
                <input type="hidden" name="planId" value="${selectedPlan.planId}" />
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required />
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required />
                
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required />
                
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required />
                
                <label for="paymentMode">Payment Mode:</label>
                <select id="paymentMode" name="paymentMode">
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                    <option value="Net Banking">Net Banking</option>
                </select>
                
                <button type="submit">Proceed to Pay</button>
            </form>
        </div>
    </div>
    
    <!-- Loading Popup -->
<div id="loadingPopup" class="popup-overlay" style="display: none;">
    <div class="popup-content">
        <div class="loader"></div>
        <p>Processing Payment, please wait...</p>
    </div>
</div>
<script>
    document.querySelector('form').addEventListener('submit', function (event) {
        // Prevent form submission for demonstration
        event.preventDefault();

        // Show the loading popup
        document.getElementById('loadingPopup').style.display = 'flex';

       
        setTimeout(() => {
            // Hide the loading popup after delay (you can replace this with actual redirection logic)
            alert('Payment Processing....!');
            document.getElementById('loadingPopup').style.display = 'none';
        }, 30000);
    });
</script>

</body>
</html>
