<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agent Availability</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    

  
  <style>
    /* General Styles */
    * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
  background: url('images/image1.png') no-repeat center center fixed;
  background-size: cover;
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  color: #fff;
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
        
    main {
      padding: 20px;
      display: flex;
      justify-content: center;
      gap: 20px;
      flex-wrap: wrap;
    }

    /* Agent Card Styles */
    .agent-card {
      background-color: rgba(255, 255, 255, 0.548);
      border-radius: 12px;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
      width: 250px;
      padding: 20px;
      text-align: center;
      cursor: pointer;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .agent-card h2 {
      margin: 0;
      font-size: 1.5em;
      color: #333;
    }

    .agent-card p {
      margin: 10px 0;
      font-size: 1.1em;
      color: #666;
    }

    .agent-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      main {
        flex-direction: column;
        align-items: center;
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
            <a href="predictionform.jsp">AI Assist</a>
            <a href="admin_side_login.jsp">Logout</a>
        </nav>
    </header>
  
  <main>
  	<div class="agent-card" onclick="redirectToPage('addplan.jsp')">
    	<h2>Add Plan</h2>
	</div>
	
	<div class="agent-card" onclick="redirectToPage('adminservices.jsp')">
    	<h2>View Plans</h2>
	</div>
	
    <div class="agent-card" onclick="redirectToPage('addagent.jsp')">
    	<h2>Add Agent</h2>
	</div>
  
    <div class="agent-card" onclick="redirectToAgentsPage()">
    	<h2>View Agents</h2>
	</div>

    <div class="agent-card" onclick="redirectToSubscribersPage()">
      <h2>Subscribers</h2>
    </div>
    
    <div class="agent-card" onclick="redirectToPage('predictionform.jsp')">
    	<h2>Predict Health Charges</h2>
	</div>

    
  </main>
  
  	<script>
    function redirectToAgentsPage() {
        // Redirect to the servlet's URL (the URL mapped to the AgentDetailsServlet)
        window.location.href = "adminviewAgents";  // Modify the URL as per your servlet mapping
    }
	</script>
	
	<script>
    function redirectToSubscribersPage() {
        window.location.href = "FetchSubscribersServlet";  
    }
	</script>
  

  <script>
    // Redirect to the respective agent's page
    function redirectToPage(pageUrl) {
      window.location.href = pageUrl;
    }
  </script>
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
