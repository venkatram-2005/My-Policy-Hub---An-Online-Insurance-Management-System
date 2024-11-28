package Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import Objects.InsurancePlan;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String planId = request.getParameter("planId");
        InsurancePlan plan = null;

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infy", "root", "valluri")) {
            String sql = "SELECT * FROM insurance_plans WHERE plan_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, planId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                plan = new InsurancePlan();
                plan.setPlanId(rs.getInt("plan_id"));
                plan.setPlanName(rs.getString("plan_name"));
                plan.setPlanDesc(rs.getString("plan_desc"));
                plan.setPlanTier(rs.getString("plan_tier"));
                plan.setAgeGroup(rs.getString("age_group"));
                plan.setPlanForGender(rs.getString("plan_for_gender"));
                plan.setPremium(rs.getDouble("premium"));
                plan.setCoverageAmount(rs.getDouble("coverage_amount"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (plan != null) {
            request.setAttribute("selectedPlan", plan);
            RequestDispatcher dispatcher = request.getRequestDispatcher("payment.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Plan not found");
        }
    }
}
