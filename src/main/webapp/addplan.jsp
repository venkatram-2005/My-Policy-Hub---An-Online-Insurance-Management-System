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
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input, select, textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        textarea {
            resize: vertical;
        }

        body {
            background-color: #fff;
        }

        header {
        position: fixed ; 
        top: 0 ;
        width: 100% ;
        left: 0 ;
            background-color: #1870f5;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
header h1 {
  font-size: 24px;
  font-weight: bold;
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
            background: url('images/132.jpg') no-repeat center center;
            
            background-size: cover;
            height: 100%;
            min-height: 500px;
        }
        input, select, textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding-bottom: 10px ;
        }
        textarea {
            resize: vertical;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo"><i class="fa-solid fa-heart-pulse"></i> My Policy Hub</div>
        <nav>
        	<a href="adminhome.jsp">Home</a>
            <a href="adminservices.jsp">View Plans</a>
            <a href="addplan.jsp">Add Plan</a>
            <a href="addagent.jsp">Add Agent</a>
            <a href="subscribers.jsp">Subscribers</a>
            <a href="admin_side_login.jsp">Logout</a>
        </nav>
    </header>

    <section class="breadcrumb">
        <p>You are here / Admin Home / Admin Add Plan</p>
    </section>

    <main>
        <div class="image-container"></div>
        <div class="login-section">
            <h1>ADD PLAN</h1>
            <form action="SaveInsurancePlanServlet" method="post">
            <div class="form-group">
                <label for="planCategory">Plan Category:</label>
                <input type="text" id="planCategory" name="plan_category" required>
            </div>
            <div class="form-group">
                <label for="planName">Plan Name:</label>
                <input type="text" id="planName" name="plan_name" required>
            </div>
            <div class="form-group">
                <label for="planDesc">Plan Description:</label>
                <textarea id="planDesc" name="plan_desc" rows="4"></textarea>
            </div>
            <div class="form-group">
                <label for="planTier">Plan Tier:</label>
                <select id="planTier" name="plan_tier">
                    <option value="Basic">Basic</option>
                    <option value="Bronze">Bronze</option>
                    <option value="Silver">Silver</option>
                    <option value="Gold">Gold</option>
                    <option value="Platinum">Platinum</option>
                </select>
            </div>
            <div class="form-group">
                <label for="ageGroup">Age Group:</label>
                <input type="text" id="ageGroup" name="age_group" placeholder="e.g., 18-60">
            </div>
            <div class="form-group">
                <label for="planForGender">Plan For Gender:</label>
                <select id="planForGender" name="plan_for_gender" required>
                    <option value="Both">Both</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="premium">Premium:</label>
                <input type="number" id="premium" name="premium" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="coverageAmount">Coverage Amount:</label>
                <input type="number" id="coverageAmount" name="coverage_amount" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="planStatus">Plan Status:</label>
                <select id="planStatus" name="plan_status">
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                    <option value="Discontinued">Discontinued</option>
                </select>
            </div>
            <button type="submit">Submit</button>
        </form>
        </div>
        

        
    </main>
    
    <!-- SweetAlert integration -->
    <input type="hidden" id="status" name="status" value="${requestScope.status}">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status === "success") {
            swal("Success", "Plan saved successfully!", "success");
        } else if (status === "exists") {
            swal("Error", "Login failed!", "error");
        } else if (status === "error") {
            swal("Error", "An error occurred while processing!", "error");
        }
    </script>

</body>
</html>
