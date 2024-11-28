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

@WebServlet("/DeletePlanServlet")
public class DeletePlanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String planId = request.getParameter("planId");
        
        RequestDispatcher dispatcher = null;
        try {
            // Step 1: Establish a connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infy", "root", "valluri");
            
            // Step 2: Create SQL query to delete the record
            String sql = "DELETE FROM insurance_plans WHERE plan_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, planId);
            
            // Step 3: Execute the query
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
            	request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("adminservices.jsp");
            }

            // Step 4: Clean up resources
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            dispatcher = request.getRequestDispatcher("adminservices.jsp");
        }
        // Redirect to the agents list page (update path as needed)
        dispatcher.forward(request, response);
        
    }
}
