<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="css/login_styles.css">
</head>
<body>
    <div class="container">
        <!-- Agent Login Card -->
        <a href="agentlogin.jsp" class="card">
            <img src="images/131.png" alt="Student Login" class="card-image">
            <h2>Agent Login</h2>
            <p>Click here to log in as an agent.</p>
        </a>

       
        <a href="adminlogin.jsp" class="card">
            <img src="images/322.avif" alt="Student Sign Up" class="card-image">
            <h2>Admin Login</h2>
            <p>Click here to log in as an admin.</p>
        </a>
    </div>
    <!-- SweetAlert integration -->
    <input type="hidden" id="status" name="status" value="${requestScope.status}">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status === "success") {
            swal("Success", "Logged in successfully!", "success");
        } else if (status === "exists") {
            swal("Error", "Login failed!", "error");
        } else if (status === "error") {
            swal("Error", "An error occurred while processing!", "error");
        }
    </script>
    
</body>
</html>
