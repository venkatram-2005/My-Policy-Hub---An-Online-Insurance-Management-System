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

@WebServlet("/AddAgentServlet")
public class AddAgentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        String languagesKnown = request.getParameter("languages_known");
        String location = request.getParameter("location");
        String startTime = request.getParameter("start_time");
        String endTime = request.getParameter("end_time");
        String status = request.getParameter("status");

        // Database connection
        String jdbcURL = "jdbc:mysql://localhost:3306/infy";
        String dbUser = "root";
        String dbPassword = "valluri";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Insert data into the database
            String sql = "INSERT INTO agent (name, gender, password, languages_known, location, start_time, end_time, status) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, gender);
            statement.setString(3, password);
            statement.setString(4, languagesKnown);
            statement.setString(5, location);
            statement.setString(6, startTime);
            statement.setString(7, endTime);
            statement.setString(8, status);

            int rowsInserted = statement.executeUpdate();
            

            if (rowsInserted > 0) {
                // Success: set attribute for SweetAlert
                request.setAttribute("status", "success");
            } else {
                // Failure: set attribute for SweetAlert
                request.setAttribute("status", "failure");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
        }

        // Forward to JSP for SweetAlert feedback
        RequestDispatcher dispatcher = request.getRequestDispatcher("agentfb.jsp");
        dispatcher.forward(request, response);
        
    }
}
