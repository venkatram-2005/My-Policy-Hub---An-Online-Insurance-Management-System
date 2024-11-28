<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
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

        .breadcrumb {
            background-color: #f8f8f8;
            padding: 10px;
            text-align: right;
        }

        main {
            display: flex;
            justify-content: space-between;
            padding: 50px 100px;
        }

        .image-container {
            flex: 1;
            background: url('images/111.jpg') no-repeat center center;
            background-size: cover;
            margin-top: 50px;
            height: 90%;
            min-height: 500px;
        }

        .form-section {
            flex: 1;
            max-width: 400px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.626);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-left: 20px;
            margin-top: -15px;
            margin-bottom: 50px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #1870f5;
        }

        p {
            color: #555;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        form input, form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        form textarea {
            height: 100px;
        }

        button {
            width: 100%;
            background-color: #1870f5;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #105bbf;
        }

        .extra-options {
            margin-top: 10px;
            text-align: center;
        }

        .extra-options a {
            color: #1870f5;
            text-decoration: none;
            font-size: 14px;
        }

        .extra-options a:hover {
            text-decoration: underline;
        }

        #message {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo"><i class="fa-solid fa-heart-pulse"></i> My Policy Hub</div>
        <nav>
            <a href="index.html">Home</a>
            <a href="custlogin.jsp">Login</a>
        </nav>
    </header>

    

    <main>
        <div class="image-container"></div>
        <div class="form-section">
            <h2>Customer Registration</h2>
            
            <form id="registrationForm" action="register" method="POST">
                <!-- Name -->
                <input type="text" id="name" name="name" placeholder="Your Name" required>
    
                <!-- Date of Birth -->
                <input type="date" id="dob" name="dob" placeholder="Date of Birth" required>
                
                <!-- Email -->
                <input type="email" id="email" name="email" placeholder="Your Email" required 
                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" 
                       title="Email must follow the proper format (e.g., example@example.com)">
    
                <!-- Phone Number -->
                <input type="tel" id="phone_number" name="phone_number" placeholder="Phone Number" required 
                       pattern="[0-9]{10}" 
                       title="Phone number must be exactly 10 digits">
    
                <!-- Address -->
                <textarea id="address" name="address" placeholder="Your Address" required></textarea>
    
                <!-- Password -->
                <input type="password" id="password" name="password" placeholder="Password" required
                       pattern="(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}" 
                       title="Password must be at least 8 characters long, contain one uppercase letter, one digit, and one special character.">
    
                <!-- Confirm Password -->
                <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required>
    
                <button type="submit">Register</button>
                <a href="custlogin.jsp" class="account" style="padding-top: 10px;">Already have an account?</a>
            </form>
            <p id="message" class="error"></p>
        </div>
    </main>
    
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
