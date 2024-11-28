<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
    <title>Health Charges Prediction</title>
    <style>
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
            background: white;
            color: #333;
        }

        h2 {
            font-size: 1.8em;
            margin-bottom: 20px;
            text-transform: uppercase;
            text-align: center;
            color: white;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 20px;
            margin: 20px auto;
            padding: 20px;
            max-width: 1200px;
        }

        .box {
            flex: 1;
            min-width: 300px;
            background: #3a7bd5;
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

    <div class="container">
        <!-- Form Section -->
        <div class="box form-container">
            <h2>Enter Customer Data</h2>
            <form action="predict" method="post">
                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required>
                
                <label for="sex">Sex:</label>
                <select id="sex" name="sex" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
                
                <label for="bmi">BMI:</label>
                <input type="number" step="0.1" id="bmi" name="bmi" required>
                
                <label for="children">Children:</label>
                <input type="number" id="children" name="children" required>
                
                <label for="smoker">Smoker:</label>
                <select id="smoker" name="smoker" required>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>
                
                <label for="region">Region:</label>
                <select id="region" name="region" required>
                    <option value="northwest">Northwest</option>
                    <option value="northeast">Northeast</option>
                    <option value="southwest">Southwest</option>
                    <option value="southeast">Southeast</option>
                </select>
                
                <button type="submit">Predict</button>
            </form>
        </div>

        <!-- Result Section -->
        <div class="box">
            <h2>Prediction Result</h2>
            <div class="message">
                <% 
                    Double charges = (Double) request.getAttribute("charges");
                    String error = (String) request.getAttribute("error");
                %>
                <% if (charges != null) { %>
                    <p class="success">The predicted health charges are: <strong> <%= charges %> Rupees /- </strong></p>
                <% } else if (error != null) { %>
                    <p class="error">Error: <%= error %></p>
                <% } else { %>
                    <p>No prediction available. Submit the form to get a prediction.</p>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>
