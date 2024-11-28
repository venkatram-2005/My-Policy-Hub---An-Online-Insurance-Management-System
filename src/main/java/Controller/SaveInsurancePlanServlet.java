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

@WebServlet("/SaveInsurancePlanServlet")
public class SaveInsurancePlanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form data
        String planCategory = request.getParameter("plan_category");
        String planName = request.getParameter("plan_name");
        String planDesc = request.getParameter("plan_desc");
        String planTier = request.getParameter("plan_tier");
        String ageGroup = request.getParameter("age_group");
        String planForGender = request.getParameter("plan_for_gender");
        double premium = Double.parseDouble(request.getParameter("premium"));
        double coverageAmount = Double.parseDouble(request.getParameter("coverage_amount"));
        String planStatus = request.getParameter("plan_status");

        // Database connection
        String jdbcURL = "jdbc:mysql://localhost:3306/infy";
        String dbUser = "root";
        String dbPassword = "valluri";
        RequestDispatcher dispatcher = null;
        try {
            // Load JDBC driver (optional for some setups)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Insert data into the database
            String sql = "INSERT INTO insurance_plans (plan_category, plan_name, plan_desc, plan_tier, age_group, "
                       + "plan_for_gender, premium, coverage_amount, plan_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, planCategory);
            statement.setString(2, planName);
            statement.setString(3, planDesc);
            statement.setString(4, planTier);
            statement.setString(5, ageGroup);
            statement.setString(6, planForGender);
            statement.setDouble(7, premium);
            statement.setDouble(8, coverageAmount);
            statement.setString(9, planStatus);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
            	request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("addplan.jsp");
                dispatcher.forward(request, response);
            }
            
            
            // Close connection
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
            dispatcher = request.getRequestDispatcher("addplan.jsp");
            dispatcher.forward(request, response);
            
        }
        
    }
}
