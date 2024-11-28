package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Objects.Booking;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/fetchBookings")
public class FetchBookings extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("email"); // Get the email from request parameters
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        List<Booking> bookings = new ArrayList<>();

        try {
            // Establish the database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infy", "root", "valluri");

            // Query to fetch bookings based on user email
            String query = "SELECT * FROM booking WHERE customer_mail = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, userEmail);

            rs = pst.executeQuery();

            // Iterate through the result set and create Booking objects

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerName(rs.getString("customer_name"));
                booking.setCustomerMail(rs.getString("customer_mail"));
                booking.setCustomerPhone(rs.getString("customer_phone"));

                // Convert SQL Date to LocalDate
                Date sqlDate = rs.getDate("booking_date");
                if (sqlDate != null) {
                    booking.setBookingDate(sqlDate.toLocalDate());
                }

                // Convert the time string to LocalTime
                String timeString = rs.getString("booking_time");
                if (timeString != null && !timeString.isEmpty()) {
                    // Use a formatter to parse the time string into LocalTime
                    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                    LocalTime bookingTime = LocalTime.parse(timeString, timeFormatter);
                    booking.setBookingTime(bookingTime);
                }

                // Handle the agent_id 
                String agentId = rs.getString("agent_id");
                if (agentId != null && !agentId.isEmpty()) {
                    booking.setAgentId(Integer.parseInt(agentId));
                } else {
                    booking.setAgentId(null);
                }

                bookings.add(booking);
            }

            // Set the list of bookings as a request attribute
            request.setAttribute("bookings", bookings);

            // Forward to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewBookings.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
