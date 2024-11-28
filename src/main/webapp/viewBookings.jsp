<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="Objects.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Booked Appointments</title>
    <style>
       
    * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
	
		header {
			top: 0 ;
			width: 100% ;
			position: fixed ;
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
	
	body::before {
	    content: "";
	    position: absolute;
	    top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    background: url('images/image1.png') no-repeat center center fixed;
	    background-size: cover;
	    background-position: center; /* Ensures the image stays centered */
	    opacity: 0.3; /* Adjust opacity to make the background image transparent */
	    z-index: -1; /* Ensure the background image stays behind the content */
	}
	
	h1 {
	    text-align: center;
	    color: #333;
	    font-size: 2.5em;
	    margin-bottom: 20px;
	    font-weight: 600;
	    text-transform: uppercase;
	    
	}
	
	/* Container */
	.table-container {
	    max-width: 1200px;
	    margin: auto;
	    padding: 20px;
	    background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
	    border-radius: 10px;
	    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	    overflow-x: auto;
	}
	
	/* Table */
	table {
	    width: 100%;
	    border-collapse: collapse;
	    margin: 20px 0;
	}


       

        th, td {
            padding: 12px 20px;
            text-align: left;
        }

        th {
            background-color: blue;
            color: white;
            text-transform: uppercase;
            font-weight: bold;
            font-size: 0.9em;
        }

        tr:nth-child(even) {
            background-color: #f8f8f8;
        }

        tr:nth-child(odd) {
            background-color: #fcfcfc;
        }

        tr:hover {
            background-color: #e8f5e9;
            transform: scale(1.01);
            transition: all 0.2s ease;
        }

        td {
            border-bottom: 1px solid #ddd;
            font-size: 0.95em;
        }

        /* Buttons */
        .delete-btn {
            background: linear-gradient(45deg, #ff6b6b, #ff4d4d);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 0.9em;
            font-weight: bold;
            text-transform: uppercase;
            box-shadow: 0 4px 8px rgba(255, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            background: linear-gradient(45deg, #ff4d4d, #d32f2f);
            box-shadow: 0 6px 12px rgba(255, 0, 0, 0.4);
        }

        /* Responsive */
        @media screen and (max-width: 768px) {
            th, td {
                font-size: 0.8em;
                padding: 10px;
            }

            h1 {
                font-size: 2em;
            }

            .delete-btn {
                padding: 6px 12px;
                font-size: 0.8em;
            }
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
            <a href="login.jsp">Logout</a>
        </nav>
	</header><br><br><br><br><br><br><br><br>
	
    <h1>Booked Appointments</h1>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Booking Date</th>
                    <th>Booking Time</th>
                    <th>Agent ID</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve the list of bookings from the servlet
                    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");

                    // Loop through the list and display the data
                    if (bookings != null && !bookings.isEmpty()) {
                        for (Booking booking : bookings) {
                %>
                <tr>
                    <td><%= booking.getBookingId() %></td>
                    <td><%= booking.getCustomerName() %></td>
                    <td><%= booking.getCustomerMail() %></td>
                    <td><%= booking.getCustomerPhone() %></td>
                    <td><%= booking.getBookingDate() %></td>
                    <td><%= booking.getBookingTime() %></td>
                    <td><%= (booking.getAgentId() != null ? booking.getAgentId() : "N/A") %></td>
                    <td>
                    <!-- Form to delete the booking -->
                    <form action="deleteBooking" method="post" style="display: inline;">
                        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                        <button type="submit" class="delete-btn">Delete</button>
                    </form>
                </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" style="text-align: center;">No appointments found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    
</body>
</html>
