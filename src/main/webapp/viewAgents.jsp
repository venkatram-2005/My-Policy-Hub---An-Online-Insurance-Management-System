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
		    <form id="agentForm<%= rs.getInt("agent_id") %>" action="<%= status.equals("Available") ? "contactAgent" : "notifyAgent" %>" method="post" onsubmit="submitForm(event, '<%= rs.getString("name") %>', <%= rs.getInt("agent_id") %>)">
		        <input type="hidden" name="agentId" value="<%= rs.getInt("agent_id") %>">
		        <button type="submit" class="agent-btn" 
			        style="<%= status.equals("Available") ? "background-color: blue; color: white;" : "background-color: lightblue; color: black; cursor: not-allowed;" %>" 
			        <%= status.equals("Available") ? "" : "disabled" %>>
    				<%= status.equals("Available") ? "Contact" : "Unavailable" %>
				</button>
		    </form>
		</div>

		<!-- Modal -->
		<div id="agentModal" class="modal">
		    <div class="modal-content">
		        <span class="close" onclick="closeModal()">&times;</span>
		        <p id="modalMessage"></p>
		    </div>
		</div>

        <%
            }
        %>
    </div>
	<script>
	    // Function to handle form submission via AJAX
	    function submitForm(event, agentName, agentId) {
	        event.preventDefault(); // Prevent form from submitting traditionally
	
	        // Show the modal first
	        showModal(agentName);
	
	        // Prepare the form data
	        var formData = new FormData(document.getElementById('agentForm' + agentId));
	
	        // Use AJAX to send the form data without refreshing the page
	        var xhr = new XMLHttpRequest();
	        xhr.open('POST', document.getElementById('agentForm' + agentId).action, true);
	        
	        xhr.onload = function() {
	            if (xhr.status === 200) {
	                // Handle response from the server (if needed)
	                console.log('Form successfully submitted!');
	                // Optionally, you can handle server response here
	            } else {
	                // Handle errors (optional)
	                console.error('An error occurred while submitting the form.');
	            }
	        };
	        
	        xhr.send(formData); // Send the form data to the server
	    }
	
	    // Function to show the modal with a custom message
	    function showModal(agentName) {
	        var modal = document.getElementById('agentModal');
	        var modalMessage = document.getElementById('modalMessage');
	        modal.style.display = "block"; // Display the modal
	        
	        // Set the message inside the modal
	        modalMessage.innerHTML = "Agent " + agentName + " will contact you soon.";
	    }
	
	    // Function to close the modal
	    function closeModal() {
	        var modal = document.getElementById('agentModal');
	        modal.style.display = "none"; // Close the modal
	    }
	</script>
</body>
</html>
