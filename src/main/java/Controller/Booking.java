package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/booking")
public class Booking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String customerName = request.getParameter("fullName");
        String customerMail = request.getParameter("email");
        String customerPhone = request.getParameter("phoneNumber");
        String dateStr = request.getParameter("appointmentDate");
        String timeStr = request.getParameter("appointmentTime");
        String timePeriod = request.getParameter("timePeriod");
        String agentIdStr = request.getParameter("agentName"); // Optional field

        // Adjust time based on AM/PM
        if (timePeriod != null && timePeriod.equalsIgnoreCase("PM")) {
            String[] timeParts = timeStr.split(":");
            int hour = Integer.parseInt(timeParts[0]);
            if (hour != 12) { // Convert to 24-hour format
                hour += 12;
            }
            timeStr = hour + ":" + timeParts[1];
        }

        // Parse date and time
        LocalDate bookingDate = LocalDate.parse(dateStr);
        LocalTime bookingTime = LocalTime.parse(timeStr, DateTimeFormatter.ofPattern("H:mm"));

        // Convert agent ID to Integer (handle optional value)
        Integer agentId = null;
        if (agentIdStr != null && !agentIdStr.trim().isEmpty()) {
            agentId = Integer.parseInt(agentIdStr);
        }

        // Database variables
        Connection con = null;
        PreparedStatement pst = null;

        // Dispatcher for forwarding the request
        RequestDispatcher dispatcher = null;

        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infy?allowPublicKeyRetrieval=true&useSSL=false", "root", "valluri");

            // SQL query to insert booking data
            String query = "INSERT INTO booking (customer_name, customer_mail, customer_phone, booking_date, booking_time, agent_id) VALUES (?, ?, ?, ?, ?, ?)";

            // Prepare the statement
            pst = con.prepareStatement(query);
            pst.setString(1, customerName);
            pst.setString(2, customerMail);
            pst.setString(3, customerPhone);
            pst.setDate(4, java.sql.Date.valueOf(bookingDate)); // Convert LocalDate to java.sql.Date
            pst.setTime(5, java.sql.Time.valueOf(bookingTime)); // Convert LocalTime to java.sql.Time
            if (agentId != null) {
                pst.setInt(6, agentId); // Set agent ID
            } else {
                pst.setNull(6, java.sql.Types.INTEGER); // Set NULL if no agent chosen
            }

            // Execute the query
            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("booking.jsp");

            // Set success or failure message
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            // Forward to confirmation page
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
