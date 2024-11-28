<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agent Availability</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }
    nav a {
            margin-left: 20px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
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

    .form-container button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<header>
        <div class="logo"><i class="fa-solid fa-heart-pulse"></i> My Policy Hub</div>
        <nav>
        	<a href="agenthome.jsp">Home</a>
            <a href="setstatus.jsp">Set Status</a>
            <a href="manageavailability.jsp">Set Availability</a>
            <a href="enterid.jsp">View Appointments</a>
            <a href="admin_side_login.jsp">Logout</a>
        </nav>
    </header>

<main>
  <div class="image-container"></div>
  <div class="form-container">
    <h2>Manage Your Availability</h2>
    <form id="availabilityForm" action="AgentAvailabilityServlet" method="post">
      <label for="id">Agent ID:</label>
      <input type="number" id="id" name="id" required>
      
      <label for="startTime">Start Time:</label>
      <input type="time" id="startTime" name="startTime" required>
      
      <label for="endTime">End Time:</label>
      <input type="time" id="endTime" name="endTime" required>
      
      <button type="submit">Save Availability</button>
    </form>
  </div>
</main>

<!-- SweetAlert integration -->
    <input type="hidden" id="status" value="${requestScope.status}">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        const status = document.getElementById("status").value;
        if (status === "success") {
            swal("Success", "Availability updated successfully!", "success");
        } else if (status === "failed") {
            swal("Error", "Failed to update availability!", "error");
        }
    </script>
</body>
</html>
