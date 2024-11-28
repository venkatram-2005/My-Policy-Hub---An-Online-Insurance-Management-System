package Controller ;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Objects.InsurancePlan;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/InsurancePlansServlet")
public class InsurancePlansServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/infy"; // Update with your DB details
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "valluri";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String planCategory = request.getParameter("plan_category");
        
        if (planCategory == null || planCategory.isEmpty()) {
            response.getWriter().write("Plan category is required.");
            return;
        }

        List<InsurancePlan> insurancePlans = getInsurancePlansByCategory(planCategory);

        // Set the insurance plans list as request attribute
        request.setAttribute("insurancePlans", insurancePlans);
        
        // Forward to the JSP page to display the plans
        RequestDispatcher dispatcher = request.getRequestDispatcher("insurancePlans.jsp");
        dispatcher.forward(request, response);
    }

    private List<InsurancePlan> getInsurancePlansByCategory(String planCategory) {
        List<InsurancePlan> insurancePlans = new ArrayList<>();
        String query = "SELECT * FROM insurance_plans WHERE plan_category = ? AND plan_status = 'Active'";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, planCategory);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int planId = resultSet.getInt("plan_id");
                String planName = resultSet.getString("plan_name");
                String planDesc = resultSet.getString("plan_desc");
                String planTier = resultSet.getString("plan_tier");
                String ageGroup = resultSet.getString("age_group");
                String planForGender = resultSet.getString("plan_for_gender");
                double premium = resultSet.getDouble("premium");
                double coverageAmount = resultSet.getDouble("coverage_amount");

                InsurancePlan plan = new InsurancePlan(planId, planCategory, planName, planDesc, planTier, ageGroup, planForGender, premium, coverageAmount);
                insurancePlans.add(plan);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return insurancePlans;
    }

}
