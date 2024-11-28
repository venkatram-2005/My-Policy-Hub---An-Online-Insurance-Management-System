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
      background: url('images/14.avif') no-repeat center center;
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
    
    label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        select, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        nav a {
            margin-left: 20px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
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
        <h1>Set Agent Status</h1>
        <form action="SetAgentStatusServlet" method="post">
        
        	<label for="id">Agent ID:</label>
      		<input type="number" id="id" name="id" required>
        
            <label for="status">Select Status:</label>
            <select id="status" name="status" required>
                <option value="">-- Select Status --</option>
                <option value="Available">Available</option>
                <option value="Not Available">Not Available</option>
                <option value="Busy">Busy</option>
            </select>
            <button type="submit">Update Status</button>
        </form>
    </div>
</main>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    const status = '${requestScope.status}';
    if (status === "success") {
        swal("Success", "Status updated successfully!", "success");
    } else if (status === "error") {
        swal("Error", "Failed to update status. Try again.", "error");
    }
</script>

</body>
</html>
