package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SetAgentStatusServlet")
public class SetAgentStatusServlet extends HttpServlet {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/infy"; // Update database name
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "valluri";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve status from the form
        String status = request.getParameter("status");
        String agentIdParam = request.getParameter("id") ;
        int agentId = Integer.parseInt(agentIdParam);

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "UPDATE agent SET status = ? WHERE agent_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, status);
                preparedStatement.setInt(2, agentId);

                int rowsUpdated = preparedStatement.executeUpdate();
                if (rowsUpdated > 0) {
                    request.setAttribute("status", "success");
                } else {
                    request.setAttribute("status", "error");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
        }

        // Redirect back to JSP with SweetAlert status
        request.getRequestDispatcher("setstatus.jsp").forward(request, response);
    }
}
