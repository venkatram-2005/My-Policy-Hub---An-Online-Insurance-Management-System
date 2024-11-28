<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Your Appointments</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* General body and page layout */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #56ccf2, #2f80ed);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            flex-direction: column;
        }
        
        header {
        	top: 0 ;
        	position: fixed ;
        	width: 100% ;
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

        /* Header */
        h1 {
            font-size: 3rem;
            margin-bottom: 30px;
            font-weight: 600;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Form container */
        .form-container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 420px;
            text-align: center;
        }

        /* Form styling */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 1.1rem;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="email"] {
            padding: 12px 15px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="email"]:focus {
            border-color: #2f80ed;
        }

        button {
            padding: 12px 20px;
            background-color: #2f80ed;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1e66a0;
        }
        
        input[type="number"], button {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        

        

        
    </style>
</head>
<body>
	<header>
    <h1 class="logo"><i class="fa-solid fa-heart-pulse"></i> My Policy Hub</h1>
    	<nav>
        	<a href="agenthome.jsp">Home</a>
            <a href="manageavailability.jsp">Set Availability</a>
            <a href="setstatus.jsp">Set Status</a>
            <a href="enterid.jsp">Appointments</a>
            <a href="admin_side_login.jsp">Logout</a>
        </nav>
	</header>
    <h1>View Your Appointments</h1>
    <div class="form-container">
        <form action="fetchAppointments" method="get">
            <label for="email">Enter your registered ID:</label>
            <input type="number" id="id" name="id" placeholder="Enter your id" required>
            <button type="submit">Check Appointments</button>
        </form>
    </div>
    
    <!-- SweetAlert integration -->
    <input type="hidden" id="status" name="status" value="${requestScope.status}">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status === "success") {
            swal("Success", "Appointment cancelled successfully!", "success");
        } else if (status === "exists") {
            swal("Error", "Failed!", "error");
        } else if (status === "error") {
            swal("Error", "An error occurred while processing!", "error");
        }
    </script>
</body>
</html>
