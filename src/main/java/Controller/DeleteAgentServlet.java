package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteAgent")
public class DeleteAgentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/infy";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "valluri";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String agentIdParam = request.getParameter("agentId");
        RequestDispatcher dispatcher = null;
        if (agentIdParam != null) {
            int agentId = Integer.parseInt(agentIdParam);

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Prepare SQL delete query
                String sql = "DELETE FROM agent WHERE agent_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, agentId);

                    // Execute the delete query
                    int rowsDeleted = stmt.executeUpdate();

                    if (rowsDeleted > 0) {
                    	request.setAttribute("status", "success");
                        dispatcher = request.getRequestDispatcher("agentdelresponse.jsp");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("status", "error");
                dispatcher = request.getRequestDispatcher("agentdelresponse.jsp");
                
            }
        }

        // Redirect to the agents list page (update path as needed)
        dispatcher.forward(request, response);

    }
}

