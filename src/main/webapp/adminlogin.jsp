<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login</title>
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

        
        .logo i{
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

        .login-section {
    flex: 1;
    max-width: 400px;
    padding: 20px;
    background: rgba(255, 255, 255, 0.626);
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin-left: 20px;
    margin-top: 50px;
    margin-bottom: 160px;
}

.login-section h1 {
    font-size: 24px;
    margin-bottom: 40px; /* Reduced margin for better spacing */
    color: #1870f5;
    margin-left: 0; /* Removed unnecessary left margin */
}

form {
    display: flex;
    flex-direction: column;
     /* Center form elements horizontally */
}

form input {
    width: 100%; /* Ensure inputs span the width of the form */
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    font-size: 16px;
}
.forgot-passwords {
            
            text-align: right;
    color: #1870f5;
    text-decoration: none;
    font-size: 14px;
    margin-bottom: 30px;
}
form button {
    width: 100%; /* Ensure button matches the width of inputs */
    background-color: #1870f5;
    color: white;
    border: none;
    padding: 10px;
    cursor: pointer;
    font-size: 16px;
   
}

        
        
        
        
        .forgot-password {
            margin-top: 20px;
            text-align: center;
    color: #1870f5;
    text-decoration: none;
    font-size: 14px;
    margin-bottom: 40px;
}

.forgot-password:hover {
    text-decoration: underline;
}
.image-container {
            flex: 1;
            background: url('images/161.webp') no-repeat center center;
            background-size: cover;
            height: 100%;
            min-height: 500px;
        }
    </style>
</head>
<body>
    <header>
        <h1 class="logo"><i class="fa-solid fa-heart-pulse"></i> My Policy Hub</h1>
        <nav>
            <a href="admin_side_login.jsp">Home</a>
            <a href="adminlogin.jsp">Login</a>
        </nav>
    </header>

    <section class="breadcrumb">
        <p>You are here / Admin / Admin Login</p>
    </section>

    <main>
        <div class="image-container"></div>
        <div class="login-section">
            <h1>ADMIN LOGIN</h1>
            <form action="adminlogin" method="post">
                <input type="text" placeholder="Username" name="name">
                <input type="password" placeholder="Password" name="password">
                <a href="forgotpassword.html" class="forgot-passwords">Forgot Password?</a>
                <button type="submit">Login</button>
            </form>
        </div>
    </main>

</body>
</html>
