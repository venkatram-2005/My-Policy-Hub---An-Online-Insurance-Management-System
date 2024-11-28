<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agent Details</title>
    <link href="css/viewAgents_styles.css" rel="stylesheet" />
</head>
<body>
    <h1>Available Agents</h1>
    <div class="agent-container">
        <%
            // Fetch the ResultSet from the request
            ResultSet rs = (ResultSet) request.getAttribute("agentsResult");

            // Loop through the ResultSet to display agent data
            while (rs != null && rs.next()) {
                String status = rs.getString("status");
        %>
        <div class="agent-card">
		    <h3><%= rs.getString("name") %></h3>
		    <p><strong>Agent ID:</strong> <%= rs.getString("agent_id") %></p>
		    <p><strong>Gender:</strong> <%= rs.getString("gender") %></p>
		    <p><strong>Languages Known:</strong> <%= rs.getString("languages_known") %></p>
		    <p><strong>Location:</strong> <%= rs.getString("location") %></p>
		    <p><strong>Working Hours:</strong> <%= rs.getTime("start_time") %> - <%= rs.getTime("end_time") %></p>
		    <p><strong>Status:</strong> <%= status %></p>
		
		    <!-- Add on submit event to trigger AJAX function -->
		    <form  action="deleteAgent" method="post">
		        <input type="hidden" name="agentId" value="<%= rs.getInt("agent_id") %>">
				<button type="submit" class="btn" style= "background-color: red; color: white;width: 100%;
    padding: 12px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-align: center;
    margin-top: 10px;" >Delete
				</button>
		    </form>
		</div>

		

        <%
            }
        %>
    </div>
    <!-- SweetAlert integration -->
    <input type="hidden" id="status" name="status" value="${requestScope.status}">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status === "success") {
            swal("Success", "Agent Deleted Successfully!", "success");
        } else if (status === "exists") {
            swal("Error", "Login failed!", "error");
        } else if (status === "error") {
            swal("Error", "An error occurred while processing!", "error");
        }
    </script>
	
</body>
</html>
