package Controller ;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import Objects.Booking;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fetchAppointments")
public class FetchAppointmentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int agentId = Integer.parseInt(request.getParameter("id"));
        System.out.println("Agent id: " + agentId);
        
        List<Booking> bookings = new ArrayList<>();
        String dbURL = "jdbc:mysql://localhost:3306/infy";
        String dbUser = "root";
        String dbPassword = "valluri";

        Connection connection = null;
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            System.out.println("Database connection established.");

            // SQL query to fetch appointments
            String sql = "SELECT * FROM booking WHERE agent_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, agentId);

            ResultSet rs = preparedStatement.executeQuery();

            // Process results
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
                String agentIdP = rs.getString("agent_id");
                if (agentIdP != null && !agentIdP.isEmpty()) {
                    booking.setAgentId(Integer.parseInt(agentIdP));
                } else {
                    booking.setAgentId(null);
                }

                bookings.add(booking);
            }

            // Set the list of bookings as a request attribute
            request.setAttribute("bookings", bookings);

            // Forward to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewAppointments.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

     
    }
}
