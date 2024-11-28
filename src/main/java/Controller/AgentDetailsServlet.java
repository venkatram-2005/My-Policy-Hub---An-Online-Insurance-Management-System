package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewAgents")
public class AgentDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Step 1: Establish the connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infy?allowPublicKeyRetrieval=true&useSSL=false", "root", "valluri");
            
            // Step 2: Prepare SQL query to fetch agent details
            String sql = "SELECT agent_id, name, gender, languages_known, location, start_time, end_time, status FROM agent";
            pst = con.prepareStatement(sql);
            
            // Step 3: Execute the query
            rs = pst.executeQuery();
            
            // Step 4: Set the ResultSet as a request attribute for use in the JSP
            request.setAttribute("agentsResult", rs);
            
            // Step 5: Forward the request to the JSP page to display agent details
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewAgents.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle errors gracefully (e.g., logging)
        } finally {
            // Step 6: Close the database connections
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
