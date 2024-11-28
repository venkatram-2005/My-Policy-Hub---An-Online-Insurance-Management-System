package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Objects.Subscriber ;

@WebServlet("/FetchSubscribersServlet")
public class FetchSubscribersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Subscriber> subscribers = new ArrayList<>();
        try {
            // Step 1: Establish connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/infy", "root", "valluri");

            // Step 2: Prepare SQL query
            String sql = "SELECT * FROM subscribers";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // Step 3: Execute the query and process the result set
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Subscriber subscriber = new Subscriber();
                subscriber.setSubscriberId(rs.getInt("subscriber_id"));
                subscriber.setFirstName(rs.getString("first_name"));
                subscriber.setLastName(rs.getString("last_name"));
                subscriber.setEmail(rs.getString("email"));
                subscriber.setPhoneNumber(rs.getString("phone_number"));
                subscriber.setGender(rs.getString("gender"));
                subscriber.setDateOfBirth(rs.getString("date_of_birth"));
                subscriber.setAddress(rs.getString("address"));
                subscriber.setSubscriptionPlanId(rs.getInt("subscription_plan_id"));
                subscriber.setSubscriptionDate(rs.getString("subscription_date"));
                subscriber.setSubscriptionStatus(rs.getString("subscription_status"));
                subscribers.add(subscriber);
            }

            // Step 4: Clean up resources
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Step 5: Set the subscriber list as a request attribute and forward to JSP
        request.setAttribute("subscribers", subscribers);
        request.getRequestDispatcher("subscribers.jsp").forward(request, response);
    }
}
