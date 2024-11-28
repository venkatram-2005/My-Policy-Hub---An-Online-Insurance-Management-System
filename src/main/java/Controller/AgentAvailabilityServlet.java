package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AgentAvailabilityServlet")
public class AgentAvailabilityServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/infy"; // Update database name
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "valluri";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String agentIdParam = request.getParameter("id") ;
        int agentId = Integer.parseInt(agentIdParam);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        RequestDispatcher dispatcher = null;
        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Update query for start_time and end_time
            String sql = "UPDATE agent SET start_time = ?, end_time = ? WHERE agent_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, startTime);
            pstmt.setString(2, endTime);
            pstmt.setInt(3, agentId);

            int rowsUpdated = pstmt.executeUpdate();

            // Set the status attribute based on the operation result
            if (rowsUpdated > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            conn.close();
            dispatcher = request.getRequestDispatcher("manageavailability.jsp");
         // Forward to confirmation page
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("status", "failed");
            e.printStackTrace(out);
            dispatcher = request.getRequestDispatcher("manageavailability.jsp");
         // Forward to confirmation page
            dispatcher.forward(request, response);
        }
    }
}
