<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    /* General Styles */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f6f9;
      color: #333;
    }

    header {
      background: linear-gradient(135deg, #004085, #007bff);
      color: white;
      padding: 40px;
      text-align: center;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      border-bottom: 4px solid #003366;
    }

    h1 {
      margin: 0;
      font-size: 3em;
      letter-spacing: 1px;
    }
    
    nav a {
            margin-left: 20px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

    main {
      padding: 40px 20px;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-evenly;
      gap: 30px;
    }

    /* Dashboard Card Styles */
    .dashboard-card {
      background-color: white;
      border-radius: 12px;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
      width: 280px;
      padding: 30px;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
      cursor: pointer;
      position: relative;
      overflow: hidden;
    }

    .dashboard-card h2 {
      font-size: 1.9em;
      margin-bottom: 15px;
      color: #333;
    }

    .dashboard-card p {
      font-size: 1.1em;
      margin: 10px 0;
      color: #666;
    }

    .dashboard-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
      background-color: #f7f9fc;
    }

    .dashboard-card .icon {
      font-size: 3em;
      margin-bottom: 20px;
      transition: transform 0.3s ease;
    }

    .dashboard-card:hover .icon {
      transform: scale(1.1);
    }

    /* Section Colors */
    .life-insurance .icon { color: #17a2b8; }
    .health-insurance .icon { color: #28a745; }
    .vehicle-insurance .icon { color: #ffc107; }
    .home-insurance .icon { color: #dc3545; }

    footer {
      position: fixed ;
      bottom: 0; 
      width:100% ;
      text-align: center;
      padding: 15px 0;
      background-color: #004085;
      color: white;
      margin-top: 40px;
      box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.1);
    }

    footer p {
      margin: 0;
      font-size: 1.2em;
    }
    
    /* Style for the buttons */
	.dashboard-card button {
	    background-color: #007BFF; /* Blue color */
	    color: white;             /* White text */
	    border: none;             /* Remove borders */
	    padding: 10px 20px;       /* Padding for the button */
	    font-size: 16px;          /* Font size */
	    border-radius: 5px;       /* Rounded corners */
	    cursor: pointer;          /* Pointer cursor on hover */
	    transition: background-color 0.3s ease; /* Smooth hover effect */
	}
	
	/* Hover effect */
	.dashboard-card button:hover {
	    background-color: #0056b3; /* Darker blue on hover */
	}
	
	/* Button alignment */
	.dashboard-card {
	    text-align: center; /* Center the button and text in the card */
	}
    

    /* Responsive Design */
    @media (max-width: 768px) {
      main {
        padding: 20px;
        flex-direction: column;
        align-items: center;
      }

      .dashboard-card {
        width: 100%;
        max-width: 350px;
        margin-bottom: 20px;
      }
    }
  </style>
</head>
<body>
  <header>
    <h1>Insurance Services</h1>
    	<nav>
        	<a href="home.jsp">Home</a>
            <a href="services.jsp">View Plans</a>
            <a href="booking.jsp">Booking</a>
            <a href="enterEmail.jsp">Appointments</a>
            <a href="login.jsp">Logout</a>
        </nav>
  </header>
  
  <main>
    <form action="InsurancePlansServlet" method="GET" class="dashboard-card life-insurance">
      <input type="hidden" name="plan_category" value="Life">
      <div class="icon"><i class="fas fa-heart"></i></div>
      <h2>Life Insurance</h2>
      <p>Policies: 500</p>
      <p>Claims: 30</p>
      <button type="submit">View Plans</button>
    </form>

    <form action="InsurancePlansServlet" method="GET" class="dashboard-card health-insurance">
      <input type="hidden" name="plan_category" value="Health">
      <div class="icon"><i class="fas fa-hospital"></i></div>
      <h2>Health Insurance</h2>
      <p>Policies: 300</p>
      <p>Claims: 25</p>
      <button type="submit">View Plans</button>
    </form>

    <form action="InsurancePlansServlet" method="GET" class="dashboard-card vehicle-insurance">
      <input type="hidden" name="plan_category" value="Vehicle">
      <div class="icon"><i class="fas fa-car"></i></div>
      <h2>Vehicle Insurance</h2>
      <p>Policies: 400</p>
      <p>Claims: 50</p>
      <button type="submit">View Plans</button>
    </form>

    <form action="InsurancePlansServlet" method="GET" class="dashboard-card home-insurance">
      <input type="hidden" name="plan_category" value="Home">
      <div class="icon"><i class="fas fa-home"></i></div>
      <h2>Home Insurance</h2>
      <p>Policies: 200</p>
      <p>Claims: 15</p>
      <button type="submit">View Plans</button>
    </form>
  </main>
  
  <footer>
    <p>&copy; 2024 Insurance Management System</p>
  </footer>
  
 	 

</body>
</html>
